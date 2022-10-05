require 'json'
require './book'

class FileIO

    def self.books_data(books) 
        books_data_array = [] 
        books.each do |item| 
            books_data_array << { title: item.title, author: item.author } 
        end 
        books_data_array 
    end 

    def self.writer_books(file_name, content)
        File.write("./#{file_name}.json", JSON.pretty_generate(FileIO.books_data(content)))
    end

    def self.save_people(people)
        people_json_array = []
        people.each do |person|
            people_json_array << { name: person.name, id: person.id, age: person.age }
        end
        people_json_array
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


    def self.reader(file_name)
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
end