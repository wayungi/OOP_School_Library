require './student'
require './teacher'
require './book'
require './rental'
require './user_options'
require './person'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # sweep through user options
  def case_handler(choice)
    case choice
    when '1'
      Book.list_all_books(@books)
    when '2'
      Person.list_all_people(@persons)
    when '3'
      print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
      person_type = gets.chomp
      @persons.push(Person.create_a_person(person_type))
    when '4'
      @books.push(Book.create_a_book)
    when '5'
      Rental.create_a_rental(@books, @persons, @rentals)
    when '6'
      Rental.list_all_rentals(@persons, @rentals)
    when '7'
      puts 'Exit'
    else puts 'Invalid input'
    end
  end

  def run()
    user_options = UserOptions.new
    puts 'Welcome to School Library App'
    choice = 0
    while choice != '7'
      # display_user_options
      user_options.display_user_options
      choice = gets.chomp
      case_handler(choice) if choice != '7'
    end
  end
end
