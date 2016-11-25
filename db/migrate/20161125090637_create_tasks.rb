class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :content
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
