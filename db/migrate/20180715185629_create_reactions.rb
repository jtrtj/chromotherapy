class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.string :word
      t.string :definition
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
