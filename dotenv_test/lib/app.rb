require 'dotenv' # Appelle la gem Dotenv
Dotenv.load('.env')
require 'pry'
require 'twitter'

# Ceci appelle le fichier .env (situé dans le même dossier que celui d'où tu exécute app.rb)
# et grâce à la gem Dotenv, on importe toutes les données enregistrées dans un hash ENV

def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end

client.update('Mon premier tweet en Ruby !')

def journalists
  client = login_twitter
  client.update("#{journalists_list_sample}", result_type: "recent").take(3).collect do |tweet|
  end
end

def marry_justin
  client = login_twitter
  client.search("to:justinbierber marry me"), result_type: "recent").take(3).collect do |tweet|
    "#{tweet.user.screen_name}: #{tweet.text}"
  end
end

def like_tweets
  client = login_tweeter
  client.search("#bonjour_monde").take(25).collect do |tweet|
    client.favorite(tweet)
  end
end

def follow_tweets
  client = login_tweeter
  client.search("#bonjour_monde").take(25).collect do |users|
    client.follow(users)
  end
end

follow_tweets
