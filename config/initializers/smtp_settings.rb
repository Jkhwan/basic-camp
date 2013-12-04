ActionMailer::Base.smtp_settings = {
  address:                'smtp.gmail.com', # default: localhost
  port:                   '587',                 
  enable_starttls_auto:   true,
  user_name:              'user',
  password:               'password',
  authentication:         :plain # :plain, :login or :cram_md5
}