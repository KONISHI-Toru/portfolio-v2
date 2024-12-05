RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

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
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model User do
    object_label_method :email

    field :id
    field :email
    field :role, :enum do
      formatted_value do
        bindings[:object].role_before_type_cast
      end
      pretty_value do
        I18n.t("enums.user.role.#{value}") if value
      end
      enum do
        User.roles.map do |k, v|
          [I18n.t("enums.user.role.#{k}"), v]
        end.to_h
      end
    end
    field :profile do
      pretty_value do
        value&.name
      end
    end
    include_all_fields

    list do
      exclude_fields :encrypted_password, :reset_password_sent_at, :remember_created_at, :updated_at
    end
  end

  config.model TechCategory do
    list do
      sort_by :display_order
    end
  end

  config.model TechTag do
    list do
      sort_by 'tech_categories.display_order, tech_tags.display_order asc, tech_tags.id'
      sort_reverse false
    end
    exclude_fields :projects
  end

  config.model Phase do
    list do
      sort_by :display_order
    end
    exclude_fields :projects
  end

  config.model Position do
    list do
      sort_by :display_order
    end
    exclude_fields :projects
  end

  config.excluded_models = %w[
    ActiveStorage::Blob
    ActiveStorage::Attachment
    ActiveStorage::VariantRecord
  ]
end
