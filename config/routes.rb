Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "lead#merchant"
  root "lead#home"
  get "lead/merchant" => "lead#merchant"
  get "lead/foodies" => "lead#foodies"
  post "lead/form_submit" => "lead#form_submit"
  post "lead/create" => "lead#create"
end
