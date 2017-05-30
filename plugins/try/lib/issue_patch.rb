require_dependency 'issue'

module IssuePatch


    def self.included(base)
        base.send(:extend, ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
             # Send unloadable so it will not be unloaded in development

            safe_attributes 'percentage'
            has_many :assignments
            has_many :assignees, through: :assignments, :source => :user
        end

    end


    module ClassMethods

    end

    module InstanceMethods
        def percentage=(val)
            write_attribute(:percentage, (val.to_f/100.0).to_s)
        end


         
    end

end

Rails.configuration.to_prepare do
    #unless Issue.included_modules.include? IssuePatch
        Issue.send(:include, IssuePatch)
    #end
end