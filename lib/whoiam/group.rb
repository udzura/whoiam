class WhoIAM::Group
  attr_accessor :group_name, :users, :group_policies

  def self.from_hash(params)
    group = new
    group.group_name = params[:group_name]
    group.users = params[:users]
    group.group_policies = params[:policy]
  end
end
