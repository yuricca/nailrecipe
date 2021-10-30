class CreateNails < ActiveRecord::Migration[6.0]
  def change
    create_table :nails do |t|
      t.string     :title,         null: false
      t.text       :detail
      t.text       :item,          null: false
      t.text       :thumb,         null: false
      t.text       :index_finger,  null: false
      t.text       :middle_finger, null: false
      t.text       :ring_finger,   null: false
      t.text       :little_finger, null: false
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
