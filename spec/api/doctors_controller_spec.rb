require 'rails_helper'

describe "DoctorsController" , type: :controller do

  it "makes a valid proxy call" do
    get "/api/v1/doctors/search/meenal",:formate =>:json
    response.status.should eql(200)
  end

end  