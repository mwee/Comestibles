class User < ActiveRecord::Base
  attr_accessible :email, :password, :name, :password_confirmation

  #associations
  has_many :groups#, through: :list_memberships # probably need to specify the source here...

  #password requirements - from Railscast 250 and 270
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_length_of :password, :in => 6..20, :on => :create

  #email requirements - from Railscast 250 and 270
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  #name requirements - from Railscast 250 and 270
  validates_presence_of :name, :on => :create
  validates_length_of :password, :in => 1..50, :on => :create

  def self.count_users
    return User.all.size
  end

end
