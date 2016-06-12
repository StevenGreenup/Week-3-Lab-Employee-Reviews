
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

  def department_raise(raise)
     @employees.each do |employee|
      if employee.grade == ["a"]
        employee.salary = (employee.salary + (raise * 1.1)).round(2)
      elsif employee.grade == ["b"]
        employee.salary = (employee.salary + (raise * 1.08)).round(2)
      elsif employee.grade == ["c"]
        employee.salary = (employee.salary + (raise * 1.0)).round(2)
      elsif employee.grade == []
        return "#{employee.name.upcase} NEEDS TO BE EVALUATED TO RECEIVE RAISE!"
      else
        employee.salary = (employee.salary).round(2)
      end
    end
  end

end
