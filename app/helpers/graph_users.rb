require 'twitter'

module GraphUsers

  # Gets userlist for tweets containing hashtag specified. 
  # Gets max 15 pages of tweets with twitter user IDs 
  # and returns a set of IDs that tweet. 
  def userlist_from_hashtag(tag)
    users = Set.new
    15.times do |t|
    result = Twitter.search(tag.to_s,{:rpp => 100, :page => t+1, :with_twitter_user_id => 1})
    result.map { |tweet| users.include?(tweet.from_user) ?  puts("Duplicate Detected") : users.add(tweet.from_user) }    
    end
  users
  end
end
