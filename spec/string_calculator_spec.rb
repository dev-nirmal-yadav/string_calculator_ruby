# frozen_string_literal: true

require_relative '../lib/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to be_zero
    end

    it 'returns the number for a single number' do
      expect(calculator.add('1')).to eq(1)
    end
  end
end
