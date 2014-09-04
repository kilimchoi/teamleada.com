class ImpressionTimeframeConstraint

  def initialize
    @timeframes = Impression::TIMEFRAMES
  end

  def matches?(timeframe)
    @timeframes.include? timeframe
  end

end

