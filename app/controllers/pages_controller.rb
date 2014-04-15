class PagesController < ApplicationController

  def home
    @project = Project.first
  end

  def about
  end

  def handbook
  end

  def test
  end

  def error
  end

end
