require_relative "consoleInput"

class Person
  include ConsoleInput
  include Validation

  attr_reader :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    @first_name = first_name
    @last_name = last_name
    @inn = inn
    @birth_date = birth_date
  end

  def first_name=(new_first_name)
    valid_name?(new_first_name) ? @first_name = new_first_name : (raise ArgumentError, "Invalid first_name")
  end

  def last_name=(new_last_name)
    valid_name?(new_last_name) ? @last_name = new_last_name : (raise ArgumentError, "Invalid last_name")
  end

  def inn=(new_inn)
    valid_inn?(new_inn) ? @inn = new_inn : (raise ArgumentError, "Invalid INN")
  end

  def birth_date=(new_birth_date)
    if valid_date_format?(new_birth_date)
      value = Date.parse(new_birth_date)
      after_date?(value) ? @birth_date = value : (raise ArgumentError, "Invalid Birth Date")
    else
      raise ArgumentError, "Invalid Date Format"
    end
  end
end