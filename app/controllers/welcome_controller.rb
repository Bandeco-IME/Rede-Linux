class WelcomeController < ApplicationController
  def index
    @users = PreSignedUser.all
  end
end
