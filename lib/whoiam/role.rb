class WhoIAM::Role
  extend WhoIAM::Structish
  entity_attribute :role_name, :role_policies, :trust_relationship

  class << self
    def inherited(subclass)
      WhoIAM::Pool.instance.roles[subclass.name] = subclass
    end
  end
end
