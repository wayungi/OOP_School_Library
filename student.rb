require './person'
class Student < Person
  attr_accessor :id
  attr_reader :belongs

  def initialize(age, name, classroom, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def self.create_student
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]'

    parent_permission = true
    permission = gets.chomp
    parent_permission = false if %w[N n].include?(permission)

    Student.new(age, name, '', parent_permission)
  end

  def belongs=(classroom)
    @belongs = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
