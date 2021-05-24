Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :graphql do
        collection do
          post '/', action: :execute
        end
      end

      resources :crawlers do
        collection do
          post '/', action: :create
        end
      end
    end
  end
end
