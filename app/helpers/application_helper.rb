module ApplicationHelper
  def render_navbar_conditionally
    if current_page?(root_path)
      render 'shared/navbar'
    elsif current_page?(new_user_session_path) || current_page?(new_user_registration_path)

    else
      render 'shared/navbar_bckgrd'
    end
  end

  def render_footer
    unless current_page?(root_path) || current_page?(new_user_session_path) || current_page?(new_user_registration_path)
      render 'shared/footer'
    end
  end

# make devise resource available for partials

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
