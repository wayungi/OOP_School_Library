class Book
  attr_accessor :author, :title
  attr_reader :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = []
  end

  def self.create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(author, title)
  end

  def self.list_all_books(books)
    books.each { |book| puts "Title: #{book.title}  Author: #{book.author}" }
  end

  def add_rental(date, person)
    @rentals << Rental.new(date, person, self)
  end
end
