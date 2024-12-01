left = []

right = []

File.readlines("input.txt").each do |line|
  l, r = line.chomp.split(/\s+/)
  left << l.to_i
  right << r.to_i
end

left.sort!
right.sort!

part1 = left.zip(right).reduce(0) do |sum_of_distance, (l, r)|
  sum_of_distance += (l - r).abs
end

puts "Part1: #{part1}"

part2 = left.reduce(0) do |similarity, num|
  similarity += (num * right.count(num))
end

puts "Part2: #{part2}"
