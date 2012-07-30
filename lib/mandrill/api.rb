module Mandrill

    class Templates
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def add(name, code, publish=true)
            _params = {:name => name, :code => code, :publish => publish}
            return @master.call 'templates/add', _params
        end
        def info(name)
            _params = {:name => name}
            return @master.call 'templates/info', _params
        end
        def update(name, code, publish=true)
            _params = {:name => name, :code => code, :publish => publish}
            return @master.call 'templates/update', _params
        end
        def publish(name)
            _params = {:name => name}
            return @master.call 'templates/publish', _params
        end
        def delete(name)
            _params = {:name => name}
            return @master.call 'templates/delete', _params
        end
        def list()
            _params = {}
            return @master.call 'templates/list', _params
        end
        def time_series(name)
            _params = {:name => name}
            return @master.call 'templates/time-series', _params
        end
        def render(template_name, template_content, merge_vars=nil)
            _params = {:template_name => template_name, :template_content => template_content, :merge_vars => merge_vars}
            return @master.call 'templates/render', _params
        end
    end
    class Users
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def info()
            _params = {}
            return @master.call 'users/info', _params
        end
        def ping()
            _params = {}
            return @master.call 'users/ping2', _params
        end
        def senders()
            _params = {}
            return @master.call 'users/senders', _params
        end
    end
    class Rejects
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def list(email=nil)
            _params = {:email => email}
            return @master.call 'rejects/list', _params
        end
        def delete(email)
            _params = {:email => email}
            return @master.call 'rejects/delete', _params
        end
    end
    class Tags
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def list()
            _params = {}
            return @master.call 'tags/list', _params
        end
        def info(tag)
            _params = {:tag => tag}
            return @master.call 'tags/info', _params
        end
        def time_series(tag)
            _params = {:tag => tag}
            return @master.call 'tags/time-series', _params
        end
        def all_time_series()
            _params = {}
            return @master.call 'tags/all-time-series', _params
        end
    end
    class Messages
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def send(message)
            _params = {:message => message}
            return @master.call 'messages/send', _params
        end
        def send_template(template_name, template_content, message)
            _params = {:template_name => template_name, :template_content => template_content, :message => message}
            return @master.call 'messages/send-template', _params
        end
        def search(query='*', date_from=nil, date_to=nil, tags=nil, senders=nil, limit=100)
            _params = {:query => query, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders, :limit => limit}
            return @master.call 'messages/search', _params
        end
        def parse(raw_message)
            _params = {:raw_message => raw_message}
            return @master.call 'messages/parse', _params
        end
        def send_raw(raw_message, from_email=nil, from_name=nil, to=nil)
            _params = {:raw_message => raw_message, :from_email => from_email, :from_name => from_name, :to => to}
            return @master.call 'messages/send-raw', _params
        end
    end
    class Urls
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def list()
            _params = {}
            return @master.call 'urls/list', _params
        end
        def search(q)
            _params = {:q => q}
            return @master.call 'urls/search', _params
        end
        def time_series(url)
            _params = {:url => url}
            return @master.call 'urls/time-series', _params
        end
    end
    class Webhooks
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def list()
            _params = {}
            return @master.call 'webhooks/list', _params
        end
        def add(url, events=[])
            _params = {:url => url, :events => events}
            return @master.call 'webhooks/add', _params
        end
        def info(id)
            _params = {:id => id}
            return @master.call 'webhooks/info', _params
        end
        def update(id, url, events=[])
            _params = {:id => id, :url => url, :events => events}
            return @master.call 'webhooks/update', _params
        end
        def delete(id)
            _params = {:id => id}
            return @master.call 'webhooks/delete', _params
        end
    end
    class Senders
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        def list()
            _params = {}
            return @master.call 'senders/list', _params
        end
        def domains()
            _params = {}
            return @master.call 'senders/domains', _params
        end
        def info(address)
            _params = {:address => address}
            return @master.call 'senders/info', _params
        end
        def time_series(address)
            _params = {:address => address}
            return @master.call 'senders/time-series', _params
        end
    end
end

