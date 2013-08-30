require 'tire/http/clients/mock'

module Tire
  configure { |c| c.client Tire::HTTP::Client::Mock }

  module Mock
    @@mocked_response = nil

    def self.get
      @@mocked_response
    end

    def self.set(object = nil, options = {})
      hits = Array.wrap response_for(object)

      if highlight = options.delete(:highlight)
        # {title: ["<span class=\"highlight\">Test</span> Topic"]} or nil
        hits.each { |hit| hit.merge!(highlight: highlight) }
      end

      result = {hits: {total: hits.count, hits: hits}}

      if facets = options.delete(:facets)
        # {types: {_type: "terms", missing: 0, total: hits.count, other: 0, terms: [{term: type, count: hits.count}]}}
        result.merge!(facets: facets)
      end
      @@mocked_response = [MultiJson.encode(result), 200, {}]
    end

    def self.reset
      set :all
    end

    protected

    def self.response_for(object)
      case object
      when nil, :all
      when Array
        object.map { |d| response_for d }
      when Answer, Article, Question, Topic, User
        {
          _id: object.tire.index.get_id_from_document(object),
          _type: object.tire.index.get_type_from_document(object),
          _source: MultiJson.decode(object.tire.index.convert_document_to_json(object))
        }
      else
        raise "don't know how to mock item #{item.inspect}"
      end
    end
  end
end

Tire::Mock.reset