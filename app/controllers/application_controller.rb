class ApplicationController < ActionController::Base
	#requires users to login
  before_action :require_login

  helper :all
    protect_from_forgery

    def current_cart
      session[:cart_id] ||= Cart.create!.id
      @current_cart ||= Cart.find(session[:cart_id])
    end

    force_ssl if: :ssl_configured?

    def ssl_configured?
        !Rails.env.development?
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      return @current_user
    end
    helper_method :current_user

    #code to send users to the login page.  Copied from class
    def require_login
        unless  current_user
            flash[:error] = "You  must  be  logged  in  to  access  this  section"
            redirect_to login_url # halts request cycle
        end

        #optional, override mobile view
        if params[:type] == 'desktop'
          session[:mobile_view] = false
        else
          session[:mobile_view] = true
        end
    end
    helper_method :require_login

    def check_group_membership
      @member = @group.members.select {|m| m.id == current_user.id }
      if @member.length > 0
        return true
      else
        flash[:error] = "You are not a member of that group"
        redirect_to groups_url
      end
    end
    helper_method :check_group_membership

end
