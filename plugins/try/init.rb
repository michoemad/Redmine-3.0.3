require_dependency 'try'
require_dependency 'issue_patch'
require_dependency 'hooks'
Redmine::Plugin.register :try do
  name 'Try plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
    settings :default => {}, :partial => 'settings/try/general'

end

ActionDispatch::Callbacks.to_prepare do
  Try.setup
end