require 'sidekiq/web'

Rails.application.routes.draw do
  get "/unsubscribed", to: "pages#unsubscribed"

  mount MailyHerald::Webui::Engine => "/", :constraints => MailyAccessConstraint.new
  mount MailyHerald::Engine => "/unsubscribe", :as => "maily_herald_engine"

  mount Sidekiq::Web => '/sidekiq'
end
