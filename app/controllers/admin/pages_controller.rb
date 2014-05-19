class Admin::PagesController < Admin::BaseController

  def dashboard
    timeframe = 30.days.ago
    zeros = Hash[(timeframe.to_date..Date.today).map { |day| [ day, [] ] }]
    @users_data = zeros.merge(User.where("created_at > ?", timeframe).group_by{ |user| user.created_at.to_date })
    @categories = @users_data.keys.map{ |date| date.strftime("%B %d")}
    sum = User.where("created_at < ?", timeframe).count
    @values = @users_data.values.map{ |array| sum += array.count }
    @users_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Sign ups on Leada over Time (past 30 days)")
      f.xAxis(:categories => @categories)
      f.series(:name => "Total number of sign ups", :yAxis => 0, :data => @values)

      f.yAxis [
        {:title => {:text => "Total number of sign ups", :margin => 70} },
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"line"})
    end
  end

end
