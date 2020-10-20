# Cashmoney
# Raphael Adams

change_owed = -1

loop do
  print "How much change is owed? "
  input = gets.chomp
  next unless input.match?(/^\d*\.\d*$/)
  total_cents = (input.to_f * 100).round
  change_owed = total_cents % 5 > 2 ? (total_cents/5 + 1) * 5 : (total_cents/5) * 5
  puts change_owed
  break
end