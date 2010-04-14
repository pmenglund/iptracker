# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iptracker_session',
  :secret      => '86219de42ca8d7c415e851f1c955416fc68377e30ea1df2401dbd7bdceaf6619d6aa5b6bb66474dfe9107645cb3afcd24484d039bcc85ebdf8076bf39a992170'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
