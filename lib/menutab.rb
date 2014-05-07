
class Menutab < ActiveRecord::Base
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  validates_presence_of :label
  validates_presence_of :wiki_page, :if => Proc.new { |tab| tab.wiki_type == 'project' }
  validates_presence_of :project_id, :if => Proc.new { |tab| tab.wiki_type == 'project' }
  validates_presence_of :content_page, :if => Proc.new { |tab| tab.wiki_type == 'custom' }
  validates_presence_of :external_link, :if => Proc.new { |tab| tab.wiki_type == 'external' }

  
  acts_as_list
  def <=>(status)
     position <=> status.position
  end
end

