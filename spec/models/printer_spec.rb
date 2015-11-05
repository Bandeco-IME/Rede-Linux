require 'rails_helper'

RSpec.describe Printer, type: :model do

  describe "Printers information" do
    it "should not be null" do
      expect(Printer.all).not_to be_nil
    end
  end
  
end
