class Movie < ActiveRecord::Base
  belongs_to :id_movie
  belongs_to :name_movie
  belongs_to :url_picture
  belongs_to :day_present
  belongs_to :max_size
end

