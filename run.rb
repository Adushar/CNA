require './lib/request_interval'

puts 'Please, type intervals one by one splited by space. To finish filling in type "start" '
intervals = []
while true
  input = gets.chomp
  if input == "start"
    break
  else
    intervals << input.split(" ")
  end
end

uncovered_intervals = RequestInterval.find_untimed(intervals)
uncovered_intervals.each do |interval|
  puts interval.join(" ")
end
