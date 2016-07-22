class CreateBrandsStores < ActiveRecord::Migration
  def change
    create_table(:brands_stores) do |t|
      t.column(:brand_id, :int)
      t.column(:store_id, :int)
    end
  end
end
