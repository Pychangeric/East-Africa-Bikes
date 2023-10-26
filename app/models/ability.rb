class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define abilities for users (same as before)
    can :read, :all
    cannot :read, User

    # Define abilities for admins
    if user.has_role?(:admin)
      can :manage, :all 
      can :manage, User   # Allow admins to manage (read, update, delete) users
      can :monitor, :app   # Add custom ability to monitor app usage

      # Additional abilities for admins...
    end
  end
end
