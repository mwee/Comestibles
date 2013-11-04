class BillCart < ActiveRecord::Base
	belongs_to :ower, class_name: "User"
	belongs_to :owed, class_name: "User"
end
