puts "Are the vectors given, or do you only know coordinates?"
begin
puts "Please answer either 'given' or 'coordinates'."

answer = gets.chomp.downcase
end until answer == "coordinates" || answer == "given"
# at this point you know that answer is either coordinates or given

  if answer == "coordinates"
    puts "What is the x-value of your first coordinate for Vector A?"
    Ax1 = gets.chomp.to_i

    puts "What is the y-value of your first coordinate for Vector A?"
    Ay1 = gets.chomp.to_i

    puts "What is the x-value of your second coordinate for vector A?"
    Ax2 = gets.chomp.to_i

    puts "What is the y-value of your second coordinate for vector A?"
    Ay2 = gets.chomp.to_i
    puts

    coord_A1 = [Ax1, Ay1]
    coord_A2 = [Ax2, Ay2]

    puts "Point A1 = (#{Ax1}, #{Ay1})"
    puts "Point A2 = (#{Ax2}, #{Ay2})"

    vect_Ax = Ax2 - Ax1
    vect_Ay = Ay2 - Ay1
    vect_A  = [vect_Ax, vect_Ay]

    puts
    puts "Vector A = #{vect_A}"
    puts

    puts "What is the x-value of your first coordinate for Vector B?"
    Bx1 = gets.chomp.to_i

    puts "What is the y-value of your first coordinate for Vector B?"
    By1 = gets.chomp.to_i

    puts "What is the x-value of your second coordinate for vector B?"
    Bx2 = gets.chomp.to_i

    puts "What is the y-value of your second coordinate for vector B?"
    By2 = gets.chomp.to_i
    puts

    coord_B1 = [Bx1, By1]
    coord_B2 = [Bx2, By2]

    puts "Point B1 = (#{Bx1}, #{By1})"
    puts "Point B2 = (#{Bx2}, #{By2})"

    vect_Bx = Bx2 - Bx1
    vect_By = By2 - By1
    vect_B  = [vect_Bx, vect_By]

    puts
    puts "Vector B = #{vect_B}"
    puts
	
	else answer == "given" 
    puts   
    puts "What is vector A's x-value?"
    vect_Ax = gets.chomp.to_i

    puts "what is vector A's y-value?"
    vect_Ay = gets.chomp.to_i

    vect_A = [vect_Ax, vect_Ay]

    puts "What is vector B's x-value?"
    vect_Bx = gets.chomp.to_i

    puts "what is vector B's y-value?"
    vect_By = gets.chomp.to_i

    vect_B = [vect_Bx, vect_By]

    puts
    puts "Vector A = #{vect_A}"
    puts "Vector B = #{vect_B}"
    puts
  end

begin
puts "Do you want to find the length of Vector A, Vector B or Both? Answer 'A', 'B' or 'Both'"
answer = gets.chomp.downcase
end until answer == "a" || answer == "b" || answer == "both"

	if answer == "a"
    # The length of Vector B is still needed
    #for when the unit vector or dot product is calculted for Both vectors or vector B
		len_vect_A = Math.sqrt((vect_Ax).abs ** 2 + (vect_Ay).abs ** 2)

    len_vect_B = Math.sqrt((vect_Bx).abs ** 2 + (vect_By).abs ** 2)
    puts
		puts "The length of vector A is #{len_vect_A.round(3)}"

	elsif answer == "b"
    # The length of Vector A is still needed
    #for when the unit vector or dot product is calculted for Both vectors or vector A
    len_vect_A = Math.sqrt((vect_Ax).abs ** 2 + (vect_Ay).abs ** 2)

		len_vect_B = Math.sqrt((vect_Bx).abs ** 2 + (vect_By).abs ** 2)
    puts
		puts "The length of vector B is #{len_vect_B.round(3)}"

	else
    len_vect_A = Math.sqrt((vect_Ax).abs ** 2 + (vect_Ay).abs ** 2)
    puts
    puts "The length of vector A is #{len_vect_A.round(3)}"

    len_vect_B = Math.sqrt((vect_Bx).abs ** 2 + (vect_By).abs ** 2)
    puts
    puts "The length of vector B is #{len_vect_B.round(3)}"
  end

begin
puts
puts "Do you want to find the unit vector for Vector A, B or Both? Answer 'A', 'B' or 'Both'"
answer = gets.chomp.downcase
end until answer == "a" || answer == "b" || answer == "both"

  if answer == "a"
    puts
    puts "The unit vector in the direction of A is 1/#{len_vect_A.round(3)} * [#{vect_Ax}, #{vect_Ay}]"

  elsif answer == "b"
    puts
    puts "The unit vector in the direction of B is 1/#{len_vect_B.round(3)} * [#{vect_Bx}, #{vect_By}]"

  else
    puts
    puts "The unit vector in the direction of A is 1/#{len_vect_A.round(3)} * [#{vect_Ax}, #{vect_Ay}]"
    puts
    puts "The unit vector in the direction of B is 1/#{len_vect_B.round(3)} * [#{vect_Bx}, #{vect_By}]" 
  end

begin
puts
puts "Do you want to find the dot product of Vector A and Vector B? Answer Y or N"
answer = gets.chomp.downcase
end until answer == "y" || answer == "n"

  if answer == "y"
    dot_product = ((vect_Ax * vect_Bx) + (vect_Ay * vect_By))
    puts
    puts "The dot product of Vector A and B is: #{dot_product}"
  else answer == "n"
  end

begin
puts
puts "Do you want to find the angle between Vectors A and B? Answer Y or N"
answer = gets.chomp.downcase
end until answer == "y" || answer == "n"

  if answer == "y"
    angle_rad = Math::acos(dot_product/(len_vect_A * len_vect_B))
    angle_deg = Math::acos(dot_product/(len_vect_A * len_vect_B)) * (180/Math::PI)
    puts
    puts "The angle between Vectors A and B is: #{angle_rad.round(3)} radians"
    puts "                                             or"
    puts "                                      #{angle_deg.round(3)} degrees"
  else answer == "n"
  end



