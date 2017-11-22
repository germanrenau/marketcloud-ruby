require_relative 'request'
require 'faraday'
require 'json'

module Marketcloud
	class Tax < Request

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
		

		# Return all the taxes
		# @param published [Boolean] whether query only for published products, defaults to true
		# @return an array of Taxes
		def self.all(page: 1, per_page: 20)
			query = {
				per_page: per_page,
				page: page,
			}

			contents = perform_request(api_url("taxes",query), :get, nil, false)

			if contents
				contents['data'].map { |p| new(p) }
			else
				nil
			end
		end
    end
end
