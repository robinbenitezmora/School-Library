class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?
end

# Try the following code:
person = Person.new(22, 'maximilianus')
 person.correct_name

 capitalizedPerson = CapitalizeDecorator.new(person)
 capitalizedPerson.correct_name
 
 capitalizedTrimmerPerson = TrimmerDecorator.new(capitalizedPerson)
 capitalizedTrimmerPerson.correct_name
