require 'bcrypt'

class PreSignedUser < ActiveRecord::Base
  before_save :bcrypt_password
  after_save  :clear_password

  attr_accessor :password

  validates :n_usp, presence: {message: "Campo do número USP em branco;"}
  validates :name,  presence: true
  validates :login, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true

  def bcrypt_password
    self.encrypt_password = BCrypt::Password.create(self.password)
  end

  def clear_password
    self.password = nil
  end
  
  def created_pre_signed_at
    year, month, day, hour = "#{self.created_at}".match(/(\d+)-(\d+)-(\d+) (.+) /).captures
    "#{day}/#{month}/#{year} às #{hour}"
  end
end
