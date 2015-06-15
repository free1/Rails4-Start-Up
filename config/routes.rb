class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do

  mount API => "/"

  root 'home#index'
  get 'home/api_swagger_ui'

  %w(404 422 500).each do |code|
    get code, to: "errors#show", code: code
  end


  # 用户相关
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  resources :sessions, only: [:new, :create]
  # 第三方登录
  match "/auth/:provider/callback", :to => 'omniauths#create', via: [:get, :post]

  resources :users do
    collection do
      get 'verify_email'
    end
    member do
      get :following, :followers
    end
  end
  resource :settings do
    collection do
      get :account
    end
  end
  resources :relationships, only: [:create, :destroy]

  scope module: :member do
    resources :collects, only: [:create, :destroy]
    resources :tags, only: [:index]
  end


  # 商品相关
  resources :products do
    resources :comments, only: [:create, :destroy]
  end


  # 七牛上传文件
  namespace :upload do
    resources :qiniu, only: [] do
      collection do
        get 'image_up_token'
      end
    end
  end

end
