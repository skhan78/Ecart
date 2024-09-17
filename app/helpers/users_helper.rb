# frozen_string_literal: true

module UsersHelper
  def full_name(_user)
    "#{current_user.first_name} #{current_user.last_name}"
  end
end
