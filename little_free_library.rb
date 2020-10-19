# Little Free Library
# Raphael Adams


def look(library)

    puts "Here are the contents of the library:"
    library.each { |book| puts "  Title: #{ book.first }, #{ book.last } pages" }

end

def take(title, library, collection)

    if library.any? { |book| book.first == title }
        desired_book = library.find { |book| book.first == title }
        collection.push(desired_book)
        library.delete_at(library.index(desired_book))
        puts "You now have #{ title } in your collection."
    else
        puts "The library doesn't have any books with the title #{ title }!"
    end

end

def place(title, library, capacity, collection)

    if library.size >= capacity
        puts "Sorry, the library is full! Not accepting any books at this time."
    elsif collection.any? { |book| book.first == title }
        desired_book = collection.find { |book| book.first == title }
        library.push(desired_book)
        collection.delete_at(collection.index(desired_book))
        puts "You have added #{ title } to the library."
    else
        puts "You don't have any books with the title #{ title }!"
    end

end


library = []
library_capacity = 18
library_capacity.times { |i| library << ["Title#{ i }", 100] }

user_books = []

exit = false
input = ""


puts "Welcome to the Little Free Library!"
until exit

    puts "What would you like to do?"
    puts "[1] Look inside the library"
    puts "[2] Take a book from the library"
    puts "[3] Place a book in the library"
    puts "[4] Exit"

    loop do
        print "Enter the number of your choice: "
        input = gets.chomp
        break if input.match?(/\A[1-4]{1}\z/)
        puts "Sorry, that choice number is invalid!"
    end

    user_choice = input.to_i

    case user_choice
    when 1
        look(library)
    when 2
        print "Enter the title of the book you want to take: "
        title = gets.chomp
        take(title, library, user_books)
    when 3
        print "Enter the title of the book you want to place: "
        title = gets.chomp
        place(title, library, library_capacity, user_books)
    when 4
        puts "See ya!"
        exit = true
    end
end
