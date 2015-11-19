class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.text :description
      t.string :director

      t.timestamps null: false
    end
  end
end
