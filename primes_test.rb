require 'test/unit'
require_relative './primes'

class PrimesTest < Test::Unit::TestCase

  def test_primes_knows_if_number_is_prime
    @primes = Primes.new

    #Some arbitray primes
    assert @primes.is_prime?(2)
    assert @primes.is_prime?(11)
    assert @primes.is_prime?(73379)

    #Some arbitrary composites
    assert !@primes.is_prime?(4)
    assert !@primes.is_prime?(49)
    assert !@primes.is_prime?(101923)
  end

  def test_primes_

end