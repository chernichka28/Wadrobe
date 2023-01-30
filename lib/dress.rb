class Dress
  attr_reader :title, :type, :temperature_range

  def initialize(title, type, temperature_range)
    @title = title
    @type = type
    @temperature_range = temperature_range
  end

  def self.from_file(file_name)
    content = File.readlines(file_name, chomp: true)
    #переведём строку в диапозон
    range_begin = content[2].scan(/[-+\s]?\d+/)[0].to_i
    range_end = content[2].scan(/[-+\s]?\d+/)[1].to_i
    range = Range.new(range_begin, range_end )

    new(content[0], content[1], range)
  end

  def suits_the_weather?(temperature)
    temperature_range.include?(temperature)
  end

  def to_s
    "#{title} (#{type}) лучше носить, когда за окном #{temperature_range}"
  end

end
