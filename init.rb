require 'redmine'



Redmine::Plugin.register :redmine_appmenuadds do
  name 'Redmine Application Menu Adds plugin'
  author 'Romain Georges'
  url 'https://www.ultragreen.net/projects/show/redmine-appmenuadds'
  author_url 'http://www.ultragreen.net'  
  description 'This is a plugin for Redmine to add tabs in the Redmine Application Menu'
  version '1.4.0'


  menu :account_menu, :appmenuadds, { :controller => 'menutabs', :action => 'index' }, :caption => "Menu" , :after => :my_account, :if => Proc.new { User.current.admin? }

end
