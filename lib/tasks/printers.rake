require 'cupsffi'

# CUPS server network address
cups_server = '192.168.240.15'
  
namespace :printers do
  # Creating one task for each printer isn't a DRY way to do this, but it will be necessary since each
  # printer has a particular status page, and we will have to parse them to get error information.

  # To do: Implement logic to check the status from CUPS and get error messages parsing the status'
  # pages using Capybara, if that is the case.
    
  task update_euclides_status: :environment do
    
    # Retrieve a Printer object from the db by name:
    euclides = Printer.find_by(name: 'Euclides')
    
    # Update its status using the cupsffi gem:
    status = CupsPrinter.new('Euclides', hostname: '192.168.240.15').state[:state].to_s
    euclides.update_attributes(status: status, updated_at: Time.now)
  end
  
  task update_galois_status: :environment do
    galois = Printer.find_by(name: 'Galois')
    status = CupsPrinter.new('Galois', hostname: '192.168.240.15').state[:state].to_s
    galois.update_attributes(status: status, updated_at: Time.now)
  end
  
end
