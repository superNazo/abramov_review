module Abramov
  # Yevhen Uzhva
  # 107
  def abramov_107(m)
    k = 0
    k += 1 while 4**k <= m
    k - 1
  end

  # 243b
  def abramov_243b(n)
    arr = []
    x = y = 0
    while x <= Math.sqrt(n)
      if x**2 + y**2 < n
        y += 1
      elsif x**2 + y**2 == n
        arr.push([x, y])
        y += 1
      else
        x += 1
        y = 0
      end
    end
    arr
  end

  # 88с
  def abramov_88c(number)
    number = number.to_s.split
    number.unshift('1').push('1')
    number = number.join.to_i
    puts "Result: #{number}"
  end

  # 88d
  def abramov_88d(number)
    digits = number.to_s.split(//)
    digits[0], digits[-1] = digits[-1], digits[0]
    puts "Result number : #{digits.join.to_i}"
  end

  # 332
  def abramov_332(number)
    array = []
    (0..3).each do |i|
      array[i] = Math.sqrt(number).floor
      number = (number - array[i]**2).abs
    end
    puts "Result: #{array}"
  end


#Sergiy
def abr_182(x)
  a = []
  for_v = []
  sum_of_dig = []
  x.times { a.push Random.rand(100) }
  a.each { |v| v % 5 == 0 && v % 7 != 0 ? for_v << v : 0 }
  sum_of_dig << for_v.length
  sum = 0
  for_v.each { |s| sum += s }
  puts sum_of_dig.to_s
end

###
def count_divs(n)
  div_sum = 0
  (1...n).each { |d| div_sum += d if n % d == 0 }
  div_sum
end

def abramov_560(a, b)
  friendly_pairs = []
  (a..b).each do |i|
    (a + 1..b).each do |d|
      friendly_pairs << [i, d] if (count_divs(i) == d) && (count_divs(d) == i)
    end
  end
  "Result: #{friendly_pairs}"
end

###
def g_all(x)
  (1..x).to_a.map { |el| x % el == 0 ? el : 0 }
end

def abramov_323(n)
  dvs_of_n = g_all(n)
  result = []
  (2..n - 1).to_a.each { |e| (g_all(e) & dvs_of_n).max == 1 ? result << e : 0 }
  puts result
end

#Anatolii Abramove178(b,c)
def Abramove178_b
  print "enter the key: "
  key = gets.to_i
  a = []

  key.times do |n|
    a.push Random.rand(100)
  end

  print "Array: #{a}"
  puts "\n\n======================== FIRST TASK ======================"

  a.each do |v|
    if v%3 == 0 && v%5
      puts "numbers divisible by 3 and not divisible by 5: #{v}"
    end
  end
  return a
end

def Abramove178_c(a)
  puts "\n\n====================== NEXT TASK ======================"
  a.each do |v|
    if v!=0 && v%2 == 0 && Math.sqrt(v)%2 == 0
      puts "squares of even numbers: #{v}"
    end
  end
end

#Abramove178_c(Abramove178_b())

#Anatolii 554
def Abramove554
  print "enter n: "
  n = gets.to_i

  (1..n).each do |a|
    (1..n).each do |b|
      c = Math.sqrt((a*a)+(b*b)) #finding hypotenuse#
      if (a<=b)&&(b<=c)&&(c<=n)&&((c*c)%c == 0)
        print "#{a} #{b} #{c.to_i}\n"
      end
    end

  end
end

#Kyrylov Kyryll
# Abramov 88-A
# Check your input for number 3
def task(number)
  number *= number
  result = number.to_s.index('3')

  if result.nil?
    puts "Number 3 not found in #{number}"
  else
    puts "digit 3 found at index #{result} of #{number}"
  end
end

# Abramov 88-B
# Reverse your number
def task(number)
  number.reverse!

  puts "your number is now reversed : #{number}"
end

# Abramov 322
# Get a number with mots deviders
def task(num)
  target = 0
  max = 0

  (0..num).each do |i|
    current = 0

    (1..i).each do |j|
      current += 1 if i % j == 0

      if current > max
        max = current
        target = i
      end
    end
  end

  puts "#{target} has the biggest numbers of deviders: #{max}"
end

# find sum of digits of a number
def abramov_86a(num)
  sum = 0
  num.to_s.split(//).each { |n| sum += n.to_i }
  "Sum of the digits is: #{sum}"
end

# count quantity of digits of a number
def abramov_86b(num)
  counter = num.to_s.split(//).length
  "Quantity of the digits is: #{counter}"
end

# find the first digit of the number
def abramov_86c(num)
  digit = num.to_s.split(//).first
  "The first digit is: #{digit}"
end

# find all perfect numbers up to the inputed one
def abramov_330(num)
  perfects = []

  def is_perf(n)
    divs = []
    (1..Math.sqrt(n)).each { |i| divs << i << n / i if n % i == 0 }
    divs.inject { |sum, n| sum += n } == 2 * n
  end

  (2..num).each { |n| perfects << n if is_perf(n) }
  "Perfect numbers up to #{num}: \n#{perfects}"
end

#Krainyk Oleh
# Given m and n integers. Compute sum of m last digits of n.
def abramove_87(n, m)
  res = 0

  while m > 0
    val = n % 10
    n = (n / 10).floor
    res = val + res
    m -= 1
  end

  puts res
end

# Given m and n integers. Compute all least common multiple
# of m,n that are less than m*n.
def abramove226(n, m)
  for numb in 0..n * m
    puts numb if (numb % n == 0) && (numb % m == 0)
  end
end

# Given n integer. Find all Mersenne prime numbers
# that are less than n.
def prime(numb)
  return false if numb == 1

  for d in 2..Math.sqrt(numb).floor
    return false if numb % d == 0
  end

  true
end

def abramove559(n)
	for numb1 in 1..n
        for numb2 in 1..n
          puts numb1 if (prime numb1) && (2**numb2 - 1 == numb1)
        end
	end
end

end
