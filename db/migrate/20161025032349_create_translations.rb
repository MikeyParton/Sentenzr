class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
			t.text :entry
			t.text :explanation
			t.integer :language
      t.integer :translatable_id
      t.string :translatable_type

      t.timestamps
    end
  end
end