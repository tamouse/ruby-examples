#!/usr/bin/env ruby

require 'fileutils'
ROOT = File.dirname(__FILE__)
LOGDIR = File.join(ROOT,'log')
LOGFILENAME = File.join(LOGDIR,'example.log')
FileUtils.mkdir_p(LOGDIR)


require 'log4r'
require 'log4r/outputter/iooutputter'
require 'log4r/formatter/patternformatter'

Log4r::Logger.root.level = Log4r::DEBUG
Log = Log4r::Logger.new('example')
Log.add Log4r::IOOutputter.new('stdout',
                               $stdout,
                               :formatter => Log4r::PatternFormatter.new(:pattern => "%m"))
Log.add Log4r::FileOutputter.new('example',
                                 :filename => LOGFILENAME,
                                 :formatter => Log4r::PatternFormatter.new(:pattern => "%-6l %d %C %g (%t) %m"))


def do_log
  Log.debug "debugging"
  Log.info "a piece of info"
  Log.warn "Danger, Will Robinson, danger!"
  Log.error "I dropped my Wookie! :("
  Log.fatal "kaboom!"
end


do_log
Log.level = Log4r::WARN
do_log
