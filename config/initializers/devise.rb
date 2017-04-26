Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :facebook, "352786181790258", "1c972ce8de267609c527bd2e7aa96a97", callback_url: "http://localhost:3000/users/auth/facebook/callback"
  config.omniauth :google_oauth2, "60044602994-dupqv354eicjccnh1l7fumorp9darncc.apps.googleusercontent.com", "3HD4PuzFeBn2B_AW59WfgCaH"
  config.omniauth :twitter, "L4A5Mxo5CrzomMzZ7RDSbIjnz", "sdOsANSlDMHedIlIIy5xGgSd1UbHyFQ47OSExJk0n91pPI45aT"
end
