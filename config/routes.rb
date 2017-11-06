Rails.application.routes.draw do
  match "/", to: 'urls_shorter#call', via: [:post]
  match "/", to: "urls_shorter#find", via: [:get]
end
