require 'rubygems'
require 'excon'
require 'json'

require 'mandrill/errors'
require 'mandrill/api'

module Mandrill
    class API

        attr_accessor :host, :path, :apikey, :debug, :session

        def initialize(apikey=nil, debug=false)
            @host = 'https://mandrillapp.com'
            @path = '/api/1.0/'

            @session = Excon.new @host
            @debug = debug

            if not apikey
                if ENV['MANDRILL_APIKEY']
                    apikey = ENV['MANDRILL_APIKEY']
                else
                    apikey = read_configs
                end
            end

            raise Error, 'You must provide a Mandrill API key' if not apikey
            @apikey = apikey
        end

        def call(url, params={})
            params[:key] = @apikey
            params = JSON.generate(params)
            r = @session.post(:path => "#{@path}#{url}.json", :headers => {'Content-Type' => 'application/json'}, :body => params)
            
            cast_error(r.body) if r.status != 200
            return JSON.parse(r.body)
        end

        def read_configs()
            [File.expand_path('~/.mandrill.key'), '/etc/mandrill.key'].delete_if{ |p| not File.exist? p}.each do |path|
                f = File.new path
                apikey = f.read.strip
                f.close
                return apikey if apikey != ''
            end

            return nil
        end

        def cast_error(body)

            error_map = {
                'ValidationError' => ValidationError,
                'Invalid_Key' => InvalidKeyError,
                'Unknown_Template' => UnknownTemplateError,
                'Invalid_Tag_Name' => InvalidTagNameError,
                'Invalid_Reject' => InvalidRejectError,
                'Unknown_Sender' => UnknownSenderError,
                'Unknown_Url' => UnknownUrlError,
                'Invalid_Template' => InvalidTemplateError,
                'Unknown_Webhook' => UnknownWebhookError
            }

            begin
                error_info = JSON.parse(body)
                if error_info['status'] != 'error' or not error_info['name']
                    raise Error, "We received an unexpected error: #{body}"
                end
                if error_map[error_info['name']]
                    raise error_map[error_info['name']], error_info['message']
                else
                    raise Error, error_info['message']
                end
            rescue JSON::ParserError
                raise Error, "We received an unexpected error: #{body}"
            end
        end

        def templates()
            Templates.new self
        end
        def users()
            Users.new self
        end
        def rejects()
            Rejects.new self
        end
        def tags()
            Tags.new self
        end
        def messages()
            Messages.new self
        end
        def urls()
            Urls.new self
        end
        def webhooks()
            Webhooks.new self
        end
        def senders()
            Senders.new self
        end
    end
end

