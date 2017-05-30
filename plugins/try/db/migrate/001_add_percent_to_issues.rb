class AddPercentToIssues < ActiveRecord::Migration
  def change
     add_column :issues, :percentage, :float
    end
end
