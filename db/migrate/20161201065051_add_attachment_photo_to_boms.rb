class AddAttachmentPhotoToBoms < ActiveRecord::Migration
  def self.up
    change_table :boms do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :boms, :photo
  end
end
