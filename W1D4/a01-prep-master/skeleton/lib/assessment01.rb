require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    if accumulator == nil
      accumulator = self[0]
      self[1..-1].each do |el|
        accumulator = yield(accumulator, el)
      end
    else
      self[0..-1].each do |el|
        accumulator = yield(accumulator, el)
      end
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2

  (2..num/2).each do |n|
    return false if num % n == 0
  end
  true
end

def primes(num)
  primes_arr = []
  i = 2
  until primes_arr.length == num
    primes_arr << i if is_prime?(i)
    i += 1
  end
  primes_arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num < 2
  factorials = [factorial(num - 1)]
  factorials_rec(num - 1) + factorials
end

def factorial(num)
  return 1 if num <= 1
  num * factorial(num - 1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups_hash = Hash.new
    self.each_with_index do |el, i|
      dups_hash[el] ? dups_hash[el] += [i] : dups_hash[el] = [i]
    end
    dups_hash.select { |k, v| v.length > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    1.upto(self.length).each do |i|
      self.chars.each_cons(i) do |sub|
        result << sub.join("") if sub.reverse == sub && sub.length > 1
      end
    end
    result
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort(&prc), right.merge_sort(&prc)

    self.class.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged_array = []
    until left.empty? || right.empty?
      if block_given?
        case prc.call(left.first, right.first)
        when -1
          merged_array << left.shift
        when 0
          merged_array << left.shift
        when 1
          merged_array << right.shift
        end
      else
        merged_array <<
          ((left.first < right.first) ? left.shift : right.shift)
      end
    end

    merged_array + left + right
  end

end
