class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.datetime :completed_at
      t.text :body

      t.timestamps null: false
    end

    add_index :items, :completed_at
  end
end
