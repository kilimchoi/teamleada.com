class String

  def urlify
    downcase.gsub(/[^a-z0-9\s]/, '').parameterize
  end

end
