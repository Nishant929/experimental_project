class Profile < ApplicationRecord

  before_save :default_values
  belongs_to :user


  validates :fname, :presence=> true
  validates :lname, :presence=> true
  validates :city,  :presence=> true
  validates :state, :presence=> true
  validates :country,  :presence=> true
  validates :zip_code, :presence=> true
  validates :phone_no, :presence=> true

  private
  def default_values
    followers ||= 0
    following ||= 0
    repos ||= 0
  end
end
