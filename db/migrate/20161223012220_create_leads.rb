class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :email
      t.string :lead_type

      t.timestamps
    end
  end
end
