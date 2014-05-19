class Admin::PagesController < Admin::BaseController

  def dashboard
    @users_data = User.all.group_by{ |user| user.created_at.to_date }
    @categories = @users_data.keys
    sum = 0
    @values = @users_data.values.map{ |array| sum += array.count }
    @users_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Sign ups on Leada over Time")
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
