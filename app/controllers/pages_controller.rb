class PagesController < ApplicationController

  def home
    @large_header = true
  end

  def about
    @large_header = true
  end

  def handbook
  end

  def test
  end

  def error
  end

  def tutoring
  end

  def student
    @large_header = true
  end

end
