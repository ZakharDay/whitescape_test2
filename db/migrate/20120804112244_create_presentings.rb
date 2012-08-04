class CreatePresentings < ActiveRecord::Migration
  def change
    create_table :presentings do |t|
      t.integer :presenter_id
      t.integer :presentable_id
      t.string :presentable_type

      t.timestamps
    end
  end
end
