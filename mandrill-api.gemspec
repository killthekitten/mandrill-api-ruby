Gem::Specification.new do |s|
    s.name = 'mandrill-api'
    s.version = '1.0.37'
    s.summary = 'A Ruby API library for the Mandrill email as a service platform.'
    s.description = s.summary
    s.authors = ['Mandrill Devs']
    s.email = 'community@mandrill.com'
    s.files = ['lib/mandrill.rb', 'lib/mandrill/api.rb', 'lib/mandrill/errors.rb']
    s.homepage = 'https://bitbucket.org/mailchimp/mandrill-api-ruby/'
    s.add_dependency 'json', '>= 1.7.7'
    s.add_dependency 'excon'
end
