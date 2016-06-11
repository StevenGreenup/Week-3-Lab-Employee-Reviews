require 'minitest/autorun'
require 'minitest/reporters'

require './employee'
require './department'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]


class CompanyTest < Minitest::Test



  def test_dept_name
    department = Department.new("Advertising")
    assert_equal "Advertising", department.dept_name
  end

  def test_departments_can_have_employees
    advertising = Department.new("Advertising")
    steven = Employee.new("Steven", "g@gmail.com", "555-555-5555", "60_000")
    advertising.add_employee(steven)

    includes_steven = advertising.employees.include? steven
    assert_equal true, includes_steven
  end

   def test_get_department_salary
     advertising = Department.new("Advertising")
     employee1 = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
     employee2 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 80000)
     employee3 = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
     employee4 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 80000)

     advertising.add_employee(employee1)
     advertising.add_employee(employee2)
     advertising.add_employee(employee3)
     advertising.add_employee(employee4)
     advertising.total_salary
     assert_equal 280000, advertising.total_salary
   end

  def test_satasfactory?
    advertising = Department.new("Advertising")
    steven = Employee.new("Steven", "g@gmail.com", "555-555-5555", "60_000")
    advertising.add_employee(steven)

  end




end
