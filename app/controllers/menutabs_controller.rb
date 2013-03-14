class MenutabsController < ApplicationController
    unloadable

    before_filter :find_menutab, :only => [:edit]
    def index
      list
      render :action => 'list' unless request.xhr?
    end

    def list
       @menutab_pages, @menutabs = paginate :menutabs, :per_page => 25, :order => "position"
      render :action => "list", :layout => false if request.xhr?
    end

    def update
      @menutab = Menutab.find(params[:id])
      Redmine::MenuManager.map(:application_menu).delete(@menutab.label.to_sym) if Redmine::MenuManager.map(:application_menu).exists?(@menutab.label.to_sym)     
      if @menutab.update_attributes(params[:menutab])
        add_tab_menu(@menutab)
        flash[:notice] = l(:notice_successful_update)
        redirect_to :action => 'list'
      else
        render :action => 'edit'
      end
    end


  def add
    @type_wiki = params[:type_wiki]
    @menutab = Menutab.new(params[:menutab])
    
    if request.post?
      if @menutab.save then
      	add_tab_menu(@menutab)
        flash[:notice] = l(:notice_successful_create)
        redirect_to :controller => 'menutabs', :action => 'list'
      end
    end
  end

  def edit

    Redmine::MenuManager.map(:application_menu).delete(@menutab.label.to_sym) if Redmine::MenuManager.map(:application_menu).exists?(@menutab.label.to_sym)
    if request.post? and @menutab.update_attributes(params[:menutab])
      flash[:notice] = l(:notice_successful_update)
      add_tab_menu(@menutab)
      redirect_to :controller => 'menutabs', :action => 'list'
    end
  end
  
  def view
    @tabs = Redmine::MenuManager.items(:application_menu)
    @menutab = Menutab.find(params[:id])
  end
  
  def forward_wiki_page
    wiki_page = params[:wiki_page]
    target_project = params[:target_project]
    redirect_to :controller => 'wiki', :action => 'index', :id => target_project, :page => wiki_page
  end
  
  def external_page
    external_link = params[:external_link]
    redirect_to "#{external_link}"
  end


  def remove
    @menutab = Menutab.find(params[:id])
    Menutab.destroy(params[:id])
    Redmine::MenuManager.map(:application_menu).delete(@menutab.label.to_sym) if Redmine::MenuManager.map(:application_menu).exists?(@menutab.label.to_sym)
    redirect_to :controller => 'menutabs', :action => 'list'
  end

  private 


  def add_tab_menu(menutab)
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

  end

 
   def find_menutab
     @menutab = Menutab.find(params[:id])
   rescue ActiveRecord::RecordNotFound
     render_404
   end
end
