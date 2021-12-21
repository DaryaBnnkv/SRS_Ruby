Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root "reports#index"

	resources :reports
	delete "/reports/:id" => "reports#destroy", as: "delete_report"

	resources :users

	get "/reports/mark/:id" => "reports#mark", as: "new_report_mark"
	post "/reports/mark/:id" => "reports#set_mark"


end
