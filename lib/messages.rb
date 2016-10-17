require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/messages/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * File System adapter
  #    adapter type: :file_system, uri: 'file:///db/bookshelf_development'
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/messages_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/messages_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/messages_development'
  #    adapter type: :sql, uri: 'mysql://localhost/messages_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #

  mapping do
    collection :messages do
      entity     Message
      repository MessageRepository

      attribute :id, Integer
      attribute :link, String
      attribute :text, String
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/messages/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
