require 'redmine'



Redmine::Plugin.register :redmine_appmenuadds do
  name 'Redmine Application Menu Adds plugin'
  author 'Romain Georges'
  url 'https://www.ultragreen.net/projects/show/redmine-appmenuadds'
  author_url 'http://www.ultragreen.net'  
  description 'This is a plugin for Redmine to add tabs in the Redmine Application Menu'
  version '1.4.0'


  menu :account_menu, :appmenuadds, { :controller => 'menutabs', :action => 'index' }, :caption => "Menu" , :after => :my_account, :if => Proc.new { User.current.admin? }

  if Menutab.table_exists? then 
    
     menulist = Menutab.find(:all, :order => :position)
      menulist.each {|menutab| 
        
        if menutab.wiki_type == 'custom' then 
          menu :application_menu, menutab.label, { :controller => 'menutabs', :action => 'view', :id => menutab.id},
          :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label)
        elsif menutab.wiki_type == 'project' then
          menu :application_menu, menutab.label, { :controller => 'menutabs', :action => 'forward_wiki_page', :wiki_page => menutab.wiki_page, :target_project => menutab.project },
          :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label)
        elsif menutab.wiki_type == 'external' then
          menu :application_menu, menutab.label, { :controller => 'menutabs', :action => 'external_page', :external_link => menutab.external_link },
          :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label)
        end
      }
    end

end
