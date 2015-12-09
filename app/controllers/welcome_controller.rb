class WelcomeController < ApplicationController
  def index
    @broken =  `/bin/ping-test`
  end
end
