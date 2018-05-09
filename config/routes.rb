Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount MailyHerald::Engine => "/maily", :as => "maily_herald_engine"
  mount MailyHerald::Webui::Engine => "/maily_webui"
end
