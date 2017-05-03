class AddAttachmentRepoToRepositories < ActiveRecord::Migration
  def self.up
    change_table :repositories do |t|
      t.attachment :repo
    end
  end

  def self.down
    remove_attachment :repositories, :repo
  end
end
