class CreateMeasles < ActiveRecord::Migration[5.1]
  def change
    create_table :measles do |t|
      t.string :school_id
      t.string :district
      t.string :facility
      t.integer :enrollment
      t.float :school_compliance
      t.string :compliance_bin
      t.float :protection
      t.string :protection_bin

      t.timestamps
    end
  end
end
