class ChangeProductionStatusOfOrderedProducts < ActiveRecord::Migration[5.2]
  def up
  	change_column :ordered_products, :production_status, :integer, default: 0
  end

  def down
  	change_column :ordered_products, :production_status, :integer 
  end
end
