class MakeBlockGlobalize < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Block.create_translation_table! :name => :string, :content => :text
      end

      dir.down do
        Block.drop_translation_table!
      end
    end
  end
end
