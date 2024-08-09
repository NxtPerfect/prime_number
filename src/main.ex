defmodule Prime do
  def findNthPrimes(nth) when nth > 0 and is_integer(nth), do: findNthPrimes(nth, 1, [])
  def findNthPrimes(nth), do: []
  defp findNthPrimes(nth, _, primeList) when nth <= 0 and is_integer(nth), do: primeList

  # defp findNthPrimes(nth, currentNumber, primeList) when isPrime(currentNumber),
  #   do: findNthPrime(nth - 1, currentNumber + 1, [currentNumber | primeList])
  #
  # defp findNthPrimes(nth, currentNumber, primeList),
  #   do: findNthPrime(nth, currentNumber + 1, primeList)

  defp findNthPrimes(nth, currentNumber, primeList) do
    isNumberAprime = isPrime(currentNumber)

    newPrimeList =
      if isNumberAprime do
        findNthPrimes(nth - 1, currentNumber + 1, [currentNumber | primeList])
      else
        findNthPrimes(nth, currentNumber + 1, primeList)
      end

    newPrimeList
  end

  def isPrime(nth) when nth <= 1 and is_integer(nth), do: false
  def isPrime(nth), do: isPrime(nth, 2)

  defp isPrime(nth, divider) when divider >= nth and is_integer(divider) and is_integer(nth),
    do: true

  defp isPrime(nth, divider) when rem(nth, divider) == 0, do: false
  defp isPrime(nth, divider), do: isPrime(nth, divider + 1)
end

IO.puts("Is -69 a prime number")
IO.puts(Prime.isPrime(-69) == false)
IO.puts("Is 0 a prime number")
IO.puts(Prime.isPrime(0) == false)
IO.puts("Is 1 a prime number")
IO.puts(Prime.isPrime(1) == false)
IO.puts("Is 3 a prime number")
IO.puts(Prime.isPrime(3) == true)
IO.puts("Is 8 a prime number")
IO.puts(Prime.isPrime(8) == false)
IO.puts("Test for 0 prime numbers")
IO.puts(Prime.findNthPrimes(0) == [])
IO.puts("Test for 1 prime number")
IO.puts(Prime.findNthPrimes(1) == [2])
IO.inspect(Prime.findNthPrimes(1))
IO.puts("Test for 3 prime numbers")
IO.puts(Prime.findNthPrimes(3) == [5, 3, 2])
IO.inspect(Prime.findNthPrimes(3))
IO.puts("Test for 5 prime numbers")
IO.puts(Prime.findNthPrimes(5) == [11, 7, 5, 3, 2])
IO.inspect(Prime.findNthPrimes(5))
IO.puts("Test for 10 prime numbers")
IO.puts(Prime.findNthPrimes(10) == [29, 23, 19, 17, 13, 11, 7, 5, 3, 2])
IO.inspect(Prime.findNthPrimes(10))
IO.puts("Test for -5 prime numbers")
IO.puts(Prime.findNthPrimes(-5) == [])
IO.puts("Test for 0 prime numbers")
IO.puts(Prime.findNthPrimes(0) == [])
IO.puts("Test for 2 / 3 prime numbers")
IO.puts(Prime.findNthPrimes(2 / 3) == [])
IO.puts("Test for 5 / 4 prime numbers")
IO.puts(Prime.findNthPrimes(5 / 4) == [])
