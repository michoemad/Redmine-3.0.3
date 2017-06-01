# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get '/projects/:project_id/release_notes/', :to => "doc_creator#index"
get '/projects/:project_id/release_notes/create', :to => "doc_creator#create"
get '/projects/:project_id/release_notes/new', :to => "doc_creator#new"