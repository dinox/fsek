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

  def guest
    can :read, :all
  end

  def admin
    can :manage, :all
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
