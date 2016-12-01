class AddAttachmentPhotoToPartCategories < ActiveRecord::Migration
  def self.up
    change_table :part_categories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :part_categories, :photo
  end
end
