# coding: utf-8
require 'cupsffi'

class Printer < ActiveRecord::Base

  attr_accessor :cupsffi_object

  @@status_messages = {
    :available     => "Disponível",
    :not_available => "Indisponível",
    :out_of_paper  => "Sem papel",
  }
  
  # DNS for the Cups server:
  @@cups_server = 'cups'  
  @@cups_server_up = system("ping -c 1 #{@@cups_server}")   # Is the cups server up?

  # Simple wrapper for the cupsffi gem:
  def accepting_jobs?
    if @@cups_server_up
      self.cupsffi_object = CupsPrinter.new(self.name, :hostname => @@cups_server)
      return (self.cupsffi_object.attributes['printer-is-accepting-jobs'] == 'true')
    else
      return false
    end
  end

  # Check how this works with the automated Rake tasks at README.md
  def update_status
    if self.accepting_jobs?
      new_status = @cupsffi_object.state[:state].to_s      
    else
      yield # Capyabara code provided by the user to retrieve error message
    end

    self.update_attributes(status: new_status, updated_at: Time.now) # Force timestamp upgrade
  end
end
