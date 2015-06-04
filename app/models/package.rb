class Package < ActiveRecord::Base
  belongs_to :user

  validates :carrier, :presence => true
  validates :tracking_number, :presence => true, :uniqueness => true
end
