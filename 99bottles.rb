# 99 Bottles
# Raphael Adams

def verse(number)
  case number
  when 1
    puts "#{ number } bottle of beer on the wall,"
    puts "#{ number } bottle of beer."
    puts "Take one down and pass it around,"
    puts "no more bottles of beer on the wall."
    puts "\n"
  when 0
    number = "no more"
    puts "#{ number.capitalize } bottles of beer on the wall,"
    puts "#{ number } bottles of beer."
    puts "Go to the store and buy some more,"
    puts "99 bottles of beer on the wall."
    puts "\n"
  end
end

def song(number)
  until number < 0
    verse(number)
    number -= 1
  end
end

song(1)