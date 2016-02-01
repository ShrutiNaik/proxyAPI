Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get 'doctors/search/:doctor_name' => 'doctors#search'
    end
  end
end
