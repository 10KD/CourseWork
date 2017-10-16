# class Employee
#   def initialize(first_name, last_name, salary, title, boss)
#     @first_name = first_name
#     @last_name = last_name
#     @salary = salary
#     @title = title
#     @boss = boss
#   end
#   def bonus(multiplier)
#     @salary * multiplier
#   end
# end

class Employee
  attr_reader :name, :salary, :title
  attr_accessor :boss

  def initialize(name, salary, title, boss = nil)
    @name, @salary, @title = name, salary, title
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end
