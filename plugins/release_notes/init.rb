Redmine::Plugin.register :release_notes do
  name 'Release Notes plugin'
  author 'Michael Karras'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'


  menu :project_menu, :doc_creator, {:controller => 'doc_creator', :action => "index"}, :caption => "Release Notes", :after => :documents,:param => :project_id

    project_module :release_notes do
 #   permission :view_plusgantt, {:plusgantt => [:show]}
	permission :doc_creator, {:doc_creator => [:index]}
  end
end
