class UsersController < Clearance::UsersController
  def create
    @user = User.new(user_params)
  
    if @user.save
      sign_in @user
      redirect_to :root, notice: 'User was successfully created and signed in.'
    else
      render template: 'users/new'
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
  