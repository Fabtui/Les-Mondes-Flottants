RailsAdmin.config do |config|
  config.asset_source = :webpacker
  config.authenticate_with do
    warden.authenticate! scope: :user
    unless current_user.admin?
      flash[:alert] = 'Sorry, no admin access for you.'
      redirect_to main_app.root_path
    end
  end
  config.current_user_method(&:current_user)
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    export
    bulk_delete
    show do
      only ['User', 'Tattoo']
    end
    new do
      only ['User', 'Tattoo']
    end
    show_in_app
    edit do
      only ['Shop', 'User', 'Tattoo']
    end
    delete do
      only ['Tattoo']
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
