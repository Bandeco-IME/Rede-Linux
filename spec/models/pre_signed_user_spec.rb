require 'rails_helper'

RSpec.describe PreSignedUser, type: :model do
  describe "test" do
    it "should not be null" do
     expect(PreSignedUser.all).not_to be_nil
    #it 'should require a login' do
      #test_params = {:n_usp => , :name => , :login =>"" , :email => , :password => }
      #test_user = PreSignedUser.new(test_params)
      #test_user.should_not be_valid
   end
  end
end
