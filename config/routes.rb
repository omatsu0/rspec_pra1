Rails.application.routes.draw do
  get 'home/index' => 'home#index'
  get 'posts/new' => 'posts#new'

end
