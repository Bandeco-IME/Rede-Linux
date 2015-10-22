class PreSignedUser < ActiveRecord::Base
  validates :nid, presence: true
  validates :login, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
end
