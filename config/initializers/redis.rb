# encoded_url = URI.encode(ENV["REDIS_URL"])
# uri = URI.parse(ENV["REDIS_URL"])

# Redis.current = Redis.new(:uri => uri)   
$redis = Redis.new(url: ENV["REDIS_URL"])  