# 99 Bottles
# Raphael Adams

def num_bottles(number)

  case number
  when 1
    "#{number} bottle of beer"
  when 0
    "no more bottles of beer"
  else
    "#{number} bottles of beer"
  end

end
  
def verse(number)

  beers = num_bottles(number)
  puts "#{ beers.capitalize } on the wall,"
  puts "#{ beers }."
  yield

end

def song(number)

  until number < 0

    verse(number) do

      if number == 0
        puts "Go to the store and buy some more,"
        print "#{ num_bottles(99) } "
      else
        puts "Take one down and pass it around,"
        print "#{ num_bottles(number - 1) } "  
      end
      print "on the wall.\n\n"

    end
    number -= 1

  end

end


loop do

  print "How many bottles are on the wall? "
  input = gets.chomp
  next unless input.match?(/^([0-9]?[0-9])$/)

  number = input.to_i
  song(number)
  break
  
end