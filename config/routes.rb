#get 'menutabs(/:action(/:id))', to:  'menutabs'

RedmineApp::Application.routes.draw do
  match 'menutabs/:action(/:id)', :controller => 'menutabs', :via => [:get, :post]
end
