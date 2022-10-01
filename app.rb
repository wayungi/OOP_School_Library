require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    @books.each { |book| puts "Title: #{book.title}  Author: #{book.author}" }
  end

  def list_all_people
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]'
    gets.chomp
    student = Student.new(age, name, '')
    @persons.push(student)
    puts 'Student created succesfully'
    puts ''
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @persons.push(teacher)
    puts 'Teacher created succesfully'
    puts ''
  end

  def create_a_person(person_type)
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(author, title)
    @books.push(book)
    puts 'Book succesfully created'
    puts ''
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}  Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date'
    rental_date = gets.chomp
    rental = Rental.new(rental_date, @persons[person_index], @books[book_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  # list all rentals for a given person id.
  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    sorted = @rentals.select { |rental| id == rental.person.id }
    sorted.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end

  #   Display all user options
  def display_user_options
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  #   sweep through user options
  def case_handler(choice)
    case choice
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
      person_type = gets.chomp
      create_a_person(person_type)
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_all_rentals
    when '7'
      puts 'Exit'
    else puts 'Invalid input'
    end
  end

  def run()
    puts 'Welcome to School Library App'
    choice = 0
    while choice != '7'
      display_user_options
      choice = gets.chomp
      case_handler(choice) if choice != '7'
    end
  end
end
