class Employee
  attr_accessor :name, :email, :phone, :salary, :grade, :review

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @grade = []
    @review = []
  end

  def give_review(review)
     @review << review
     return review
  end

  def give_raise(input)
  @salary = (@salary + input).round(2)
  end

  def working(grade)
    @grade.clear
      @grade << grade
    if grade == "a"
      return "#{@name} is performing well above expectations."
    elsif grade == "b"
      return "#{@name} is meeting expectations, and is known to sometimes go the extra mile."
    elsif grade == "c"
      return "#{@name} is meeting expectations."
    elsif grade == "d"
      return "#{@name} needs to be given a warning about needing to improve, and if not corrected, FIRED!"
    elsif grade == "f"
      return "#{@name} needs to be eliminated."
    end

  end

end
