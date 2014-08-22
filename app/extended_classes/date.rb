class Date

  def month_and_year
    strftime("%B %Y")
  end

  def self.from_date_select_params(field, params)
    date_string = params[field + "(3i)"] + "/" + params[field + "(2i)"] + "/" + params[field + "(1i)"]
    Date.parse(date_string)
  end

end
