require_relative 'request'
require 'faraday'
require 'json'

module Marketcloud
	class Variable < Request


		def initialize(attributes)
			super
		end

		def self.plural
			"variables"
		end


		# Return all the contents
		# @param published [Boolean] whether query only for published products, defaults to true
		# @return an array of Products
		def self.all

			variables = perform_request(api_url(self.plural))

			if variables
				variables['data'].map { |p| new(p) }
			else
				nil
			end
		end

	end
end
