Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :graphql do
        collection do
          post '/', action: :execute
        end
      end
    end
  end
end
