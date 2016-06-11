
class Department

  attr_accessor :dept_name, :employees

  def initialize(input)
    @dept_name = input
    @employees = []
    @total_salary = []
  end

  def add_employee(employee)
    @employees << (employee)
  end

  def total_salary
   @total_salary = @employees.map do |employee|
     employee.salary
   end
   @total_salary.reduce(:+)
  end

  def department_raise
     @employees.each do |employee|
      if employee.grade == ["a+"]
        employee.salary = employee.salary * 1.1
      elsif employee.grade == ["a"]
        employee.salary = employee.salary * 1.08
      elsif employee.grade == ["b"]
        employee.salary = employee.salary * 1.05
      elsif employee.grade == ["c"]
        employee.salary = employee.salary * 1.03
      elsif employee.grade == []
        puts "#{employee.name.upcase} NEEDS TO BE EVALUATED TO RECEIVE RAISE!"
      else
        employee.salary = employee.salary
      end
    end
  end





end
