class AddTenseModifierToSentences < ActiveRecord::Migration[5.0]
  def change
      add_column :sentences, :tense_modifier, :string
  end
end
