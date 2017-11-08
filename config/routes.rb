Rails.application.routes.draw do
  match "/", to: 'urls_shortner#create', via: [:post]
  match "/:short_url", to: "urls_shortner#show", via: [:get]
end
