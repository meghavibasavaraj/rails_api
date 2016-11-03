class Movie < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates :title,:year,:rating,:language,presence:true
	validates :title,length:{minimum:2},uniqueness: true
	 validates :rating, :inclusion => { :in => 1..10 }
end
