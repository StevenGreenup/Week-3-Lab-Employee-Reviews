
class Employee
  attr_accessor :name, :email, :phone, :salary, :grade

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @grade = []
  end

  def give_review(review)
     review
  end

  def give_raise(input)
    @salary = @salary + input
  end

  def working(grade)
      @grade << grade
    if grade == "a+"
      return "#{@name} is performing well above expectations"
    elsif grade == "a"
      return "#{@name} is performing above expectations"
    elsif grade == "b"
      return "#{@name} is meeting expectations"
    elsif grade == "c"
      return "#{@name} needs improvement"
    elsif grade == "d"
      return "#{@name} needs to be given a warning about improvement, and if not corrected, FIRED!"
    elsif grade == "f"
      return "#{@name} needs to be eliminated."
    end

  end





end

# employee = Employee.new("Steven", "g@gmail.com", "2342", "14")
# employee = Employee.new("tim", "g@gmail.com", "2342", "14")
# employee = Employee.new("Steven", "g@gmail.com", "2342", "14")
