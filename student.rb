require './person'
class Student < Person
  attr_reader :belongs

  def initialize(age, name, classroom)
    super(age, name)
    @classroom = classroom
  end

  def self.create_student
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]'
    gets.chomp
    Student.new(age, name, '')
    # student = Student.new(age, name, '')
    # @persons.push(student)
    # puts 'Student created succesfully'
    # puts ''
  end

  def belongs=(classroom)
    @belongs = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
