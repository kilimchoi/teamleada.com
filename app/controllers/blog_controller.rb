class BlogController < ApplicationController

  def load_stylesheets
    render file: File.join(Rails.root, 'public', 'blog', "css", "#{params[:path]}.#{params[:format]}")
  end

end
