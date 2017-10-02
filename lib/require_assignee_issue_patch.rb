require_dependency 'issue'

module RequireAssignee
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        validates_presence_of :assigned_to, :on => :create, :if => Proc.new { || Setting.plugin_require_assignee['enabled'] == '1' }
      end
    end
  end
end


