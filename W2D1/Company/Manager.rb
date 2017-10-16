require_relative 'Employee'
# class Manager < Employee
#   def initialize
#     @reports = []
#     super
#   end
#
#   def get_all_employee_salaries(reports)
#     reports_salaries = []
#     reports.each do |report|
#       if report.class.is_a?(Manager)
#         reports_salaries.concat(get_all_employee_salaries(report))
#       else
#         reports_salaries.push(report.salary)
#       end
#     end
#     reports_salaries.reduce(:+)
#   end
#
#   def bonus(multiplier)
#     base = get_all_employee_salaries(@reports)
#     base * multiplier
#   end
#
# end

class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def bonus(multiplier)
    self.total_subsalary * multiplier
  end

  protected
  def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end

    total_subsalary
  end
end
