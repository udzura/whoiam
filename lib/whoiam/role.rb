class WhoIAM::Role
  attr_accessor :role_name, :role_policies, :trust_relationship

  def self.from_hash(params)
    role = new
    role.role_name = params[:role_name]
    role.role_policies = params[:policy]
    role.trust_relationship = params[:trust_relationship].first
  end
end
