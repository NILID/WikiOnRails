class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.references :page, foreign_key: true
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
