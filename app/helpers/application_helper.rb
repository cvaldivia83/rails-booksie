module ApplicationHelper
  def render_navbar_conditionally
    unless current_page?(new_user_session_path) || current_page?(new_user_registration_path)
      render 'shared/navbar'
    end
  end
end
