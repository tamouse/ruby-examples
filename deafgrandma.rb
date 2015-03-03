#
# DeafGrandma - a simple REPL
# 

require 'ostruct'

class Conversation

  DEFAULT_CONVERSATION = {
    :greeting       => "HI, SONNY!\nIT'S YOUR GRANDMA.",
    :leaving        => [
      "CAN'T HEAR YOU, DEAR! ((first bye))",
      "STILL CAN'T HEAR YOU, SONNY! ((second bye))",
      "OKAY, BYE! ((third bye))"
    ],
    :heard_you      => "NO, NOT SINCE %d, DEAR! ((heard you, she did)",
    :not_heard_you  => "EHH?? WHAT\'S THAT?? ((heard you, she did not))"
  }

  DEFAULT_PROMPT = '> '

  attr_accessor :conversation, :prompt, :input, :output

  def initialize(conversation = DEFAULT_CONVERSATION, prompt = DEFAULT_PROMPT, input = $stdin, output = $stdout)
    self.conversation = OpenStruct.new(conversation)
    self.prompt = prompt
    self.input = input
    self.output = output
  end

  def send_prompt(msg='> ')
    output.print msg
    input.gets.chomp
  end

  def run!
    byes = 0

    output.puts conversation.greeting
    while (byes < max_byes) do
      reply = send_prompt(prompt)
      if reply == 'BYE'
        output.puts conversation.leaving[byes]
        byes += 1
      else
        byes = 0
        output.puts (reply == reply.upcase) ? random_response : other_response
      end
    end 
  end

  def max_byes
    conversation.leaving.size
  end
  
  def random_response
    conversation.heard_you % rand(1900...1950)
  end

  def other_response
    conversation.not_heard_you
  end
  
end

require 'rspec'
require 'yaml'

RSpec.describe Conversation do

  let(:responses) do
    YAML.load(%Q{
:greeting: greeting
:leaving:
  - leaving 1
  - leaving 2
  - leaving 3
:heard_you: "heard"
:not_heard_you: not heard
})
  end

  let(:prompt) { '' }
  let(:input) { double("stdin") }
  let(:output) { double("stdout") }


  let(:conversation) { Conversation.new(responses, prompt, input, output) }

  it "has a nice conversation with grandma" do
    allow(output).to receive(:print).with(prompt)
    expect(output).to receive(:puts).with(responses[:greeting])
    expect(input).to receive(:gets).and_return("hi, grandma")
    expect(output).to receive(:puts).with(responses[:not_heard_you])
    expect(input).to receive(:gets).and_return("HI, GRANDMA")
    expect(output).to receive(:puts).with(responses[:heard_you])
    expect(input).to receive(:gets).exactly(3).times.and_return("BYE")
    expect(output).to receive(:puts).with(responses[:leaving][0]).ordered
    expect(output).to receive(:puts).with(responses[:leaving][1]).ordered
    expect(output).to receive(:puts).with(responses[:leaving][2]).ordered
    
    conversation.run!
  end
end
