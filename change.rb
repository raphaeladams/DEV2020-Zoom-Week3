# Cashmoney
# Raphael Adams


def count_coins(change, all_coins, total_coins)
  yield("toonies", 200)
  yield("loonies", 100)
  yield("quarters", 25)
  yield("dimes", 10)
  yield("nickels", 5)
end


change = -1
total_coins = 0
all_coins = Hash.new

loop do
  print "How much change is owed? "
  input = gets.chomp
  next unless input.match?(/^\d*\.\d*$/)
  change = (input.to_f * 100).round
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
  all_coins.each { |coin_name, num_coins| print "#{ num_coins } #{ coin_name }, " }
  print "\n"
end

puts "Total coins: #{ total_coins }"