class CreateMenutabs < ActiveRecord::Migration
  def self.up
    create_table :menutabs do |t|
      t.column :label, :string, :null => false
      t.column :wiki_page, :string
      t.column :description, :string
      t.column :created_at,  :datetime, :null => false
      t.column :updated_at,  :datetime, :null => false
      t.column :project_id, :integer
      t.column :user_id, :integer, :null => false
      t.column :position, :integer, :default => 1
      t.column :content_page, :text
      t.column :wiki_type, :string
    end
  end

  def self.down
    drop_table :menutabs
  end
end
