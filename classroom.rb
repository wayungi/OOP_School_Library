class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Add a student to the classroom
  def add_student(student)
    students.push(student)
    student.belongs = self
  end
end
