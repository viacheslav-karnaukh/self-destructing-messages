# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/messages', to: 'messages#create'
get '/messages/:id', to: 'messages#show'
root to: 'home#index'