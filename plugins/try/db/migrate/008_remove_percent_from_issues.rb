class RemovePercentFromIssues < ActiveRecord::Migration
  def change
     remove_column :issues, :percentage, :float
    end
end
