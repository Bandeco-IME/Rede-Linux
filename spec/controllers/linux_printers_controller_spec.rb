require 'rails_helper'
RSpec.describe LinuxPrintersController, type: :controller do

    let(:valid_session) { {} }

    describe 'status method' do
        it 'should call the model method that get status of printers' do
            expect(LinuxPrinter).to receive(:get_status)
            get :status, {}, valid_session
        end
        it 'should select the status template for rendering' do
            allow(LinuxPrinter).to receive(:get_status)
            get :status, {}, valid_session
            response.should render_template('status')
        end
        it 'should make the staus of priters available to status' do
            fake_status = {euclides: 'status1', galois: 'status2'}
            allow(LinuxPrinter).to receive(:get_status).and_return(fake_status)
            get :status, {}, valid_session
            assigns(:status).should == fake_status
        end
    end
end
