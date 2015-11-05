require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  let(:valid_session) { {} }
  
  describe "GET #index" do
    it "should return http success" do
      expect(controller).to receive(:index)
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

end
