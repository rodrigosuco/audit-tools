# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.role == "super_admin"
      can :manage, :all
    elsif user.role == "admin"
      can :manage, User
      can :manage, Proposal
      can :manage, Company
      can :manage, Standard
      can :manage, Item
    elsif user.role == "common"
      can :manage, Proposal
      can :manage, Company
      can :read, Standard
      can :manage, Item
    elsif user.role == "auditor"
      can :read, Company
    else
      can :read, :all
    end
  end
end
