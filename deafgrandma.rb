GREETING = "HI, SONNY!\nIT'S YOUR GRANDMA."
RESPONSES = ["CAN'T HEAR YOU, DEAR! ((first bye))",
             "STILL CAN'T HEAR YOU, SONNY! ((second bye))",
             "OKAY, BYE! ((third bye))"
            ]
RESPONSE_UPCASE = "NO, NOT SINCE %d, DEAR! ((heard you, she did)"
RESPONSE_OTHER  = "EHH?? WHAT\'S THAT?? ((could not hear you))"

def prompt(msg='> ')
  print msg
  gets.chomp
end

puts GREETING

byes = 0
while (byes < 3) do
  reply = prompt
  if reply == 'BYE'
    puts RESPONSES[byes]
    byes += 1
  else
    byes = 0
    puts (reply == reply.upcase) ? (RESPONSE_UPCASE % (rand(21)+1932)) : RESPONSE_OTHER
  end
end 
