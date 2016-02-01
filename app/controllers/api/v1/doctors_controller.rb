class Api::V1::DoctorsController < ApplicationController
  
  def search
  	if(Rails.cache.exist? params[:doctor_name])
  		render json: Rails.cache.read(params[:doctor_name])
  	else
    	uri = URI.parse("https://api.betterdoctor.com/2015-01-27/doctors")
		uri_params = { :user_key => Rails.application.secrets.better_doctor_access_key, :name => params[:doctor_name] }
		uri.query = URI.encode_www_form(uri_params)
		Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
			request = Net::HTTP::Get.new uri
			response = http.request request

			if(response.code.eql? "200")
				Rails.cache.write(params[:doctor_name], response.body, expires_in: 1.minutes)
			end
			render json: response.body
		end
  	end
  end
end
