class Mode
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def self.mode(arr)
    rslt = Mode.new(arr).compare
    rslt[rslt.keys.first].sort
  end

  def sum
    arr.each_with_object({}) do |val, into|
      into[val] = into[val].to_i + 1
      into
    end
  end

  def sort
    rslt = Hash[sum.sort_by { |_, v| v }]
    Hash[rslt.keys.reverse.zip(rslt.values.reverse)]
  end

  def compare
    sort.each_with_object({}) do |v, into|
      into[v[1]] = (into[v[1]] ||= []) << v[0]
      into
    end
  end
end
