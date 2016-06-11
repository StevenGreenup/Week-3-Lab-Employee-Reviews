
class Employee
  attr_accessor :name, :email, :phone, :salary

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
  end



end

# employee = Employee.new("Steven", "g@gmail.com", "2342", "14")
# employee = Employee.new("tim", "g@gmail.com", "2342", "14")
# employee = Employee.new("Steven", "g@gmail.com", "2342", "14")
