module ChartsHelper

  def chart(title, y_axis_text, x_axis_categories, values)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: title)
      f.xAxis(categories: x_axis_categories)
      f.series(name: y_axis_text, yAxis: 0, data: values)

      f.yAxis [
        {title: {text: y_axis_text, margin: 70}, min: 0},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 0, layout: 'vertical')
      f.chart({defaultSeriesType: "line"})
    end
  end

  def multichart(title, y_axis_text, x_axis_categories, overall_values_hash)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: title)
      f.xAxis(categories: x_axis_categories)

      overall_values_hash.each_pair do |key, values|
        f.series(name: key, yAxis: 0, data: values)
      end

      f.yAxis [
        {title: {text: y_axis_text, margin: 70}, min: 0},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 0, layout: 'vertical')
      f.chart({defaultSeriesType: "line"})
    end
  end

  def chart_from_model(timeframe, model, title, y_axis)
    zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
    data = zeros.merge(model.where("created_at > ?", timeframe).group_by{ |user| user.created_at.to_date })
    categories = data.keys.map{ |date| date.strftime("%B %d")}

    sum = model.where("created_at < ?", timeframe).count
    values = data.values.map{ |array| sum += array.count }

    chart(
      title,
      y_axis,
      categories,
      values,
    )
  end

  def multiline_chart_from_model(timeframe, model, join_key, label_model, label_key, title, y_axis)
    object_ids = model.all.pluck join_key

    overall_values = Hash.new

    object_ids.each do |id|
      zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
      data = zeros.merge(model.where("created_at > ? AND #{join_key} = ?", timeframe, id).group_by{ |object| object.created_at.to_date })
      sum = model.where("created_at < ? AND #{join_key} = ?", timeframe, id).count
      values = data.values.map{ |array| sum += array.count }

      key = label_model.find(id).attributes[label_key.to_s]
      overall_values[key] = values
    end

    zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
    categories = zeros.keys.map{ |date| date.strftime("%B %d")}

    multichart(
      title,
      y_axis,
      categories,
      overall_values,
    )
  end

  # Single line graphs
  def users_chart(timeframe)
    chart_from_model(timeframe, User, "Sign ups on Leada on Time (past 30 days)", "Total number of sign ups")
  end

  def interest_chart(timeframe)
    chart_from_model(timeframe, ProjectInterest, "Interest in Projects on Leada (past 30 days)", "Total number of interest in projects")
  end

  def employer_applications_chart(timeframe)
    chart_from_model(timeframe, EmployerApplication, "Employer Applications (past 30 days)", "Total number of employer applications submitted")
  end

  # Multiple line graphs
  def multiple_projects_chart(timeframe)
    multiline_chart_from_model(timeframe, ProjectInterest, :project_id, Project, :title, "Project interest (past 30 days)", "Total number of interest in specific projects")
  end

end
