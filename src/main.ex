defmodule Prime do
  # Find nth prime number
  # or find n prime numbers
  # save into list
  # print out the results
  @spec findPrime(Integer) :: List
  def findPrime(nth) do
    primes =
      if nth > 0 do
        findPrime(nth - 1, 3, [2])
      else
        []
      end

    primes
  end

  @spec findPrime(Integer, Integer, List) :: List
  defp findPrime(nth, currentNumber, currentPrimeList) do
    # Means we found all prime numbers
    updatedPrimeList =
      if nth == 0 || nth < 0 do
        currentPrimeList
      else
        if checkIsPrime(currentNumber) do
          [currentPrimeList, currentNumber]
        end
      end

    if nth > 0 do
      findPrime(nth - 1, currentNumber + 1, updatedPrimeList)
    end

    updatedPrimeList
  end

  @spec checkIsPrime(Integer) :: Boolean
  defp checkIsPrime(number) do
    dividerMax = div(number, 2)

    isPrime =
      if rem(number, dividerMax) == 0 do
        false
      else
        checkIsPrime(number, dividerMax, 2)
      end

    isPrime
  end

  @spec checkIsPrime(Integer, Integer, List) :: Boolean
  defp checkIsPrime(number, dividerMax, current) do
    isPrime =
      if rem(number, current) == 0 do
        false
      else
        if current > dividerMax do
          true
        else
          checkIsPrime(number, dividerMax, current + 1)
        end
      end

    isPrime
  end
end

IO.puts("Test for 1 prime number")
IO.puts(Prime.findPrime(1) == [2])
IO.inspect(Prime.findPrime(1))
IO.puts("Test for 3 prime numbers")
IO.puts(Prime.findPrime(3) == [2, 3, 5])
IO.inspect(Prime.findPrime(3))
IO.puts("Test for 5 prime numbers")
IO.puts(Prime.findPrime(5) == [2, 3, 5, 7, 11])
IO.inspect(Prime.findPrime(5))
IO.puts("Test for 10 prime numbers")
IO.puts(Prime.findPrime(10) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
IO.inspect(Prime.findPrime(10))
IO.puts("Test for -5 prime numbers")
IO.puts(Prime.findPrime(-5) == [])
IO.puts("Test for 0 prime numbers")
IO.puts(Prime.findPrime(0) == [])
IO.puts("Test for 2 / 3 prime numbers")
IO.puts(2 / 3)
IO.puts(Prime.findPrime(2 / 3) == [])
IO.puts("Test for 5 / 4 prime numbers")
IO.puts(5 / 4)
IO.puts(Prime.findPrime(5 / 4) == [])
