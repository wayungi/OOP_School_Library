class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    # Add the rental record to the person object
    person.rentals << self

    @book = book
    # add the rental record to the book object
    book.rentals << self
  end

  def self.create_a_rental(books, persons, rentals)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}  Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date'
    rental_date = gets.chomp
    rental = Rental.new(rental_date, persons[person_index], books[book_index])
    rentals.push(rental)
    puts 'Rental created successfully'
  end
end
