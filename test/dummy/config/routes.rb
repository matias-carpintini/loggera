Rails.application.routes.draw do
  get 'simulate/failure'
  mount Loggera::Engine => "/loggera"
end
