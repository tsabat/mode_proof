# mode_spec.rb
require './lib/mode'
require 'awesome_print'

describe Mode do
  it '#sum' do
    mode = Mode.new(double_mode)
    expect(mode.sum[5]).to eq(2)
  end

  it 'no mode' do
    expect(Mode.mode(no_mode)).to eq(no_mode.sort)
  end

  it 'single mode' do
    expect(Mode.mode(single_mode)).to eq([8])
  end

  it 'double mode' do
    expect(Mode.mode(double_mode)).to eq([5, 6])
  end

  it 'triple mode' do
    rslt = Mode.mode(tripple_mode)
    expect(rslt).to eq([1, 2, 3])
    rslt = Mode.mode(tripple_backward)
    expect(rslt).to eq([1, 2, 3])
  end

  def random_array
    10.times.map { Random.rand(11) }
  end

  def double_mode
    [1, 2, 3, 4, 5, 5, 6, 6, 8, 9]
  end

  def tripple_mode
    [1, 1, 1, 2, 2, 2, 3, 3, 3, 4]
  end

  def tripple_backward
    [1, 1, 1, 2, 2, 2, 3, 3, 3, 4].reverse
  end

  def no_mode
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def single_mode
    [1, 2, 3, 4, 5, 6, 7, 8, 8]
  end
end
