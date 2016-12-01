class AddAttachmentPhotoToBomCategories < ActiveRecord::Migration
  def self.up
    change_table :bom_categories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :bom_categories, :photo
  end
end
