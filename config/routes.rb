PinWorkResultsShow::Application.routes.draw do
  # -- 用户登录认证相关 --
  root :to=>"index#index"
  get  '/login'  => 'sessions#new'
  post '/login'  => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  
  get  '/signup'        => 'signup#form'
  post '/signup_submit' => 'signup#form_submit'


  resources :work_results
end