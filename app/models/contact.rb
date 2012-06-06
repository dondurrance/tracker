class Contact < ActiveRecord::Base
	has_and_belongs_to_many :locations
        has_many :tickets
        has_and_belongs_to_many :rooms
end
