require 'byebug'

def range(start,last)
  return [] if start >= last

  range_array = [start]
  range_array + range(start+1,last)
end

# p range(1, 5)

# def sum_array(array)
#   return array[0] if array.length == 1
#   array[0] + sum_array(array[1..-1])
# end


def sum_array(array)
  array.reduce(:+)
end

# p sum_array([1,2,3,4])


# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# def exp(base, exponent)
#   return 1 if exponent == 0
#   return base if exponent == 1
#   base * exp(base, exponent - 1)
# end
#
def exp(base,exponent)
  p exponent
  return 1 if exponent == 0
  return base if exponent == 1
  if exponent.even?
    result = exp(base,exponent/2)
    result * result
  else
    result = exp(base,(exponent-1)/2)
    base * (result * result)
  end


end



# p exp(4, 5)
# p exp(6, 0)
# p exp(12, 8)

class Array
#
#   def deep_dup #WRONG!!
#     return [] if self.length < 1
#     result = [self[0]]
#     result + self[1..-1].deep_dup
#   end
end

# arr = [[1,2],[3,4]]
#
# arr2 = arr.deep_dup
# p arr2
# # arr[0][0] = 4
# # p arr2
# #
# arr2[0][0] = [5]
# p arr2
# p arr

def fibonacci(n)
  return [0,1] if n == 2
  return [0] if n <= 1
  sequence = fibonacci(n-1)
  sequence + [sequence[-1] + sequence[-2]]
end


# p fibonacci(7)



def subsets(array)
  return [[]] if array.length < 1
  # debugger
  last = [array.pop] # [1]
  prev_sets = subsets(array) # => [[]]
  new_sets = prev_sets.map { |el| el + last } # => [[1]]
  prev_sets + new_sets
end

# def subsets(array)
#   result = [[]]
#   array.each_with_index do |ele,idx|
#     ((idx + 1)...array.length).each do |i|
#       result << [ele,array[i]]
#

  # debugger

  def permutations(array)
    if array[0].is_a?(Array)
      permutation_num = factorial(array[0].length)
      return array if array.length == permutation_num
      current = array[-1]
      prev_array = [current[-1]] + current[0..-2]
      next_array = [current[-1]] + current[0..-2].reverse
      result = array + [next_array , prev_array]
      permutations(result)
    else
      permutation_num = factorial(array.length)
      return array if array.length == permutation_num
      next_array = [array[0]] + array[1..-1].reverse
      result = [array] + [next_array]
      permutations(result)
    end
  end



# second_arr = [array[0]] + array[1..-1].reverse
#
# result = [array, second_arr]
#
# (permutation_num / array.length).times do |i|
#   result += permutations(array[1..-1] + [array[0]])
# end
def factorial(num)
  return 1 if num == 1
  num * factorial(num - 1)
end

# p permutations([1,2,3])


# p subsets([1])

def bsearch(array, target)
  mid_idx = (array.length/2) # 2
  median = array[mid_idx] # 4
  left_array = array[0..(mid_idx - 1)]
  right_array = array[(mid_idx + 1)..-1]

  return mid_idx if median == target
  return nil if array.length <= 1

  if median < target
    result = bsearch(right_array,target)
    return nil if result.nil?
   (mid_idx + 1) + bsearch(right_array,target)
  elsif median > target
   bsearch(left_array,target)

  end
end


def subsets(array)
  return [[]] if array.length < 1
  # debugger
  last = [array.pop] # [1]
  prev_sets = subsets(array) # => [[]]
  new_sets = prev_sets.map { |el| el + last } # => [[1]]
  prev_sets + new_sets
end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
  return array if array.length == 1
  mid = array.length / 2
  merge(merge_sort(array[0..mid -1]), merge_sort(array[(mid)..-1]))
end

def merge(arr1, arr2)
  result = []
  case arr1.length <=> arr2.length
  when -1, 0
    shorter = arr1
    longer = arr2
  when 1
    shorter = arr2
    longer = arr1
  end

  while shorter[0]
    if longer.empty?
      return result + shorter
    elsif shorter.empty?
      return result + longer
    elsif longer[0] > shorter[0]
      result << shorter.shift
    elsif longer[0] <= shorter[0]
      result << longer.shift
    end
  end

  result + longer
end


def make_change(amount, coins = [25, 10, 5, 1])
  result = []
  return [] if amount == 0
  (amount / coins[0]).times { |i| result << coins[0]; amount -= coins[0] }
  coins.shift
  result + make_change(amount, coins)
end

# p make_change(24, [10,7,1])
# p merge_sort([4,3,2,1,3,6,7,2,5,2])
