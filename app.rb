require 'sinatra'
require 'dotenv'
require 'mongoid'

Dotenv.load

Mongoid.load!("mongoid.yml", :development)

get '/' do
	bob = Person.create(
		first_name:  "Bob",
		middle_name: "Bobbertson",
		last_name:   "The Third"
	)

	bob.last_name = "The Umpteenth"

	bob.save!

	"Hello. My name is #{bob.full_name}"
end

class Person
	include Mongoid::Document

	field :first_name,  type: String
	field :middle_name, type: String
	field :last_name,   type: String

	def full_name
		"My name is #{self[:first_name]} #{self[:middle_name]} #{self[:last_name]}"
	end

end


