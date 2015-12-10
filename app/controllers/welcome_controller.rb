class WelcomeController < ApplicationController
  def index
    @broken =  `/bin/ping-test`
  end

  def about
  end
  
  def hour
  end
  
  def contact
  end
  
  def old_adm
  end
  
  def rules
  end
end
