class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :email, null: false
      t.integer :delivery_status, null: false

      t.timestamps
    end
    add_index :leads, :email, unique: true
  end
end
