require 'minitest/autorun'
require 'minitest/reporters'

require './employee'
require './department'
require 'pp'
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

  def test_employee_can_be_reviewed

    steven = Employee.new("Steven", "g@gmail.com", "555-555-5555", "60_000")
    steven.give_review("Xavier is a huge asset to SciMed and is a pleasure to work with.")
    assert_equal "Xavier is a huge asset to SciMed and is a pleasure to work with.", steven.give_review("Xavier is a huge asset to SciMed and is a pleasure to work with.")

  end

  def test_employees_can_get_individual_raises
    employee1 = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
    employee1.give_raise(5000)
    assert_equal 65000, employee1.salary
  end

  def test_if_employee_is_doing_work
    employee = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
      employee.working("a")
      assert_equal ("#{employee.name} is performing well above expectations."), employee.working("a")
  end

  def test_if_employee_has_been_graded
    employee = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
      employee.working("a")
      assert_equal ["a"], employee.grade
  end

  def test_to_give_department_a_raise
    advertising = Department.new("Advertising")
    employee2 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 80000)
    employee3 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 80000)
    employee4 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 80000)
    employee5 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 80000)
    advertising.add_employee(employee2)
    advertising.add_employee(employee3)
    advertising.add_employee(employee4)
    advertising.add_employee(employee5)
    employee2.working("a")
    employee3.working("b")
    employee4.working("c")
    employee5.working("f")

    advertising.department_raise

    assert_equal 86400, employee2.salary #a 1.08
    assert_equal 84000, employee3.salary #b 1.05
    assert_equal 82400, employee4.salary #c 1.03
    assert_equal 80000, employee5.salary #f 1


  end

  def test_what_happens_if_employee_not_graded_and_dept_gets_raise
    advertising = Department.new("Advertising")
    employee1 = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
    employee2 = Employee.new("Tom", "t@gmail.com", "555-555-5555", 60000)
    advertising.add_employee(employee1)
    advertising.add_employee(employee2)
    employee1.working("a")

    advertising.department_raise
    #if department gets a riase I want to flag that an employee hasn't been evaluated. If deserves a raise then gets raise

    assert_equal 64800, employee1.salary #a 1.08
    assert_equal 60000, employee2.salary
  end

  def test_to_mitigate_employee_having_multiple_grades
    advertising = Department.new("Advertising")
    employee1 = Employee.new("Steven", "g@gmail.com", "555-555-5555", 60000)
    advertising.add_employee(employee1)
    employee1.working("a")
    employee1.working("b")
    employee1.working("a")

    advertising.department_raise
    #if department gets a riase I want to flag that an employee hasn't been evaluated. If deserves a raise then gets raise
puts employee1.grade.inspect
    assert_equal 64800, employee1.salary #b 1.05
  end



end
