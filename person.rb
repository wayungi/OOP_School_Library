class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = ''
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # define getters
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end
end
