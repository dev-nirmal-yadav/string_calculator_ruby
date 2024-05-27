class StringCalculator
  class InvalidInputError < StandardError; end
  class NegativeNumberError < StandardError; end

  DEFAULT_DELIMITER = Regexp.new('[,\n]')

  def calculate(numbers)
    validate_input(numbers)

    delimiter, numbers = extract_delimiter_and_numbers(numbers)

    numbers_array = numbers.split(delimiter)
    numbers_array.reject! { |num| num.to_i > 1000 }
    validate_negative_numbers(numbers_array)

    perform_operation(numbers_array, delimiter)
  end

  private

  def validate_input(numbers)
    raise InvalidInputError, "Invalid input format: '#{numbers}'" if numbers.end_with?("\n")
  end

  def extract_delimiter_and_numbers(numbers)
    match = numbers.match(/^\/\/(.+)\n/)
    delimiter = match ? Regexp.escape(match[1]) : DEFAULT_DELIMITER
    delimiter = '*' if delimiter == '\\*'
    numbers = numbers.sub(/^\/\/.+?\n/, '')

    [delimiter, numbers]
  end

  def validate_negative_numbers(numbers_array)
    negative_numbers = numbers_array.select { |number| number.to_i.negative? }

    raise NegativeNumberError, "Negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?
  end

  def perform_operation(numbers_array, delimiter)
    if delimiter == '*'
      numbers_array.inject(1) { |product, num| product * num.to_i }
    else
      numbers_array.inject(0) { |sum, num| sum + num.to_i }
    end
  end
end
