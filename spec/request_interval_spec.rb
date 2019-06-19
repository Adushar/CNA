require 'request_interval'

RSpec.describe RequestInterval, "#find_untimed" do
  it 'returns uncovered inervals' do
    untimed_intervals = RequestInterval.find_untimed([
        [2, 6],
        [9, 12],
        [8, 9],
        [18, 21],
        [4, 7],
        [10, 11]
      ])
    expect(untimed_intervals).to eq([
        [7, 8],
        [12, 18]
      ])
  end

  it 'returns empty array' do
    untimed_intervals = RequestInterval.find_untimed([
        [1, 2],
        [3, 10],
        [2, 17],
        [1, 15],
        [4, 7],
        [10, 11]
      ])
    expect(untimed_intervals).to eq([])
  end

  it 'big numbers test' do
    untimed_intervals = RequestInterval.find_untimed([
        [1, 4554],
        [3345, 56781],
        [56781, 58781],
        [59781, 10000000]
      ])
    expect(untimed_intervals).to eq([[58781, 59781]])
  end
end
