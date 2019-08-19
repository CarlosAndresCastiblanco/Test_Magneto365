class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :id_movie
      t.string :name_movie
      t.string :url_picture
      t.string :day_present
      t.string :max_size

      t.timestamps
    end
  end
end
