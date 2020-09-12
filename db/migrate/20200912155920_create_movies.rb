class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :description
      t.string :poster
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
