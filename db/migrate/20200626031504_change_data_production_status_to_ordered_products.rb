class ChangeDataProductionStatusToOrderedProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :ordered_products, :production_status, default: 0
  end
end
