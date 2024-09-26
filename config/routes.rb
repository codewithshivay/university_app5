Rails.application.routes.draw do
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'course_enroll', to: 'student_courses#create'
  get 'courses/search', to: 'courses#search'

  resources :passwords, only: [:new, :create] do
    collection do
      get 'enter_otp'
      post 'verify_otp'
      get 'reset_password'
    end
  end
  
  get 'mycourse', to: 'students#mycourse'
  post 'courses/like', to: 'likes#create'
  delete 'courses/dislike', to: 'likes#destroy'

end
