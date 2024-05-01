class StringCalculator
  class InvalidInputError < StandardError; end

  DEFAULT_DELIMITER = Regexp.new('[,\n]')

  def add(numbers)
    validate_input(numbers)

    delimiter, numbers = extract_delimiter_and_numbers(numbers)

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
end
