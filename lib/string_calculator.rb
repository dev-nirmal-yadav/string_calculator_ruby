class StringCalculator
  def add(numbers)
    numbers.split(',').inject(0) { |sum, num| sum + num.to_i }
  end
end
