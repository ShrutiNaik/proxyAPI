require 'rails_helper'

describe "API authentication" , :type => :api do

  it "making a request without cookie token " do
    get "/api/v1/doctors/search/meenal",:formate =>:json
    last_response.status.should eql(200)
    #error = {:error=>'You need to sign in or sign up before continuing.'}
    #last_response.body.should  eql(error.to_json)
  end

end  