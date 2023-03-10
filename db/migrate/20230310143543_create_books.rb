class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :isbn_10
      t.string :isbn_13, null: false
      t.integer :list_price, null: false
      t.integer :publication_year, null: false
      t.string :publisher, null: false

      t.references :authors, null: false
      t.timestamps
    end
  end
end
