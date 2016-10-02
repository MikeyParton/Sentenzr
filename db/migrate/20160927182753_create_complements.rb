class CreateComplements < ActiveRecord::Migration[5.0]
  def change
    create_table :complements do |t|
      t.string :word
      t.string :pronoun

      t.timestamps
    end
  end
end
