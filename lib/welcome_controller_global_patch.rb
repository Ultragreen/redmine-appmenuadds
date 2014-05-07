require_dependency 'welcome_controller'

module WelcomeDetails
  module WelcomeControllerPatch
    def self.included(base)
      base.class_eval do
        
        def index_with_appmenuadds
          if Menutab.table_exists? then
            
            menulist = Menutab.find(:all, :order => :position)
            menulist.each {|menutab|
              
              if menutab.wiki_type == 'custom' then
                Redmine::MenuManager.map(:application_menu).push menutab.label.to_sym, { :controller => 'menutabs', :action => 'view', :id => menutab.id},
                :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label)
              elsif menutab.wiki_type == 'project' then
                Redmine::MenuManager.map(:application_menu).push menutab.label.to_sym, { :controller => 'menutabs', :action => 'forward_wiki_page', :wiki_page => menutab.wiki_page, :target_project => menutab.project }, :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label.to_sym)
              elsif menutab.wiki_type == 'external' then
                Redmine::MenuManager.map(:application_menu).push menutab.label.to_sym, { :controller => 'menutabs', :action => 'external_page', :external_link => menutab.external_link },
                :caption => Proc.new{|proj| menutab.label} unless Redmine::MenuManager.map(:application_menu).exists?(menutab.label.to_sym)
              end
              
            }
          end
          index_without_appmenuadds
        end
        alias_method_chain :index, :appmenuadds

      end
    end
  end
end

