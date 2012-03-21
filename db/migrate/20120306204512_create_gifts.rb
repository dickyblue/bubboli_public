class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string    :name
      t.string    :permalink
      t.boolean   :available, :default => false
      t.string    :sku
      t.string    :manufacturer
      t.decimal   :price, :precision => 5, :scale => 2
      t.string    :price_search
      t.string    :merchant
      t.string    :gender
      t.string    :age_range
      t.text      :description
      t.text      :review
      t.text      :why_bubboli_loves_it
      t.boolean   :favorite

      t.timestamps
    end
  end
end
