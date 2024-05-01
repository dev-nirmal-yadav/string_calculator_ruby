class StringCalculator
  class InvalidInputError < StandardError; end

  def add(numbers)
    validate_input(numbers)

    numbers.split(/[,\n]/).inject(0) { |sum, num| sum + num.to_i }
  end

  private

  def validate_input(numbers)
    raise InvalidInputError, "Invalid input format: '#{numbers}'" if numbers.end_with?("\n")
  end
end
