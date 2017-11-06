Rails.application.routes.draw do
  match "/", to: 'urls_shortner#call', via: [:post]
  match "/", to: "urls_shortner#find", via: [:get]

  DynamiceRoutes.load
end
