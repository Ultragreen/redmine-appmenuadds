
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

#hack to push existing links
if Menutab.table_exists? then 
  menulist = Menutab.find(:all, :order => :position)
  menulist.each {|menutab| 
    
    if menutab.wiki_type == 'custom' then 
      Redmine::MenuManager.map(:application_menu).push menutab.label.to_sym, { :controller => 'menutabs', :action => 'view', :id => menutab.id},
      :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label.to_sym)
    elsif menutab.wiki_type == 'project' then
      Redmine::MenuManager.map(:application_menu).push menutab.label.to_sym, { :controller => 'menutabs', :action => 'forward_wiki_page', :wiki_page => menutab.wiki_page, :target_project => menutab.project },
      :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label.to_sym)
    elsif menutab.wiki_type == 'external' then
      Redmine::MenuManager.map(:application_menu).push menutab.label.to_sym, { :controller => 'menutabs', :action => 'external_page', :external_link => menutab.external_link },
      :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label.to_sym)
    end
  }
end
