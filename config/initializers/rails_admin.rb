RailsAdmin.config do |config|

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

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app


  config.model 'Post' do
    label 'Post'
    create do
      field :title
      field :body
      field :snippet
      field :user
      field :tags
      field :status , :enum do
        enum do
          [['Draft'],['Published'],['Archived']]
        end
      end
    end
    edit do
      field :title
      field :body
      field :snippet
      field :user
      field :tags
      field :status , :enum do
        enum do
          [['Draft'],['Published'],['Archived']]
        end
      end
    end
    list do
      field :title
      field :body
      field :snippet
      field :user
      field :tags
      field :status , :enum do
        enum do
          [['Draft'],['Published'],['Archived']]
        end
      end
    end
    show do
      field :title
      field :body
      field :snippet
      field :user
      field :tags
      field :status , :enum do
        enum do
          [['Draft'],['Published'],['Archived']]
        end
      end
    end
  end

  config.model 'Tag' do
    label 'Tag'
    create do
      field :name
    end
    edit do
      field :name
    end
    list do
      field :name
    end
    show do
      field :name
    end

  end

  config.model 'PostTag' do
    visible false
    label 'PostTag'
    create do
      field :post_id
      field :tag_id
    end
  end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
