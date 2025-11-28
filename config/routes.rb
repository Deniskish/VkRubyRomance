Rails.application.routes.draw do
  resources :students, only: [:create, :destroy]

  get "/schools/:school_id/classes", to: "school_classes#index"
  get "/schools/:school_id/classes/:class_id/students", to: "school_classes#students"
end
