class User < ActiveRecord::Base
  has_many :bills
  has_many :billcarts, foreign_key: "bill_id"

  attr_accessible :email, :password, :name, :password_confirmation

  #associations
  has_many :groups
  has_many :group_memberships
  has_many :joined_groups, :through => :group_memberships, source: "group"

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

  def owed_bills
    to_return = []
    self.joined_groups.each do |group|
      group.lists.each do |cart|
        cart.bills.each do |bill|
          if bill.pay_to.to_s == self.id.to_s and not bill.user_id == self.id
            to_return.push(bill)
          end
        end
      end
    end
    return to_return
  end

  def get_bills
    return self.bills.select{|bill| bill.user_id != self.id}
  end
end



