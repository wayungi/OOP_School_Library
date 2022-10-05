require 'json'
require './book'
require './student'
require './teacher'

class FileIO

    def self.create_hash(data_list, list_type)
        json_data = [] 
        if list_type == 'books'
          data_list.each do |item| 
            json_data << { title: item.title, author: item.author } 
          end 
        elsif list_type == 'persons'
          data_list.each do |person|
            if person.class.to_s == 'Student'
              json_data << { type: 'Student', name: person.name, id: person.id, age: person.age }
            elsif person.class.to_s == 'Teacher'
                # todo: Add specialisation to teacher
              json_data << { type: 'Teacher', name: person.name, id: person.id, age: person.age }
            end
          end
        elsif list_type == 'rentals'
          data_list.each do |rental|
            json_data << {}
          end
        end
        json_data
    end 

    def self.file_writer(file_name, data_list)
        File.write("./#{file_name}.json", JSON.pretty_generate(FileIO.create_hash(data_list, file_name)))
    end

    # def self.people_data(people)
    #   people_data_array = []
    #   people.each do |person| 
    #     francis = if person.type == 'Student'
    #         Student.new() 
    #     else
    #         Teacher.new()
    #     end
    #     people_data_array << francis 
    # end 
    #   people_data_array
    # end

    # def self.writer_people(file_name, content)
    #     File.write("./#{file_name}.json", JSON.pretty_generate(FileIO.people_data(content)))
    # end

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
        # puts data
        data.each do |person|
          if person['type'] == 'Student'
            @persons << Student.new(person['age'], person['name'], person['classroom'], person['parent_permission'])
          end
        end
        file.close
      end
      @persons
    end

    # def self.file_reader(file_name)
    #     @books = []
    #     if File.exist?("#{file_name}.json")
    #       file = File.open("#{file_name}.json", 'r')
    #       data = JSON.parse(file.read)
    #       data.each do |book|
    #         @books << Book.new(book['title'], book['author'])
    #       end
    #       file.close
    #       @books
    #     else
    #      []
    #     end
    # end

end