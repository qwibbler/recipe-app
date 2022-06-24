class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true
    can :read, Food
    return unless user.present?

    can :manage, Recipe, user: user
    can :manage, Food, user:
  end
end
