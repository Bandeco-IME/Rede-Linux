class PreSignedUsersController < ApplicationController

  def new
    @pre_signed_user = PreSignedUser.new
  end

  def show
    @pre_signed_users = PreSignedUser.all
  end

end
