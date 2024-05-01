class StringCalculator
  class InvalidInputError < StandardError; end
  class NegativeNumberError < StandardError; end

  DEFAULT_DELIMITER = Regexp.new('[,\n]')

  def add(numbers)
    validate_input(numbers)

    delimiter, numbers = extract_delimiter_and_numbers(numbers)

    numbers_array = numbers.split(delimiter)
    validate_negative_numbers(numbers_array)

    numbers.split(/#{delimiter}|\n/).inject(0) { |sum, num| sum + num.to_i }
  end

  private

  def validate_input(numbers)
    raise InvalidInputError, "Invalid input format: '#{numbers}'" if numbers.end_with?("\n")
  end

  def extract_delimiter_and_numbers(numbers)
    match = numbers.match(/^\/\/(.+)\n/)
    delimiter = match ? match[1] : DEFAULT_DELIMITER
    numbers = numbers.sub(/^\/\/.+?\n/, '')

    [delimiter, numbers]
  end

  def validate_negative_numbers(numbers_array)
    negative_numbers = numbers_array.select { |number| number.to_i.negative? }

    raise NegativeNumberError, "Negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?
  end
end
