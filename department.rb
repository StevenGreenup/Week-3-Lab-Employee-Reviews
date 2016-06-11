
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

end

  # advertising = Department.new("Advertising")
  # advertising.add_employee("Dude")
  # advertising.add_employee("Dan")
  # puts advertising.dept_name
  # puts advertising.employee_list
  #
  #
  # finance = Department.new("Finance")
  # finance.add_employee("Carly")
  # finance.add_employee("Ed")
  # puts finance.dept_name
  # puts finance.employee_list
  #
  # engineering = Department.new("Engineering")
  # engineering.add_employee("blah blah")
  # puts engineering.dept_name
  # puts engineering.employee_list
