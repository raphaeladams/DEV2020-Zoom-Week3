# Code Along: Reviews
# Raphael Adams

lines = []

review_file = File.open("reviews.txt") do |review_file|
    lines = review_file.readlines 
end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }

puts relevant_lines