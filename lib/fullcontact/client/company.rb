module FullContact
  class Client
    module Company
      # Returns extended information for a given person (email, phone, twitter or facebook)
      #
      def company(options={}, faraday_options={})
        response = get("company/#{get_endpoint(options)}", options, false, faraday_options)
        format.to_s.downcase == 'xml' ? response['person'] : response
      end

      private

      def get_endpoint(options)
        if options.has_key?(:companyName)
          "search"
        else
          "lookup"
        end
      end

    end
  end
end
