input = File.readlines("input.txt").collect(&:chomp)

r1 = /mul\(\d+\,\d+\)/
r2 = /(\d+),(\d+)/

part1 = input.collect do |line|
  line.scan(r1)
end.flatten.reduce(0) do |sum, mul|
  _, n1, n2 = mul.match(r2).to_a.collect(&:to_i)
  sum += (n1 * n2)
end

puts "Part1: #{part1}"

input = File.read("input.txt")

while input.index("don't()") != nil
  i1 = input.index("don't()")
  i2 = input[i1+1..].index("do()")
  if i2
    input[i1..i1+1+i2+3] = ""
  else
    input[i1..] = ""
  end
end

part2 = input.split("\n").collect do |line|
  line.scan(r1)
end.flatten.reduce(0) do |sum, mul|
  _, n1, n2 = mul.match(r2).to_a.collect(&:to_i)
  sum += (n1 * n2)
end

puts "Part2: #{part2}"
