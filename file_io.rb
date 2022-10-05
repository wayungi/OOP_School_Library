require 'json'
require './book'
require './student'
require './teacher'

class FileIO
  def self.create_hash(data_list, list_type)
    json_data = []
    case list_type
    when 'books'
      data_list.each do |item|
        json_data << { title: item.title, author: item.author }
      end
    when 'persons'
      data_list.each do |person|
        case person.class.to_s
        when 'Student'
          json_data << { type: 'Student', name: person.name, id: person.id, age: person.age }
        when 'Teacher'
          # TODO: Add specialisation to teacher
          json_data << { type: 'Teacher', name: person.name, id: person.id, age: person.age }
        end
      end
    when 'rentals'
      data_list.each do |rental|
        json_data << {
          date: rental.date,
          title: "TITLE",
          author: "AUTHOR",
          id: rental.person.id,
          name: "PERSON NAME",
          age: "PERSON AGE",
        }
      end
    end
    json_data
  end

  def self.file_writer(file_name, data_list)
    File.write("./#{file_name}.json", JSON.pretty_generate(FileIO.create_hash(data_list, file_name)))
  end

  def self.book_reader(file_name)
    @books = []
    if File.exist?("#{file_name}.json")
      file = File.open("#{file_name}.json", 'r')
      data = JSON.parse(file.read)
      data.each do |book|
        @books << Book.new(book['title'], book['author'])
      end
      file.close
      @books
    else
      []
    end
  end

  def self.person_reader(file_name)
    @persons = []
    if File.exist?("#{file_name}.json")
      file = File.open("#{file_name}.json", 'r')
      data = JSON.parse(file.read)
      data.each do |person|
        case person['type']
        when 'Student'
          student = Student.new(person['age'], person['name'], person['classroom'], person['parent_permission'])
          student.id = person['id']
          @persons << student
        when 'Teacher'
          teacher = Teacher.new(person['age'], person['name'], person['specialization'])
          teacher.id = person['id']
          @persons << teacher
        end
      end
      file.close
    end
    @persons
  end

  # read rentals
  def self.rentals_reader(file_name)
    @rentals = []
    if File.exist?("#{file_name}.json")
      rentals_file = File.open("#{file_name}.json")
      data = JSON.parse(rentals_file.read)
      data.each do |rental|
        single_person = Person.new(rental['age'], rental['name'])
        single_person.id = rental['id']
        single_book = Book.new(rental['author'], rental['title'])
        single_book.id = rental['id']
        single_rental = Rental.new(rental['date'], single_book, single_person)
        @rentals << single_rental
      end
      rentals_file.close
      @rentals
    end
  end

end
