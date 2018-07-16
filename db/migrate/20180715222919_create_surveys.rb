class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.references :color, foreign_key: true
      t.references :reaction, foreign_key: true

      t.timestamps
    end
  end
end
