class CreateVerbs < ActiveRecord::Migration[5.0]
  def change
    create_table :verbs do |t|
      t.string :word
      t.string :present_simple
      t.string :continuous
      t.string :past_simple
      t.string :past_participle
      t.string :kind

      t.timestamps
    end
  end
end
