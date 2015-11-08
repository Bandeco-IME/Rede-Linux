require 'cupsffi'

class Printer < ActiveRecord::Base
  
  # DNS for the Cups server:
  @@cups_server = '192.168.240.15'
  @@cups_server_up = system("ping -c 1 #{@@cups_server}")

  @cupsffi_object = CupsPrinter.new(@name, :hostname => @@cups_server) if @@cups_server_up 
    
  # Simple wrapper for the cupsffi gem:
  def accepting_jobs?
    if @@cups_server_up 
      return self.cupsffi_object.attributes['printer-is-accepting-jobs']
    else
      return false
    end
  end
 
  def update_status
    if self.accepting_jobs?
      new_status = @cupsffi_object.state[:state].to_s
    else
      yield # Capyabara code provided by the user to retrieve error message
    end

    # Force timestamp upgrade:
    self.update_attributes(status: new_status, updated_at: Time.now)    
  end
end
