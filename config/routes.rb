Crowdhoster::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  # PAGES
  root                                         to: 'pages#index'

  # USERS
  devise_for :users, { path: 'account' }
  devise_scope :user do
    match '/user/settings',                    to: 'devise/registrations#edit',             as: :user_settings, via: [:get, :post, :put]
  end

  # ADMIN
  get '/admin',                                to: 'admin#admin_dashboard',                 as: :admin_dashboard
  match '/admin/homepage',                     to: 'admin#admin_homepage',                  as: :admin_homepage, via: [:get, :post, :put]
  match '/admin/site-settings',                to: 'admin#admin_site_settings',             as: :admin_site_settings, via: [:get, :post, :put]
  match '/admin/customize',                    to: 'admin#admin_customize',                 as: :admin_customize, via: [:get, :post, :put]
  namespace :admin do
    resources :campaigns
    post '/payments/:id/refund',               to: 'payments#refund_payment',               as: :admin_payment_refund
  end

  match '/admin/campaigns/:id/copy',           to: 'admin/campaigns#copy',                  as: :admin_campaigns_copy, via: [:get, :post, :put]
  match '/admin/campaigns/:id/payments',       to: 'admin/campaigns#payments',              as: :admin_campaigns_payments, via: [:get, :post, :put]
  match '/admin/processor-setup',              to: 'admin#admin_processor_setup',           as: :admin_processor_setup, via: [:get, :post, :put]
  post '/admin/bank-setup',                    to: 'admin#create_admin_bank_account',       as: :create_admin_bank_account
  get '/admin/bank-setup',                     to: 'admin#admin_bank_account',              as: :admin_bank_account
  delete '/admin/bank-setup',                  to: 'admin#delete_admin_bank_account',       as: :delete_admin_bank_account
  match '/admin/notification-setup',           to: 'admin#admin_notification_setup',        as: :admin_notification_setup, via: [:get, :post, :put]
  match '/ajax/verify',                        to: 'admin#ajax_verify',                     as: :ajax_verify, via: [:get, :post, :put]

  # CAMPAIGNS
  match '/:id/checkout/amount',                to: 'campaigns#checkout_amount',             as: :checkout_amount, via: [:get, :post, :put]
  match '/:id/checkout/payment',               to: 'campaigns#checkout_payment',            as: :checkout_payment, via: [:get, :post, :put]
  match '/:id/checkout/process',               to: 'campaigns#checkout_process',            as: :checkout_process, via: [:get, :post, :put]
  match '/:id/checkout/confirmation',          to: 'campaigns#checkout_confirmation',       as: :checkout_confirmation, via: [:get, :post, :put]
  post '/:id/checkout/error',                  to: 'campaigns#checkout_error',              as: :checkout_error
  match '/:id',                                to: 'campaigns#home',                        as: :campaign_home, via: [:get, :post, :put]
  match '/:id/ajax/create_payment_user',        to: 'campaigns#ajax_create_payment_user',    as: :ajax_create_payment_user, via: [:get, :post, :put]


  namespace :api, defaults: {format: 'json'} do
    scope module: :v0  do
      resources :campaigns, only: :show do
        resources :payments, only: :index
      end
    end
  end
end
