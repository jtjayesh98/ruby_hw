# When done, submit this entire file to the autograder.
include Enumerable

# Part 1

def sum arr
  retVal = 0
  arr.each {|x| retVal = retVal + x}
  return retVal
  # YOUR CODE HERE
end

def max_2_sum arr
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    max_2 = [-10000, -10000]
    for a in arr do
      if a > max_2[1]
        if a > max_2[0]
          max_2[0] = a
        else
          max_2[1] = a
        end
      end
    end
    return sum max_2
  end
  # YOUR CODE HERE
end

def sum_to_n? arr, n
  if arr.length == 0 or arr.length == 1
    return false
  else
    sum_arr = []
    for a in arr do
      for b in arr.slice(arr.find_index(a)+1, arr.length) do
        sum_arr.append(a+b)
      end 
    end 
    for i in sum_arr do
      if i == n
        return true
      end 
    end
    return false
  end
  # YOUR CODE HERE
end

# # Part 2

def hello(name)
  retVal = "Hello, " + name
  return retVal
  # YOUR CODE HERE
end

def numeric?(lookAhead)
  lookAhead =~ /[0-9]/
end

def consonant?(lookAhead)
  lookAhead =~ /[AEIOUaeiou]/
end

def letter?(lookAhead)
  lookAhead =~ /[A-Za-z]/
end
def binary?(lookAhead)
  lookAhead =~ /[01]/
end
def starts_with_consonant? s
  if consonant?(s[0])
    return false
  elsif letter?(s[0])
    return true
  else
    return false
  end
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  if s.length == 0
    return false
  end
  rev_s = s.reverse
  rev_s = rev_s.split('')
  pow = 1
  sum = 0
  for i in rev_s
    if letter?(i)
      return false
    elsif binary?(i)
      sum = sum + pow*(i.to_i)
      pow = pow * 2
    end
  end
  if sum.modulo(4) == 0
    return true
  else
    return false
  end
  # YOUR CODE HERE
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    if isbn.length == 0 or price <= 0
      raise ArgumentError
    end 
    @isbn = isbn
    @price = price
  end
  def isbn
    @isbn
  end 
  def price
    @price
  end 
  def isbn=(new_isbn)
    if isbn.length == 0
      raise ArgumentError
    end 
    @isbn=new_isbn
  end 
  def price=(new_price)
    if price <= 0
      raise ArgumentError
    end 
    @price=new_price
  end
  def price_as_string
    decimal = @price.modulo(1)
    non_decimal = @price - decimal
    decimal = decimal*100
    if decimal.to_i == 0
      retVal = '$' + non_decimal.to_i.to_s + '.00'
    else
      retVal = '$' + non_decimal.to_i.to_s + '.' + decimal.to_i.to_s
    end
    return retVal
  end
# YOUR CODE HERE
end
