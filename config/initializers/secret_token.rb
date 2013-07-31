# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
BubboliKids::Application.config.secret_token = ENV['APP_SECRET'] || 'a025ea1f1c6546a8e0e255b62fa22ad91fc45fbf88e7509549dc96945fd9c4cd5e1254c721d7090ff4818bd9e79c69edebd049b53074931a08152b222b7452c8'
