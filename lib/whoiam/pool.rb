require 'singleton'
class WhoIAM::Pool
  include Singleton
  attr_reader :users, :groups, :policies, :roles

  def initialize
    @users = {}
    @groups = {}
    @policies = {}
    @roles = {}
  end
end
