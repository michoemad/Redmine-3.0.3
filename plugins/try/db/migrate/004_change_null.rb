class ChangeNull < ActiveRecord::Migration
  def change
     change_column_null :issues, :percentage, false, 1.00
    end
end
