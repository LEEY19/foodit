Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "lead#merchant"
  root "lead#home"
  get "lead/merchant" => "lead#merchant", path: "restaurants"
  get "lead/foodies" => "lead#foodies", path: "diners"
  get "lead/pricing" => "lead#pricing", path: "pricing"
  post "lead/create" => "lead#create"
  get "lead/thank_you" => "lead#thank_you", path: "thanks"
  get "lead/query_community" => "lead#query_community", :as => 'query_community'
  get "lead/query_unit" => "lead#query_unit", :as => 'query_unit'
end
