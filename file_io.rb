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
      data_list.each do |_rental|
        json_data << {}
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
      puts data
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
          @persons << Student.new(person['age'], person['name'], person['classroom'], person['parent_permission'])
        when 'Teacher'
          @persons << Teacher.new(person['age'], person['name'], person['specialization'])
        end
      end
      file.close
    end
    @persons
  end
end
