class WelcomeController < ApplicationController

  def index
    @movie = News.latest Movie.current
  end
end
