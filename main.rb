def isPrime?(num)
  # Handle edge cases
  return true if num == 2
  return false if num % 2 == 0 or num <= 1

  divisor = 3
  while divisor <= Math.sqrt(num)
    if num % divisor === 0
      return false
    end
    divisor += 2
  end

  return true
end
