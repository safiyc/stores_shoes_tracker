class ReplacePriceDatatypeInBrands < ActiveRecord::Migration[5.1]
  def change
    change_column(:brands, :price, :float)
  end
end
