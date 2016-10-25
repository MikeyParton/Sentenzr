class CreateDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :definitions do |t|
			t.text :entry
			t.text :example
      t.integer :definable_id
      t.string :definable_type

      t.timestamps
    end
  end
end
