

module ProjectPatch


    def self.included(base)
        base.class_eval do
             # Send unloadable so it will not be unloaded in development
             #after_filter :only => [:create]

             def create_with_patch

             	create_without_patch
             	if @project.persisted?
             		if params["project"]["will_format"]=="on"
             			["Development Analysis","Development","Code Review","Subversion Trunk Merge"].each do |name|
             				@project.issues.create(subject:name,tracker_id: 4,author_id: User.current.id)
             			end
             		end
             	end
             end

             alias_method_chain :create, :patch
        end

    end


end

Rails.configuration.to_prepare do
    #unless Issue.included_modules.include? IssuePatch
        ProjectsController.send(:include, ProjectPatch)
    #end
end