require './student'
require './teacher.rb'
require './book.rb'

class App
  def initialize
    @books = []
    @persons = []
  end

  def list_all_books
    @books.each {|book| puts "Title: #{book.title}  Author: #{book.author}" }
  end

  #   def list_all_people; end

  # teacher or student, not a plain Person
  def create_a_person(person_type)
    if person_type == '1'
      print 'Age:'
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]'
      parent_permission = gets.chomp # todo: convert to boolean
      parent_permission = true
      student = Student.new(age, name, '')
      persons.push(student)
      puts "Student created succesfully"
      puts ''
    elsif person_type == "2"
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      persons.push(teacher)
      puts "Teacher created succesfully"
      puts ''
    end
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(author, title)
    @books.push(book)
    puts "Book succesfully created"
    puts ''
  end

  #   def create_a_rental; end

  # list all rentals for a given person id.
  # def list_all_rentals(id); end

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
      puts 'List all people'
    when '3'
      print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
      person_type = gets.chomp
      create_a_person(person_type)
    when '4'
      create_a_book
    when '5'
      puts 'Create a rental'
    when '6'
      puts 'List all rentals for a given person id'
    when '7'
      puts 'Exit'
    else
      puts 'Invalid input'
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

def main
  app = App.new
  app.run
end

main
