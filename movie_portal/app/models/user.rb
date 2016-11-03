class User < ActiveRecord::Base
	has_and_belongs_to_many :movies
	validates :name,:age,:role,:gender,presence:true
end
