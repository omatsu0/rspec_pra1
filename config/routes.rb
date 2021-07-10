Rails.application.routes.draw do
  root 'home/index'
  get 'posts/new' => 'posts#new'

end
