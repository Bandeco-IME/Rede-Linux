require 'rails_helper'

RSpec.describe Printer, type: :model do
  
  before(:each) do
   @cups_server = '192.168.240.15'
   @cups_server_up = system("ping -c 1 #{@cups_server}")   # Is the cups server up?
   @cupsffi_object = CupsPrinter.new('Euclides', :hostname => @cups_server)
  end

  describe "Printers information" do
    it "should not be null" do
      expect(Printer.all).not_to be_nil
    end
  end

  describe "accepting_jobs?" do
    euclides = Printer.find_by(name: 'Euclides')
    it "should not be null" do
      expect(euclides.accepting_jobs?).not_to be_nil
    end
  end
    
  describe "update_status" do
    euclides = Printer.find_by(name: 'Euclides')
    it "should not be null" do
      expect(euclides.update_status).not_to be_nil
    end
  end

end
