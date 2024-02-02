# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # guest user (not logged in)
    
    unless user.admin?
      can :manage, :all
    else
      can :read, :all
      can :destroy, Post, author_id: user.id # Check user_id / :update, 
      can :destroy, Comment, user_id: user.id # :update, 
    end
  end
end
