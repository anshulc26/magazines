class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :magazine, index: true, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
