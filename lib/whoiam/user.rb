class WhoIAM::User
  extend WhoIAM::Structish
  entity_attribute :user_name, :password, :user_policies

  class << self
    def inherited(subclass)
      WhoIAM::Pool.instance.users[subclass.name] = subclass
    end
  end
end
