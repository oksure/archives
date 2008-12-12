module Archives

	# fundamental class for naver gem
	class Base

		# attributes for accessing retrieved raw xml and parsed libxml root node
		attr_accessor :doc_root, :raw_xml

		# Replace this API key with your own (see http://dev.naver.com/openapi/register)
		def initialize(key=nil)
			@key = key
			@host = 'http://search.archives.go.kr/openapi'
			@api = '/search.arc'
		end

		# Takes a Archives API method name and set of parameters; returns an RSS object with the response
		def request(query, params={})
			response = http_get(request_url(query, params))
			parser, parser.string = LibXML::XML::Parser.new, response
			@raw_xml = parser.parse
			@doc_root = @raw_xml.root
			RSS.new(@doc_root)
		end

		# Takes a Archives API method name and set of parameters; returns the correct URL for the REST API.
		def request_url(query, params={})
			url = "#{@host}#{@api}?key=#{@key}&query=#{query}"
			params.each do |key, value|
				key = ABBREVIATION[key] unless ABBREVIATION[key].nil?
				url += "&#{key}=" + CGI::escape(value)
			end unless params.nil?
			url
		end

		# Does an HTTP GET on a given URL and returns the response body
		def http_get(url)
			Net::HTTP.get_response(URI.parse(URI.encode(url))).body.to_s
		end

	end
end
