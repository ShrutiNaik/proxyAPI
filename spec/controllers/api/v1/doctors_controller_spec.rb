require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do

  describe "GET #search" do
    it "returns http success" do
      get :search, :doctor_name => 'meenal'
      expect(response).to have_http_status(:success)
    end
  end

end
