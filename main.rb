class Primes
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

  def create_n_primes_table(num_primes)
    make_table(find_n_primes(num_primes))
  end

  private

  def get_proper_spacing(cur_num_length, largest_cell_size, extra_right_side)
    spaces = ""
    num_spaces = largest_cell_size + extra_right_side - cur_num_length
    num_spaces.times do | |
      spaces += " "
    end
    spaces
  end

  def make_table(nums)
      table = ''

      # Add in 1 at the beginning to make table creation easier
      nums.unshift(1)

      # A formatting parameter
      extra_right_side = 2

      # Figuring out largest number we'll get, so we can make all cells equal size
      largest_cell_size = ((nums.last**2).to_s.length) + extra_right_side

      nums.each_with_index do |num1, i1|
          row = ''
          nums.each_with_index do |num2, i2|
              # Show nothing for very first top left cell.
              if i1 == 0 and i2 == 0
                  spaces = get_proper_spacing(0, largest_cell_size, extra_right_side)
                  row += "|  " + spaces
              else
              # Find number, create cell with correct spacing
                  result = num1*num2
                  spaces = get_proper_spacing(result.to_s.length, largest_cell_size, extra_right_side)
                  row += "|  #{result}" + spaces
              end
          end
          table += row + "|\n"
      end
      puts table
  end
end

num_primes = ARGV[0] ? ARGV[0].to_i : 10

Primes.new.create_n_primes_table(num_primes)
