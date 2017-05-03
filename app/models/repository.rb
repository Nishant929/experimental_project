class Repository < ApplicationRecord
  before_save :default_values

  belongs_to :user
  has_many :comments, :through => :users
  has_many :searches, :through => :users

  do_not_validate_attachment_file_type :repo
  has_attached_file :repo



  def default_values
    dcount ||= 0
  end

end
