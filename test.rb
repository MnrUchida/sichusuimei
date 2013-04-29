def fft(a)
  n = a.size
  return a if n == 1
  w = Complex.polar(1, -2 * Math::PI / n)
  a1 = fft((0 .. n / 2 - 1).map {|i| a[i] + a[i + n / 2] })
  a2 = fft((0 .. n / 2 - 1).map {|i| (a[i] - a[i + n / 2]) * (w ** i) })
  a1.zip(a2).flatten
end

test = []
test << 1
test << -1
test << 0
test << 1
test << 4
test << 2
test << -2
test << -4
test << -1
test << 0
test << 1
test << -1
test << 1
test << -1
test << 0
test << 1
test << 4
test << 2
test << -2
test << -4
test << -1
test << 0
test << 1
test << -1
test << 1
test << -1
test << 0
test << 1
test << 4
test << 2
test << -2
test << -4
test << -1
test << 0
test << 1
test << -1
test << 1
test << -1
test << 0
test << 1
test << 4
test << 2
test << -2
test << -4
test << -1
test << 0
test << 1
test << -1
test << 1
test << -1
test << 0
test << 1
test << 4
test << 2
test << -2
test << -4
test << -1
test << 0
test << 1
test << -1
test << 1
test << -1
test << 0
test << 1

fft(test)[0, 32].each_with_index do |v, n|
  next if n == 0
  puts "%2d Hz: %.3f" % [n, v.abs / 32]
end
