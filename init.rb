require "require_assignee/version"

Redmine::Plugin.register :require_assignee do
  name 'Make assigned_to field required'
  author 'Ivan Nikolaev'
  description 'Plugin for Redmine to make assigned_to field required'
  version RequireAssignee::VERSION
  url 'https://github.com/destillat/redmine_plugin_require_assignee'
  author_url 'inrecolan.com'
  settings :default => {
      'enabled' => 0
  }, :partial => 'settings/require_assignee_settings'
end

Rails.configuration.to_prepare do
  require_dependency 'issue'
  require_dependency 'require_assignee_issue_patch'
  unless Issue.included_modules.include? RequireAssignee::IssuePatch
    Issue.send(:include, RequireAssignee::IssuePatch)
  end
end


  