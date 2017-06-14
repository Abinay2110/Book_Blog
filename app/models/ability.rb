class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
	
	user ||= User.new
	
	if user.roles=="admin"
		can :manage, :all
	else
		can :read, :all
	end
	
	if user.roles=="author"
		can :create, Bview
		can :update, Bview do |bview|
			bview.try(:user) == user
		end
		can :delete, Bview do |bview|
			bview.try(:user) == user
		end
	end
	
   end
   
end