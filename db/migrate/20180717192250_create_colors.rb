class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :hex_value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
