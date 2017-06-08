class AddAttachmentToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :attachment, index: true
    add_foreign_key :notes, :attachments
  end
end
