module Perms
	class Bool < Redmine::Hook::ViewListener


		render_on :view_projects_form, :partial => 'hooks/view_projects_form'
		render_on :view_issues_show_description_bottom, :partial => 'hooks/view_issues_show_description_bottom'

	end

end