class MakeSectionGlobalize < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Section.create_translation_table! :name => :string, :content => :text
      end

      dir.down do
        Section.drop_translation_table!
      end
    end
  end
end
