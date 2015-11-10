require 'bcrypt'

class PreSignedUser < ActiveRecord::Base
  before_save :bcrypt_password
  after_save  :clear_password

  attr_accessor :password

  validates :n_usp, presence: {in: true, message: "Campo do número USP em branco;"},
                    length:   {maximum: 30, message: "Número USP fornecido muito grande;"}
  validates :name, presence:  {in: true, message: "Campo do nome em branco;"},
                    length:   {maximum: 30, message: "Nome fornecido com mais de 30 caracteres;"}
  validates :login, presence: {in: true, message: "Campo do login em branco;"},
                    length:   {maximum: 10, message: "Login fornecido com mais de 10 caracteres;"},
                    format:   {with: /\w+/i, message: "Login fornecido contem espaços em branco e/ou caracteres especiais;"}
  validates :email, presence: {in: true, message: "Campo do email em branco;"},
                    format:   {with: /\A[\w.%+-]+@[A-Z0-9.-]+\.([A-Z]{2,4})\Z/i, message: "Email fornecido inválido;"}
  validates :password, presence:     {in: true, message: "Campo da senha em branco;"},
                       confirmation: {in: true, message: "As senhas fornecidas não são iguais;"},
                       length:       {in:6..20, message: "Senha deve ter no mínimo 6 e no máximo 20 caracteres;"}

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
