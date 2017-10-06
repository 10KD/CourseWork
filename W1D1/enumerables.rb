require 'byebug'

class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      result << el unless prc.call(el)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten(arr = [])
    # byebug

    self.my_each do |el|
      if el.is_a? Integer
        arr << el
      elsif el.is_a? Array
        el.my_flatten(arr)
      end
    end
    arr
  end

  # def my_zip(*args)
  #   arr = Array.new(self.length) {[]}
  #   self.each_with_index do |el, idx|
  #     arr[idx] << el
  #     args.each do |element|
  #       arr[idx] << element[idx]
  #     end
  #   end
  #   arr.each do |subarr|
  #     until subarr.length == args.length + 1
  #       subarr << nil
  #     end
  #   end
  #   arr
  # end

  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end

    zipped
  end

  # def my_rotate(arg = 1)
  #   new_arr = Array.new(self.length)
  #   arg = arg % 4
  #   self.each_with_index do |el, i|
  #     new_arr[i - arg % 4] = el
  #   end
  #   new_arr
  # end

  def my_rotate(positions = 1)
    split_idx = positions % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separate = "")
    str = ""

    self.each_with_index do |el, i|
      str << el
      str << separate unless i == self.length - 1
    end
    str
  end

  def my_join(separator = "")
    join = ""

    self.length.times do |i|
      join += self[i]
      join += separator unless i == self.length - 1
    end

    join
  end

  # def my_reverse
  #   new_arr = Array.new(self.length)
  #   self.each_with_index do |el, i|
  #     new_arr[(i + 1)* -1] = el
  #   end
  #   new_arr
  # end

  def my_reverse
   reversed = []

   self.my_each do |el|
    reversed.unshift(el)
   end

   reversed
 end
end

##########################

def factors(num)
  arr = []
  (1..num).each do |el|
    if num % el == 0
      arr << el
    end
  end
  arr
end

class Array
  def bubble_sort!(&prc)
    sorted = nil

    until sorted
      sorted = true
      self.each_with_index do |el, i|
        if i < self.length - 1
          curr = el
          nxt = self[i + 1]
          if prc.call(curr, nxt) == 1
            self[i], self[i + 1] = nxt, curr
            sorted = false
          end
        end
      end
    end

    self
  end

  def bubble_sort
    self.dup.bubble_sort!
  end
end

def substrings(string)
  arr = string.split("")
  new_arr = []
  arr.each_with_index do |el, i|
    i2 = i + 1
    new_arr << el
    sub = el
    if i2 < string.length
      (i2...string.length).each do |j|
        sub += string[j]
        new_arr << sub
      end
    end
  end
  new_arr

end

def subwords(word, dictionary)
  arr = substrings(word)
  arr.select { |el| dictionary.include?(el)}
end

def doubler(array)
  array.map { |el| el*2}
end

class Array
  def my_map(&prc)
    arr = []
    self.each { |el| arr << prc.call(el)}
    arr
  end

  def my_inject(&blk)
    acc = self[0]
    self[1..-1].my_each { |el| acc = blk.call(acc, el) }
    acc
  end

end

def concatenate(strings)
  strings.my_inject { |acc, string| acc + string }
end

p concatenate(["Yay ", "for ", "strings!"])
