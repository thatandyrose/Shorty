Rails.application.routes.draw do
  
  resources :short_urls do
    get 'click/:slug', on: :collection, action: :click, as: :click
  end

  root to: 'visitors#index'

  get ':slug' => 'short_url#click'
end
