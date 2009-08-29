# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eatingin_session',
  :secret      => '313d217597004261f7897a9426d280993422f989a9406b0ccfa82a6b2dc7a241c593858951d86febdc5fe0680b2ed5e9b8da43fdc8e15048566ab92cd762ac56'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
