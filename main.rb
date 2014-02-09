def is_prime?(num)
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

def find_n_primes(n)
  return if n <= 0

  #Just start with 2 so we can start trying numbers at 3 and count by 2's when trying new numbers to place in result array
  result = [2]
  curNum = 3
  while result.length < n
    result.push(curNum) if is_prime?(curNum)
    curNum += 2
  end

  return result
end

def make_table(nums)
    table = ''
    nums.unshift(1)
    nums.each_with_index do |num1, i1|
        row = ''
        nums.each_with_index do |num2, i2|
            if i1 == 0 and i2 == 0
                row += "|   "
            else
                row += "| #{num1*num2} "
            end
        end
        table += row + "|\n"
    end
    puts table
end
