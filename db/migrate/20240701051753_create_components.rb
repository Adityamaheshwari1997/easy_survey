class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|

      t.references :survey, null: false, foreign_key: true
      t.string :label
      t.text :input_text
      t.integer :position_x
      t.integer :position_y
      t.timestamps
    end
  end
end
