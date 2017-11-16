require_relative 'request'
require 'faraday'
require 'json'

module Marketcloud
	class Product < Request

        def initialize(attributes)
			super
        end

        def self.plural
			"taxes"
		end

# Find an object by ID - need to instantiate it here to call the right initializer
		# @param id [Integer] the ID of the object
		# @return an object or nil
		def self.find(id = nil)
			object = perform_request api_url("#{self.plural}/#{id}"), :get, nil, true

			if object
				new object['data']
			else
				nil
			end
        end
    end
end
