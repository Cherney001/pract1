module Validation
  def self.valid_name?(string)
    string =~ /\A[A-Za-z]+(-[A-Za-z]+)*\z/ && string.length <= 40
  end

  def self.valid_inn?(string)
    string =~ /\A[A-Z]{2}\d{10}\z/
  end

  def self.after_date?(date)
    date < Date.today
  end
end

puts Validation.valid_name?("Maria-Anna")
puts Validation.valid_name?("Maria-Anna-Smith-Jones-Williams")

puts Validation.valid_inn?("AZ1234543456")
puts Validation.valid_inn?("AB1234567890")

puts Validation.after_date?(Date.new(2000, 1, 1))
puts Validation.after_date?(Date.today)