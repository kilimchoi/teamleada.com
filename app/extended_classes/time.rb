class Time

  def pretty_date
    strftime("%B %d, %Y")
  end

  def pretty_time
    strftime("%B %d, %Y at %l:%M %p")
  end

end
