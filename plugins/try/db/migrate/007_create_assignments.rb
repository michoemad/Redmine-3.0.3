class CreateAssignments < ActiveRecord::Migration
  def change
     create_table(:assignments) do |t|
     	t.belongs_to :user, index: true
     	t.belongs_to :issue, index: true

     end
    end
end
