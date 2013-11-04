require 'timeout'

def kill_subprocess(command,duration,retries)
  output = ''
  tries = 1
  begin
    cmd = IO.popen(command, :err=>[:child, :out])
    Timeout.timeout(duration) do
      while (line = cmd.gets) do
        output << line
      end
    end
  rescue Timeout::Error
    $stdout.puts "Timed Out!"
    Process.kill('KILL', cmd.pid)
    $stdout.puts "Tries: #{tries}"
    tries += 1
    retry unless tries > retries
  ensure
    Process.wait(cmd.pid)
  end

  "#{command} completed"
end

