require './person'
class Teacher < Person
  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def self.create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, name, specialization)
    # @persons.push(teacher)
    # puts 'Teacher created succesfully'
    # puts ''
  end

  def can_use_services?
    true
  end
end
