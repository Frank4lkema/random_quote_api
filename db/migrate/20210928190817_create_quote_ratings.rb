class CreateQuoteRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_ratings do |t|
      t.boolean :liked
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
