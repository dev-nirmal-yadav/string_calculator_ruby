class StringCalculator
  def add(numbers)
    0 if numbers.empty?

    if numbers.include?(',')
      numbers.split(',').map(&:to_i).sum
    else
      numbers.to_i
    end
  end
end
