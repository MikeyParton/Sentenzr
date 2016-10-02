class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.string :tense
      t.string :structure
      t.integer :subject_id
      t.integer :verb_id
      t.integer :complement_id    

      t.timestamps
    end
  end
end