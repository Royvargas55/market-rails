module SessionsHelper
    # Returns true if the given user is the current user.
    def current_user?(user)
      user == current_user
    end
  
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
      !current_user.nil?
    end

    def financial_approver?
      current_user.role == 3
    end

    def boss_approver?
      current_user.role == 1
    end
end
  