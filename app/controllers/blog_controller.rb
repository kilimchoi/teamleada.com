class BlogController < ApplicationController

  def home
    render file: File.join(Rails.root, 'app', 'compiled', 'blog', 'index.html')
  end

  def load_stylesheets
    render file: File.join(Rails.root, 'app', 'compiled', 'blog', 'css', "#{params[:path]}.#{params[:format]}")
  end

  def load_blog_post
    render file: File.join(Rails.root, 'app', 'compiled', 'blog/blog', "#{params[:path]}", "index.html")
  end

end
