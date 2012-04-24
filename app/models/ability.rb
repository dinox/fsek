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

  def nobody
    can :read, :all
    can :update, User, :id => @user.id
  end

  def cafe
    can :manage, :cafe
    can :update, News, :user_id => @user.id
  end

  def vicecafe
    cafe
  end
=begin
  def styrelse
  # can :manage, Info
  # can :manage, News
  end

  def cafe
    styrelse #inherit styrelse perm
  # can :manage, Cafe
  end
=end

end
