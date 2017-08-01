class CreateMagazines < ActiveRecord::Migration[5.1]
  def change
    create_table :magazines do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
