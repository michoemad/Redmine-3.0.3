require_dependency 'try'
require_dependency 'issue_patch'
require_dependency 'hooks'
Redmine::Plugin.register :try do
  name 'Percentage Allocation'
  author 'Michael Karras'
  description 'This plugin allows the user to assign a certain percentage allocation to some issue'
  version '0.0.2'
    settings :default => {}, :partial => 'settings/try/general'

end

ActionDispatch::Callbacks.to_prepare do
  Try.setup
end