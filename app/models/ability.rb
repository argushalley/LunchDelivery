class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can [:create], Order
      can [:read, :update, :destroy], Order, user_id: user.id
    end
  end
end
