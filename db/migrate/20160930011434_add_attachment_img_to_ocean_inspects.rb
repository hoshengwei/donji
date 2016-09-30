class AddAttachmentImgToOceanInspects < ActiveRecord::Migration
  def self.up
    change_table :ocean_inspects do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :ocean_inspects, :img
  end
end
