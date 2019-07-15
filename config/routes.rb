Rails.application.routes.draw do
  namespace :api do
    resources :leads, only: [:create]
  end
end
