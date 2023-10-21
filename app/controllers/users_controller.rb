class UsersController < Clearance::UsersController
    def create
      @user = user_from_params
  
      if @user.save
        sign_in @user  # Automatically sign in the user after registration
        redirect_to root_path, notice: 'User was successfully created and signed in.'
      else
        render template: 'users/new'  # Render the registration form again with errors
      end
    end
  
    private
  
    def user_from_params
      email = user_params.delete(:email)
      password = user_params.delete(:password)
      name = user_params.delete(:name)
      user = User.new(email: email, password: password, name: name)
  
      if user.save
        user
      else
        user.errors.each do |attribute, message|
          @user.errors.add(attribute, message)
        end
        nil
      end
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
  