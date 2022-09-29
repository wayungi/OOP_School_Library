class Student < Person
  attr_accessor :belongs_to

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
