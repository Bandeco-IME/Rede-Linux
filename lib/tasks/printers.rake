require 'cupsffi'

# CUPS server network address
cups_server = '192.168.240.15'

namespace :printers do
  # Creating one task for each printer isn't a DRY way to do this, but it will be necessary since each
  # printer has a particular status page, and we will have to parse them to get error information.

  # To do: Implement logic to check the status from CUPS and get error messages parsing the status'
  # pages using Capybara, if that is the case.
  
  desc "Update Euclides printer status"
  task update_euclides_status: :environment do
    
    # Retrieve a Printer object from the db by name:
    euclides = Printer.where(name: "Euclides").first

    # Update its status using the cupsffi gem:
    euclides.status = CupsPrinter.new("Euclides", :hostname => cups_server).state[:state].to_s
    euclides.save
  end
  
  desc "Update Galois printer status"
  task update_galois_status: :environment do
    galois = Printer.where(name: "Galois").first
    galois.status = CupsPrinter.new("Galois", :hostname => cups_server).state[:state].to_s
    galois.save
  end
  
end
