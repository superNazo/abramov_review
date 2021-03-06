module Abramov
  # Yevhen Uzhva
  # 107
  def abramov_107(m)
    k = 0
    k += 1 while 4**k <= m
    k - 1
  end

  # 243a
  def abramov_243a(n)
    arr = []
    x = y = 0
    while x <= Math.sqrt(n)
      if x**2 + y**2 < n
        y += 1
      elsif x**2 + y**2 == n
        arr.push([x, y])
        y += 1
        break
      else
        x += 1
        y = 0
      end
    end
    arr
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
    number.to_s.split.unshift('1').push('1').join.to_i
  end

  # 88d
  def abramov_88d(number)
    digits = number.to_s.split(//)
    digits[0], digits[-1] = digits[-1], digits[0]
    digits.join.to_i
  end

  # 332
  def abramov_332(number)
    array = []
    (0..3).each do |i|
      array[i] = Math.sqrt(number).floor
      number = (number - array[i]**2).abs
    end
    array
  end


  #Sergiy
  def abramov_182(x)
    arr_for_v = (1..x).to_a.map { |v| v % 5 == 0 && v % 7 != 0 ? v : nil }.compact
    sum = arr_for_v.inject(0, :+)
    puts "The number of digits is: #{arr_for_v.length}"
    puts "The sum of digits is: #{sum}"
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
    puts "Coprime and natural integers are #{result}"
  end

  #178b
  def abramov_178b(n)
    result = []
    (1..n).each { |v| result.push(v) if v % 3 == 0 && v % 5 != 0 }
    result
  end

  #178c
  def abramov_178c(n)
    result = []
    (1..n).each { |v| result.push(v) if v.even? && Math.sqrt(v) % 2 == 0 }
    result
  end

  #554
  def abramov_554(n)
    result = []
    (1..n).each do |a|
      (a..n).each do |b|
        c = Math.sqrt((a * a) + (b * b))
        result.push([a, b, c.to_i]) if c <= n.to_i && c % 1 == 0
      end
    end
    result
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
    number = number.to_s
    number.reverse!
    number = number.to_i
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

  # Find sum of digits of a number
  def abramov_86a(num)
    num.to_s.split(//).inject(0) { |sum, n| sum += n.to_i }
  end

  # Count quantity of digits of a number
  def abramov_86b(num)
    num.to_s.split(//).length
  end

  # Find the first digit of the number
  def abramov_86c(num)
    num.to_s.split(//).first
  end

  # Find all perfect numbers up to the inputed one (max input value - 10 000)
  def abramov_330(num)
    perfects = []
    perfect = ->(num) { num == (1..num / 2).select { |i| num % i == 0 }.inject(:+) }
    (2..num).each { |n| perfects << n if perfect.call(n) }
    perfects
  end

  # Krainyk Oleh
  # Given m and n integers. Compute sum of m last digits of n.
  def abramov_87(n, m)
    res = 0

    while m > 0
      val = n % 10
      n = (n / 10).floor
      res = val + res
      m -= 1
    end
    res
  end

  # Given m and n integers. Compute all least common multiple
  # of m,n that are less than m*n.
  def abramov_226(n, m)
    arr = []
    (0..n * m).each { |numb| arr << numb if (numb % n == 0) && (numb % m == 0) }
    arr
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

  def abramov_559(n)
    arr = []
    for numb1 in 1..n
      for numb2 in 1..n
        arr << numb1 if (prime numb1) && (2**numb2 - 1 == numb1)
      end
    end
    arr
  end

  # Find a count of a(k), that 2^k < a(k) < k!, where a(1), ... , a(n) is a sequence of integer
  def abramov_178d(n)
    arr = []
    while arr.length < n
      arr << Random.rand(100)
    end
    i = 0
    count = 0
    f = 1
    (0...n).each do |i|
      if ((arr[i] > 2**i) && (arr[i] < f))
        count += 1
      end
      i += 1
      f *= i
    end
    count
  end

  # Find a count of a(k), that a(k) < (a(k-1) + a(k+1))/2, where a(1), ... , a(n) is a sequence of integer
  def abramov_178g(n)
    arr = []
    while arr.length < n
      arr << Random.rand(100)
    end
    i = 1
    count = 0
    (0...n-1).each do |i|
      if (arr[i] < (arr[i-1] + arr[i+1])/2)
        count += 1
      end
      i += 1
    end
    count
  end

  # Get first n rows of pascal triangle, where n is integer
  def abramov_555(n)
    (1..n).each do |i|
      arr = [1]
      count = 1
      k = 1
      (1..i-1).each do |j|
        count = count*(i-k)/k
        arr << count
        k += 1
      end
      p arr.join(" ")
    end
    'triangle'
  end
end
