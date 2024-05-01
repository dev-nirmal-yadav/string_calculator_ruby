# frozen_string_literal: true

require_relative '../lib/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    shared_examples 'returns the sum of inputs' do |numbers, result|
      it "returns #{result} for input #{numbers.inspect}" do
        expect(calculator.add(numbers)).to eq(result)
      end
    end

    shared_examples 'raises error for negative numbers' do |numbers, negative_numbers|
      it "raises error for input #{numbers.inspect}" do
        expect {
          calculator.add(numbers)
        }.to raise_error(
          described_class::NegativeNumberError,
          "Negative numbers not allowed #{negative_numbers}"
        )
      end
    end

    context 'with default delimiter' do
      context 'with valid input' do
        include_examples 'returns the sum of inputs', '', 0
        include_examples 'returns the sum of inputs', '1', 1
        include_examples 'returns the sum of inputs', '1,2', 3
        include_examples 'returns the sum of inputs', '1,2,3', 6
        include_examples 'returns the sum of inputs', "1\n2,3", 6
      end
    end

    context 'with custom delimiter' do
      include_examples 'returns the sum of inputs', "//;\n1;2", 3
    end

    context 'with invalid input' do
      it "raises error for input '1,\n'" do
        expect {
          calculator.add("1,\n")
        }.to raise_error(described_class::InvalidInputError, "Invalid input format: '1,\n'")
      end
    end

    context 'with negative numbers' do
      include_examples 'raises error for negative numbers', '1,-2', '-2'

      include_examples 'raises error for negative numbers', '1,-2,-3', '-2,-3'
    end
  end
end
