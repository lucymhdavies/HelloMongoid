require 'sinatra'
require 'dotenv'
require 'mongoid'

Dotenv.load

Mongoid.load!("mongoid.yml", :development)

get '/' do
	bob = Person.create( first_name: "Bob" )


	"Hello. #{bob.first_name}"
end

class Person
	include Mongoid::Document

	field :first_name,  type: String
	field :middle_name, type: String
	field :last_name,   type: String

	def first_name
		"My name is #{self[:first_name]}"
	end

end


