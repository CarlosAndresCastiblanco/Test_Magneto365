class WelcomeController < ApplicationController
  # self.main_menu = false

  def index
    @movies = Movie.latest User.current
  end

  def robots
    @projects = Project.all_public.active
    render :layout => false, :content_type => 'text/plain'
  end
end