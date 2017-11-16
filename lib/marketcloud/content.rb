require_relative 'request'
require 'faraday'
require 'json'

module Marketcloud
	class User < Request

        # very basic first implementation

    # Do not cache objects from this class
    def self.cache_me?
        true
    end
    
    def self.plural
        "contents"
    end

    def self.find(id = nil)
        object = perform_request api_url("#{self.plural}/#{id}"), :get, nil, true

        if object
            new object['data']
        else
            nil
        end
    end

    # Return all the products
		# @param published [Boolean] whether query only for published products, defaults to true
		# @return an array of Products
		def self.all(page: 1, per_page: 20)
			query = {
				per_page: per_page,
				page: page
                		
            }

			contents = perform_request(api_url("#{self.plural}",query), :get, nil, false)

			if contents
				contents['data'].map { |c| new(c) }
			else
				nil
			end
		end
end