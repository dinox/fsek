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

	def sysop
		can :manage, :all
	end

	def styrelse
	#	can :manage, Info
	#	can :manage, News
	end

	def cafe
		styrelse #inherit styrelse perm
	#	can :manage, Cafe
	end

end
