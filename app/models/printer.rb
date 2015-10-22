require 'cupsffi'

class Printer < ActiveRecord::Base

  
  
  # DNS for the Cups server:
  @@cups_server = '192.168.240.15'

  #network_printers = CupsPrinter.get_all_printer_names(:hostname => @@cups_server)

  def update_status
    status = CupsPrinter.new(name, :hostname => @@cups_server).state[:state].to_s
  end
  
end
