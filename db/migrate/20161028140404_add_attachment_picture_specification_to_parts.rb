class AddAttachmentPictureSpecificationToParts < ActiveRecord::Migration
  def self.up
    change_table :parts do |t|
      t.attachment :picture
      t.attachment :specification
    end
  end

  def self.down
    remove_attachment :parts, :picture
    remove_attachment :parts, :specification
  end
end
