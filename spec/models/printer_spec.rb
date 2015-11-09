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

  describe "Check if it is accepting jobs" do
    it "should check if the server is up" do
    	expect(@cups_server_up).to be true
    end
    
    it  "Should return if it is accepting jobs" do
	expect(@cupsffi_object.attributes['printer-is-accepting-jobs']).to eql("true")
    end	
  end

end
