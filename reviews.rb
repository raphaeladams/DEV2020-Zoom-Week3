# Code Along: Reviews
# Raphael Adams

lines = []

review_file = File.open("reviews.txt") do |review_file|
    lines = review_file.readlines 
end

puts lines.length
