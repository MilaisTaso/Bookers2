class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null:false
      t.text :body, null:false
      t.string :user_id
      t.timestamps
    end
  end
end
