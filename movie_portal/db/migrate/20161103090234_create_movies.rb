class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :rating
      t.string :language
      t.timestamps null: false
    end
  end
end
