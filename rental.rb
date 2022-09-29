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
end
