# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'issues/:issue_id/generator', :to => "generate_note#create"