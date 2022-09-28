class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = ''
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age || @parent_permission
  end

  private

  def of_age
    return true if @age >= 18

    false
  end
end
