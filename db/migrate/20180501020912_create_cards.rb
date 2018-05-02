class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title, null:false, index: {unique: true}
      t.text :body, null:false
      t.integer :category_id, null:false

      t.timestamps
    end
  end
end
