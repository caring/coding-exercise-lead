class CreateLeadRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_recipients do |t|
      t.string :email, null: false

      t.timestamps
    end
    add_index :lead_recipients, :email, unique: true
  end
end
