class Ability
    include CanCan::Ability

    def initialize(user)
        if user.nil?
            user = User.new
        end
        
        if user.has_role? :admin
            can :manage, :all
        elsif user.has_role? :super_visor
            can :manage, Firmware
            can :manage, Question
            can :manage, BOM
            can :manage, Part
            can :read, :all
        else
            can :read, :all
        end
    end
end
