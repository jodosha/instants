require 'lotus/model'
Dir["#{ __dir__ }/instants/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/instants_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/instants_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/instants_development'
  #    adapter type: :sql, uri: 'mysql://localhost/instants_development'
  #
  adapter type: :file_system, uri: ENV['INSTANTS_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :users do
      entity     User
      repository UserRepository

      attribute :id,           Integer
      attribute :instagram_id, Integer
      attribute :username,     String
    end

    collection :pictures do
      entity     Picture
      repository PictureRepository

      attribute :id,           Integer
      attribute :user_id,      Integer
      attribute :instagram_id, String
      attribute :caption,      String
      attribute :link,         String
      attribute :url,          String
    end
  end
end.load!
