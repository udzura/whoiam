class WhoIAM::User
  attr_accessor :user_name, :password, :user_policies

  def self.from_hash(params)
    user = new
    user.user_name = params[:user_name]
    user.password  = params[:password].first
    user.user_policies  = params[:policy]
  end
end
