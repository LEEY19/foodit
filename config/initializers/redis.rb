encoded_url = URI.encode(ENV["REDIS_SERVER_URL"])
uri = URI.parse(encoded_url)

Redis.current = Redis.new(:uri => uri)   