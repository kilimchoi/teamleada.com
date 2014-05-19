module ChartsHelper

  def chart(title, y_axis_text, x_axis_categories, values)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: title)
      f.xAxis(categories: x_axis_categories)
      f.series(name: y_axis_text, yAxis: 0, data: values)

      f.yAxis [
        {title: {text: y_axis_text, margin: 70}},
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

  def users_chart(timeframe)
    chart_from_model(timeframe, User, "Sign ups on Leada on Time (past 30 days)", "Total number of sign ups")
  end

  def interest_chart(timeframe)
    chart_from_model(timeframe, ProjectInterest, "Interest in Projects on Leada (past 30 days)", "Total number of interest in projects")
  end

end
