PinWorkResultsShow::Application.routes.draw do
  # -- 用户登录认证相关 --
  root :to=>"index#index"
  get  '/login'  => 'sessions#new'
  post '/login'  => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  
  get  '/signup'        => 'signup#form'
  post '/signup_submit' => 'signup#form_submit'


  resources :work_results do
  	collection do
      get :next
      get :tag
    end
  end


  # 所有类型的评论都在这里，不单独定义
  resources :comments do
    collection do
      get 'show_model_comments'
      get 'received' # 我收到的评论
    end
  end


  get    '/tags/*path' => 'tags#list_by_tag'

end
