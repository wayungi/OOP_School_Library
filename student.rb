require './person'
class Student < Person
  attr_reader :belongs

  def initialize(age, name, classroom)
    super(age, name)
    @classroom = classroom
  end

  def belongs=(classroom)
    @belongs = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
