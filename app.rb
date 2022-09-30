class App
  #   def list_all_books; end

  #   def list_all_people; end

  # teacher or student, not a plain Person
  def create_a_person(person_type)
    if person_type == "1"
        print "Age:"
        age = gets.chomp
        print "Name: "
        name =  gets.chomp
        print "Has parent permission? [Y/N]"
        parent_permission = gets.chomp
    end

  end

  #   def create_a_book; end

  #   def create_a_rental; end

  # list all rentals for a given person id.
  # def list_all_rentals(id); end

  #   Display all user options
  def display_user_options
    puts 'Welcome to School Library App'
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
      puts 'List all books'
    when '2'
      puts 'List all people'
    when '3'
      print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
      person_type = gets.chomp
      create_a_person(person_type)
    when '4'
      puts 'Create a book'
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
    choice = 0
    while choice != "7"
      display_user_options
      choice = gets.chomp
      if choice != "7"
        case_handler(choice)
      end
    end
  end
end

def main
  app = App.new
  app.run
end

main
