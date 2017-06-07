class AddProjectIdToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :project, index: true
    add_foreign_key :notes, :projects
  end
end
