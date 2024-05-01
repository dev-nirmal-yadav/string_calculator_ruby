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

    context 'when inputs are valid' do
      include_examples 'returns the sum of inputs', '', 0
      include_examples 'returns the sum of inputs', '1', 1
      include_examples 'returns the sum of inputs', '1,2', 3
      include_examples 'returns the sum of inputs', '1,2,3', 6
      include_examples 'returns the sum of inputs', "1\n2,3", 6
    end

    context 'when inputs are invalid' do
      it "raises error for input '1,\n'" do
        expect {
          calculator.add("1,\n")
        }.to raise_error(described_class::InvalidInputError, "Invalid input format: '1,\n'")
      end
    end
  end
end
