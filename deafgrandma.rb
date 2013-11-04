
RESPONSES = ["CAN'T HEAR YOU, DEAR! ((first bye))",
             "STILL CAN'T HEAR YOU, SONNY! ((second bye))",
             "OKAY, BYE! ((third bye))"
            ]
RESPONSE_UPCASE = "NO, NOT SINCE #{rand(21)+1930}, DEAR! ((upcase))"
RESPONSE_OTHER  = "EHH?? WHAT\'S THAT?? ((not upcase))"

def prompt(msg='> ')
  print msg
  gets.chomp
end

puts "HI, SONNY!\nIT'S YOUR GRANDMA."

byes=0
while (byes < 3) do
  reply = prompt
  if reply == 'BYE'
    puts RESPONSES[byes]
    byes+=1
  else
    byes = 0
    puts (reply == reply.upcase) ? RESPONSE_UPCASE : RESPONSE_OTHER
  end
end 
