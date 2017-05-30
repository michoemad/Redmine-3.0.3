class Mgonoon < ActiveRecord::Migration
  def change
     change_column :issues, :percentage, :float, :null => 1.00, :default => 1.00
    end
end
