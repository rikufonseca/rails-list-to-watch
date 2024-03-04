class RemoveRatingFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :rating
  end
end
