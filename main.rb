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

def findNPrimes(n)
  return if n <= 0

  #Just start with 2 so we can start with 3 and count by 2's when trying new numbers to place in result array
  result = [2]
  curNum = 3
  while result.length < n
    result.push(curNum) if isPrime?(curNum)
    curNum += 2
  end

  return result
end
