class Ability 
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :to => :modify

    @user = user || User.new #This is the guest user    
    @user.roles.each { |role| send(role.tag.downcase) }

    if @user.roles.empty?
      can :read, :all #guest permission
    end
  end

  def admin
    can :manage, :all
  end

  def f_are
    can :read, :all
    can :update, User, :id => @user.id
  end

  def styrelse
    can :manage, Info
    can :create, News
    can :update, News, :user_id => @user.id
  end

  def cafe
    styrelse
    can :manage, :cafe
  end

  def vicecafe
    cafe
  end

  def sanning
    styrelse
    can :manage, News
    can :manage, Vecktor
  end
end
