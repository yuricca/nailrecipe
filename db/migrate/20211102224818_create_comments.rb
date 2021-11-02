class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text    :text,   null: false
      t.integer :nail_id
      t.integer :user_id
      t.timestamps
    end
  end
end
