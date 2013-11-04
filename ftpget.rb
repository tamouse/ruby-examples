#!/usr/bin/env ruby

# FTP download file and view in the browser.

begin
  require 'rubygems'
rescue LoadError
end

begin
  require "launchy" # Cross-platform gem which will open a file in the browser.
rescue LoadError
  puts "Ruby gem 'launchy' not found. Type 'gem install launchy' to install it."
  exit 1
end

require 'net/ftp' # Standard Ruby library.

# --- User configuration ---

# File to upload relative to the FTP domain address.
LOCAL_FILE = "secao1.php"

# Potential directories to upload to, in order of preference.
REMOTE_DIRS = %w<pub httpdocs .. . domains www wwwroot public_html web Web>

# ---------------------------
USAGE = "Usage: ruby #{File.basename __FILE__} LOGIN_DETAILS_FILE"

# Check that we have been given the login details.
unless ARGV.size == 1
  puts USAGE 
  exit 1
end

login_details_file = ARGV[0]

# Try to find one of the expected directories to download to.
unless File.exists? LOCAL_FILE
  puts "Could not find '#{LOCAL_FILE}'"
  exit 1
end

# Check the file they gave is really there.
unless File.exists? login_details_file
  puts "The login details file, '#{login_details_file}', does not exist."
  exit 1
end

# Read the config from the file specified by the user.
# File is expected to be in the format "domain.com:user:password"
File.read(login_details_file).each_line.with_index(1) do |line, i|
  line = line.strip
  next if line.empty?
  
  domain, username, password = line.split ":"
  unless domain && username && password
    puts "Details file, #{login_details_file}, is expected in to be in the format, 'domain.com:username:password' - error on line #{i}: #{line}"
    exit 1
  end

  # Download the file.
  begin
  Net::FTP.open domain do |ftp|
    puts "Logging in to #{domain}"
    
    begin
      ftp.login username, password
    rescue Net::FTPTempError
      puts ("** ERROR! " + "=" * 50)
      puts "** username/password not accepted"
      puts
      next
    end
    
    # Get list of files in the root directory.
    files = ftp.nlst
    
    # Pick one of the folders we want to upload to (assume at least ONE of them exists!).
    folder = (REMOTE_DIRS & files)[0]
    unless folder
      puts ("** ERROR! " + "=" * 50)
      puts "** No web folder found on this server, only: #{files.join " "}"
      puts "** Expected to find one of: #{REMOTE_DIRS.join " "}"
      puts
      next      
    end
    
    puts "Entering #{folder} directory"
    ftp.chdir folder
    
    print "Uploading file to '#{folder}/#{LOCAL_FILE}'..."
    ftp.puttextfile LOCAL_FILE
    puts "done!"
  end
  rescue
    puts "Ignoring ftp.open call error..."
  end

  # Actually open the file in the browser.
  uri = "http://#{domain}/#{LOCAL_FILE}"
  puts "Opening '#{uri}' in browser... "
  begin
    Launchy.open uri
  rescue
    puts "Problem opening uri #{uri}. Ignoring"
  end
end