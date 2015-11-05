require 'cupsffi'

class Printer < ActiveRecord::Base

  attr_accessor :cupsffi_object
  
  # DNS for the Cups server:
  @@cups_server = '192.168.240.15'

  after_find do |printer|
    printer.cupsffi_object = CupsPrinter.new(printer.name, :hostname => @@cups_server)
  end

  # Simple wrapper for the cupsffi gem:
  def accepting_jobs?
    return self.cupsffi_object.attributes['printer-is-accepting-jobs']
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
