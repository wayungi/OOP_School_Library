require './nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def self.create_a_person(person_type)
    case person_type
    when '1'
      Student.create_student
    when '2'
      Teacher.create_teacher
    end
  end

  def self.list_all_people(persons)
    persons.each { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
  end

  def add_rental(book, date)
    @rentals << Rental.new(book, date, self)
  end

  def can_use_services?
    of_age || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age
    return true if @age >= 18

    false
  end
end
