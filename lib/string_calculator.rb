class StringCalculator
  class InvalidInputError < StandardError; end

  def add(numbers)
    validate_input(numbers)

    delimiter = ','
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    end

    numbers.split(/#{delimiter}|\n/).inject(0) { |sum, num| sum + num.to_i }
  end

  private

  def validate_input(numbers)
    raise InvalidInputError, "Invalid input format: '#{numbers}'" if numbers.end_with?("\n")
  end
end
