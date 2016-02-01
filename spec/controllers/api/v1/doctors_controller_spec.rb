require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do

  describe "GET #search" do
    it "returns http success" do
      get :search, :doctor_name => 'ted'
      expect(response).to have_http_status(:success)
    end

    it "returns 200 response on successful calls" do
    	get :search, :doctor_name => 'ted'
    	expect(response).to have_http_status(200)
    end

    it "returns success when no search record found" do
    	get :search, :doctor_name => 'xyz'
    	expect(response).to have_http_status(:success)
    	expect(response.status).to eq 200
	end


  end

end
