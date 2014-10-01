module ChartsHelper

  def time_chart(title, start_date, time_interval, y_axis_text, values)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: title)
      f.xAxis(type: 'datetime', minRange: 3600 * 1000)
      f.series(name: y_axis_text, yAxis: 0, data: values, pointInterval: time_interval, pointStart: start_date)

      f.yAxis [
        {title: {text: y_axis_text, margin: 70}, min: 0},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 0, layout: 'vertical')
      f.chart({defaultSeriesType: "line", zoomType: 'x'})
    end
  end

  def chart(title, start_date, y_axis_text, values)
    time_chart(title, start_date, 24 * 3600, y_axis_text, values)
  end

  def multichart(title, start_date, y_axis_text, overall_values_hash)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: title)
      f.xAxis(type: 'datetime', minRange: 3600 * 1000)

      overall_values_hash.each_pair do |key, values|
        f.series(name: key, yAxis: 0, pointInterval: 24 * 3600, pointStart: start_date, data: values)
      end

      f.yAxis [
        {title: {text: y_axis_text, margin: 70}, min: 0},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: 0, layout: 'vertical')
      f.chart({defaultSeriesType: "line", zoomType: 'x'})
    end
  end

  def nearest_hour_floor(time)
    Time.at((time.to_f / 3600).floor * 3600)
  end

  def hourly_chart_for_model(timeframe, model, title, y_axis)
    zeros = Hash[(nearest_hour_floor(timeframe).to_i..nearest_hour_floor(Time.now).to_i).step(3600).map { |hour| [ Time.at(hour), [] ] }]
    data = zeros.merge(model.where("created_at > ?", timeframe).group_by{ |user| nearest_hour_floor(user.created_at) })
    sum = model.where("created_at < ?", timeframe).count
    values = data.values.map{ |array| array.count }

    time_chart(
      title,
      nearest_hour_floor(timeframe),
      3600,
      y_axis,
      values,
    )
  end

  def time_chart_from_model(timeframe, time_interval, model, title, y_axis, method)
    zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
    data = zeros.merge(model.where("created_at > ?", timeframe).group_by{ |user| user.created_at.to_date })
    categories = data.keys.map{ |date| date.strftime("%B %d")}

    sum = model.where("created_at < ?", timeframe).count

    case method
    when "count"
      values = data.values.map{ |array| array.count }
    when "percent"
      values = data.values.map{ |array| array.count.to_f / (sum += array.count) * 100 }
    else
      values = data.values.map{ |array| sum += array.count }
    end

    time_chart(
      title,
      timeframe.to_date,
      time_interval,
      y_axis,
      values,
    )
  end

  def time_chart_from_multiple_models(timeframe, time_interval, models, title, y_axis, method)
    overall_values = Hash.new
    models.each do |model|
      zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
      data = zeros.merge(model.where("created_at > ?", timeframe).group_by{ |user| user.created_at.to_date })
      categories = data.keys.map{ |date| date.strftime("%B %d")}

      sum = model.where("created_at < ?", timeframe).count

      case method
      when "count"
        values = data.values.map{ |array| array.count }
      when "percent"
        values = data.values.map{ |array| array.count.to_f / (sum += array.count) * 100 }
      else
        values = data.values.map{ |array| sum += array.count }
      end

      overall_values[model.to_s] = values
    end

    multichart(
      title,
      timeframe.to_date,
      y_axis,
      overall_values,
    )
  end


  def chart_from_model_method(timeframe, model, title, y_axis, method)
    time_chart_from_model(timeframe, 24 * 3600, model, title, y_axis, method)
  end

  def chart_from_model(timeframe, model, title, y_axis)
    time_chart_from_model(timeframe, 24 * 3600, model, title, y_axis, "sum")
  end

  def chart_from_multiple_models(timeframe, models, title, y_axis)
    time_chart_from_multiple_models(timeframe, 24 * 3600, models, title, y_axis, "sum")
  end

  def growth_chart_from_model(timeframe, model, title, y_axis)
    time_chart_from_model(timeframe, 24 * 3600, model, title, y_axis, "percent")
  end

  def chart_for_timeframe(chart, start_date, end_date)
    overall_values = Hash.new
    days = Day.where("date >= ? AND date <= ?", start_date.to_date, end_date.to_date)
    chart.metrics.each do |metric|
      values = MetricEntry.where(metric: metric, day_id: days.pluck(:uid)).order(:day_id).pluck(:value).map{ |value| value.to_f }

      overall_values[metric.title] = values
    end

    multichart(
      chart.title,
      start_date,
      chart.y_axis_label,
      overall_values,
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
      timeframe.to_date,
      y_axis,
      overall_values,
    )
  end

  def comparison_chart(timeframe, base_model, comparison_model, attribute, value, title, y_axis)
    overall_values = {}

    zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
    all_users = zeros.merge(base_model.where("created_at > ?", timeframe).group_by{ |user| user.created_at.to_date })
    categories = all_users.keys.map{ |date| date.strftime("%B %d")}

    sum = base_model.where("created_at < ?", timeframe).count
    all_users = all_users.values.map{ |array| sum += array.count }

    comparison_ids = comparison_model.where("#{attribute} = ?", value)
    comparison_objects = Code.where(id: comparison_ids)
    project_access_users = zeros.merge(comparison_objects.collect{ |code| code.users.where("users.created_at > ?", timeframe) }.flatten.group_by{ |user| user.created_at.to_date })

    sum = comparison_objects.collect{ |code| code.users.where("users.created_at < ?", timeframe).count }.sum
    project_access_users = project_access_users.values.map{ |array| sum += array.count }

    overall_values["All Users"] = all_users
    overall_values["Users with project access"] = project_access_users

    multichart(
      title,
      timeframe.to_date,
      y_axis,
      overall_values,
    )
  end

  # Single line graphs
  def users_chart(timeframe)
    chart_from_model(timeframe, User, "Sign ups on Leada over Time (past 30 days)", "Total number of sign ups")
  end

  def growth_chart(timeframe)
    growth_chart_from_model(timeframe, User, "User Growth on Leada over Time (past 30 days)", "% of Growth")
  end

  def interest_chart(timeframe)
    chart_from_model(timeframe, ProjectInterest, "Interest in Projects on Leada (past 30 days)", "Total number of interest in projects")
  end

  def resumes_chart(timeframe)
    chart_from_model(timeframe, Resume, "Resumes uploaded on Leada (past 30 days)", "Totel number of resumes uploaded")
  end

  def employer_applications_chart(timeframe)
    chart_from_model(timeframe, EmployerApplication, "Employer Applications (past 30 days)", "Total number of employer applications submitted")
  end

  def code_submission_chart(timeframe)
    chart_from_model(timeframe, CodeSubmissionContent, "Code Submissions (past 30 days)", "Total number of code submissions")
  end

  # Multiple Models
  def project_submission_chart(timeframe)
    chart_from_multiple_models(timeframe, [
      ProjectSubmission,
      CodeSubmissionContent,
      FreeResponseSubmissionContent,
      SlidesLinkSubmissionContent,
      VideoLinkSubmissionContent,
      ImageSubmissionContent,
      PDFSubmissionContent,
      CSVSubmissionContent,
      QuizSubmissionContent,
    ], "Project Submissions by type (past 30 days)", "Total number of submissions")
  end

  # Multiple line graphs
  def multiple_projects_chart(timeframe)
    multiline_chart_from_model(timeframe, ProjectInterest, :project_id, Project, :title, "Project interest (past 30 days)", "Total number of interest in specific projects")
  end

  def detailed_users_chart(timeframe)
    comparison_chart(timeframe, User, Code, :access_type, "project-access", "Users with project access compared to all users", "Total number of sign ups")
  end

  def page_views_chart(timeframe)
    chart_from_model_method(timeframe, Impression.non_admin, "PageViews in the last 7 days", "Total number of PageViews", "count")
  end

  def one_day_chart
    hourly_chart_for_model(1.day.ago, Impression.non_admin, "PageViews in the past 24 hours", "Total number of PageViews")
  end

  # Active Users
  def active_users_chart(active_timeframe, timeframe)
    data = Hash.new
    (timeframe.to_date..Date.today).each do |day|
      data[day] = Impression.non_admin.where("created_at > ? AND created_at < ?", day - active_timeframe, day).pluck(:user_id).uniq.compact.count
    end

    categories = data.keys.map{ |date| date.strftime("%B %d")}

    title = "Active Users Chart"
    time_interval = 24 * 3600
    num_days = active_timeframe / 1.day
    y_axis = "Total Active Users for the previous #{num_days} days"

    time_chart(
      title,
      timeframe.to_date,
      time_interval,
      y_axis,
      data.values,
    )

  end

end
