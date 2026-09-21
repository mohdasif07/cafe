Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get "about", to: "pages#about"
  get "menu", to: "pages#menu"
  get "gallery", to: "pages#gallery"
  get "contact", to: "pages#contact"
  post "contact", to: "pages#create_contact"

  get "privacy", to: "pages#privacy"
  get "terms", to: "pages#terms"
end
