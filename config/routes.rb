Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth/sign_in', to: 'authentication#sign_in'
      get 'auth/refresh_token', to: 'authentication#refresh_token'
    end
  end
end
