class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = ''
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id
end
