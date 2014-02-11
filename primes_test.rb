require 'test/unit'
require_relative './primes'

class TestPrimesIsPrimeMethod < Test::Unit::TestCase
  def setup
    @primes = Primes.new
  end

  def test_prime_cases
    #Some small and large primes
    assert @primes.is_prime?(2)
    assert @primes.is_prime?(11)
    assert @primes.is_prime?(73379)
  end

  def test_composite_cases
    #Some small and large composites
    assert !@primes.is_prime?(4)
    assert !@primes.is_prime?(49)
    assert !@primes.is_prime?(101923)
  end
end

class TestPrimesFindNPrimesMethod < Test::Unit::TestCase
  def setup
    @primes = Primes.new
  end

  def test_values_above_zero
    assert_equal(@primes.find_n_primes(3), [2,3,5])
    assert_equal(@primes.find_n_primes(5), [2,3,5,7,11])
  end

  def test_values_below_or_equal_0
    assert_equal(@primes.find_n_primes(0), nil)
    assert_equal(@primes.find_n_primes(-1), nil)
    assert_equal(@primes.find_n_primes(-3), nil)
  end
end

class TestPrimesCreateNPrimesTableMethod < Test::Unit::TestCase
  def setup
    @primes = Primes.new
  end

  def test_default_ten_primes
    #See if resulting table string contains the square of 11 (121). It should if all cells are getting made
    assert @primes.create_n_primes_table(10).include? "121"
  end

  def test_can_take_arguments_to_make_larger_tables
    #See if the resulting string contains the 12th prime
    assert @primes.create_n_primes_table(12).include? "37"
  end

  def test_negative_numbers
    #Should return nothing if negative number is given. (A message is printed to console if actually run)
    assert_nil @primes.create_n_primes_table(-5)
  end
end