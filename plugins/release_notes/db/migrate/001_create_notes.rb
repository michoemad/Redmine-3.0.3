class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.string :title
    end
  end
end
