# coding: utf-8
class PreSignedUsersController < ApplicationController

  def new
    @pre_signed_user = PreSignedUser.new
  end

  def create
    @pre_signed_user = PreSignedUser.new(pre_signed_user_params)
    if @pre_signed_user.save
        flash[:notice] = "#{@pre_signed_user.name}, seu pré cadastro foi realizado com sucesso!\n
                            Favor comparecer a sala de administração da rede para finalizar seu cadastro."
        redirect_to '/pre-signup/pre_signed_users/'
    else
        render 'pre_signed_users/new'
    end
  end

  def queue
    @pre_signed_users = PreSignedUser.all
  end

  def index
    #Just render index view
  end

  private
  def pre_signed_user_params
    params.require(:pre_signed_user).permit(:n_usp, :name, :login, :email, :password, :password_confirmation)
  end
end
