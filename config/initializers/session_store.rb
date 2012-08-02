# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_schoolsys_session',
  :secret      => 'e2200a0b6e8d5f8bb51d45e9babbd34e762b6228d339be527828655f6aa17fc413fe43497fe756faee74740a5b27c22835856a52082fe62aa17d253a0135b233'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
