class Book
  attr_accessor :author, :title
  attr_reader :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = []
  end
end
