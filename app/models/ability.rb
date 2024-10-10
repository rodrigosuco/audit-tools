# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # Usuário deve estar logado

    if user.role.name == "super_admin"
      can :manage, :all
    elsif user.role.name == "admin"
      can :manage, User
      can :manage, Proposal
      can :manage, Company
      can :manage, Standard
      can :manage, Item
    elsif user.role.name == "common"
      can :manage, Proposal
      can :manage, Company
      can :read, Standard
      can :manage, Item
    else
      can :read, :all
    end
  end
end
