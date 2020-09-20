# frozen_string_literal: true

require 'unirest'

module RapidApi
  # RapidApi base class
  class Base
    attr_accessor :source, :target, :query

    def initialize(source, target)
      @source = source
      @target = target
    end

    def translation_request(query)
      @request = Unirest.post ENV.fetch('RAPID_API_BASE_URL'),
                              headers: headers, parameters: parameters(query)
    end

    def headers
      {
        'X-RapidAPI-Host' => ENV.fetch('X-RapidAPI-Host'),
        'X-RapidAPI-Key' => ENV.fetch('X-RapidAPI-Key'),
        'Accept-Encoding' => ENV.fetch('Accept-Encoding'),
        'Content-Type' => ENV.fetch('Content-Type')
      }
    end

    def parameters(query)
      {
        'source' => source,
        'q' => query,
        'target' => target
      }
    end

    def translate(query)
      return translate_array(query) if query.is_a?(Array)

      request = translation_request(query)
      begin
        request.body['data']['translations'].first['translatedText']
      rescue
        request.body['message'].truncate(100)
      end
    end

    def translate_array(arr = [])
      result = []
      arr.each do |elem|
        result << translate(elem)
      end
      result
    end
  end
end
