def safe?(levels)
  diffs = levels.each_cons(2).collect do |prev, cur|
    diff = prev - cur
    if diff.abs > 3 || diff.abs < 1
      nil
    else
      diff
    end
  end
  safe = diffs.all? {|d| d != nil}
  diffs.compact!
  increasing = diffs.all? {|d| d < 0}
  decreasing = diffs.all? {|d| d > 0}
  (increasing && safe) || (decreasing && safe)
end

part1 = File.readlines("input.txt").select do |line|
  line.chomp!
  levels = line.split(/\s+/).collect(&:to_i)
  safe?(levels)
end.length

puts "Part1: #{part1}"

part2 = File.readlines("input.txt").select do |line|
  line.chomp!
  levels = line.split(/\s+/).collect(&:to_i)
  safe?(levels) || (0..levels.length-1).to_a.any? do |idx|
    level = levels.delete_at(idx)
    is_safe = safe?(levels)
    levels.insert(idx, level)
    is_safe
  end
end.length

puts "Part2: #{part2}"
