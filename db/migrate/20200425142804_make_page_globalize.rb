class MakePageGlobalize < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Page.create_translation_table! :name => :string
      end

      dir.down do
        Page.drop_translation_table!
      end
    end
  end
end
