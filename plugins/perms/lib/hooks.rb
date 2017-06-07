module Perms
	class Bool < Redmine::Hook::ViewListener

		render_on :view_projects_settings_members_table_row,:partial => 'hooks/view_projects_settings_members_table_row'

	end

end