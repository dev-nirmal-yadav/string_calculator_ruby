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

    include_examples 'returns the sum of inputs', '', 0
    include_examples 'returns the sum of inputs', '1', 1
    include_examples 'returns the sum of inputs', '1,2', 3
    include_examples 'returns the sum of inputs', '1,2,3', 6
    include_examples 'returns the sum of inputs', "1\n2,3", 6
  end
end
