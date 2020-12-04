# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                category_film_comments POST   /categories/:category_id/films/:film_id/comments(.:format)                               comments#create
#             new_category_film_comment GET    /categories/:category_id/films/:film_id/comments/new(.:format)                           comments#new
#            edit_category_film_comment GET    /categories/:category_id/films/:film_id/comments/:id/edit(.:format)                      comments#edit
#                 category_film_comment PATCH  /categories/:category_id/films/:film_id/comments/:id(.:format)                           comments#update
#                                       PUT    /categories/:category_id/films/:film_id/comments/:id(.:format)                           comments#update
#                                       DELETE /categories/:category_id/films/:film_id/comments/:id(.:format)                           comments#destroy
#                        category_films GET    /categories/:category_id/films(.:format)                                                 films#index
#                    edit_category_film GET    /categories/:category_id/films/:id/edit(.:format)                                        films#edit
#                         category_film GET    /categories/:category_id/films/:id(.:format)                                             films#show
#                                       PATCH  /categories/:category_id/films/:id(.:format)                                             films#update
#                                       PUT    /categories/:category_id/films/:id(.:format)                                             films#update
#                                       DELETE /categories/:category_id/films/:id(.:format)                                             films#destroy
#                            categories GET    /categories(.:format)                                                                    categories#index
#                                 films POST   /films(.:format)                                                                         films#create
#                              new_film GET    /films/new(.:format)                                                                     films#new
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :categories, only: [:index] do
    resources :films, except: [:new, :create] do
      resources :comments, only: [:create, :destroy, :edit, :new, :update]
    end
  end

  resources :films, only: [:new, :create]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
