class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true
    can :read, Food
    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
