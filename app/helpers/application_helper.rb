module ApplicationHelper
  def render_navbar_conditionally
    if current_page?(root_path)
      render 'shared/navbar'
    elsif current_page?(new_user_session_path) || current_page?(new_user_registration_path)

    else
      render 'shared/navbar-bckgrd'
    end
  end
end
