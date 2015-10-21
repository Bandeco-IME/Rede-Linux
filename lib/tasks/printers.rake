require 'cupsffi'
cups_server = '192.168.240.15'

namespace :printers do
  desc "Update Euclides printer status"
  task update_euclides_status: :environment do
    euclides = Printer.where(name: "Euclides").first
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
