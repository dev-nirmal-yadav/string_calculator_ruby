# frozen_string_literal: true

require_relative '../lib/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    shared_examples 'returns the sum of inputs' do |numbers, result|
      it "returns #{result} for input #{numbers}" do
        expect(calculator.add(numbers)).to eq(result)
      end
    end

    context 'when input is an empty string' do
      include_examples 'returns the sum of inputs', '', 0
    end

    context 'when input is a single number' do
      include_examples 'returns the sum of inputs', '1', 1
      include_examples 'returns the sum of inputs', '5', 5
    end

    context 'when input is two numbers' do
      include_examples 'returns the sum of inputs', '1,2', 3
    end
  end
end
