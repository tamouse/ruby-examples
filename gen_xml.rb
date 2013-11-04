
require 'builder'
require 'yaml'

@p = "wotcha"
@t = "THat's all, folks!"

@c = %Q{Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enimad
minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.}


def generate_xml()
  f = File.new('dump.xml','w')
  x = Builder::XmlMarkup.new(:target => f, :indent => 2)
  x.instruct!
  x.comment! "A test xml for test cases"
  x.FileName "#{@p}"
  x.TotalCases "#{@t}"
  x.Contents "#{@c}"
  f.close
  x
end

generate_xml()

def gen2(target=$stdout)
  xm = Builder::XmlMarkup.new(:target => target, :indent => 2)
  xm.html(lang: 'en') {
    xm.head {
      xm.meta(charset: "UTF-8")
      xm.meta(name: "description", content: "just a test")
      xm.title "hello"
    }
    xm.body {
      xm.comment! "yeah yeah"
      xm.h1 "Greetings"
      xm.p "hello world"
      xm.p "#{@c}"
    }
  }
  xm
end

gen2()
