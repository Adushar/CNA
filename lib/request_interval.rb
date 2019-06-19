module RequestInterval
  def self.find_untimed(intervals)
    intervals.sort!                                                             # Sort array of arrays by first element
    covered_time = [intervals[0]]                                               # Set first time interval as covered

    intervals[1..-1].each do |start_time, end_time|                             # Start interation from second time interval
      last_interval = covered_time.last                                         # Last covered time interval
      last_end_time =  last_interval[1]

      if start_time.between?(*last_interval) and end_time > last_end_time       # If current interval`s end_time is overcrossed with preivious
        covered_time.last[1] = end_time                                         # Rewrite end_time of previous interval
      elsif end_time > last_end_time                                            # If time isn`t overcrossed
        covered_time << [start_time, end_time]                                  # Or add to covered_time
      end
    end

    uncovered_intervals = if covered_time.length >= 2
      covered_time
        .flatten[1...-1]
        .each_slice(2).to_a
      else
        []
      end
    return uncovered_intervals
  end
end
