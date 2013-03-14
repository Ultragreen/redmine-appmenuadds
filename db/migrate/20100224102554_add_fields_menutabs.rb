class AddFieldsMenutabs < ActiveRecord::Migration
  def self.up
    add_column :menutabs, :external_link, :string
  end

  def self.down
    remove_column :menutabs, :external_link
  end
end
