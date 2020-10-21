# Cashmoney
# Raphael Adams


def count_coins(change, all_coins, total_coins)
  yield(:toonie, 200)
  yield(:loonie, 100)
  yield(:quarter, 25)
  yield(:dime, 10)
  yield(:nickel, 5)
end


change = -1
total_coins = 0
all_coins = Hash.new

loop do
  print "How much change is owed? "
  input = gets.chomp
  next unless input.match?(/^\d*\.?\d*$/)

  total_cents = (input.to_f * 100).round
  change = total_cents % 5 > 2 ? (total_cents/5 + 1) * 5 : (total_cents/5) * 5
  break
end

count_coins(change, all_coins, total_coins) do |coin_name, coin_worth|
  num_coins = change / coin_worth
  change %= coin_worth
  all_coins[coin_name] = num_coins if num_coins > 0
  total_coins += num_coins
end

if all_coins.empty?

  puts "You don’t need to dispense change."

else

  print "You need to dispense "
  all_coins.each do |coin_name, num_coins|
    
    print "#{ num_coins } #{ coin_name }"
    print "s" if num_coins > 1
    all_coins.delete(coin_name)

    if all_coins.size == 1
      print " and "
    elsif all_coins.size == 0
      print ".\n"
    else
      print ", "
    end
    
  end
end

puts "Total coins: #{ total_coins }"
