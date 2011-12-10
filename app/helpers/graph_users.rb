require 'twitter'

module GraphUsers

  # Gets userlist for tweets containing hashtag specified. 
  # Gets max 15 pages of tweets with twitter user IDs 
  # and returns a set of IDs that tweet. 
  def userlist_from_hashtag(tag)
    users = Set.new
    15.times do |t|
    result = Twitter.search(tag.to_s,{:rpp => 100, :page => t+1, :with_twitter_user_id => 1})
    result.map { |tweet| users.include?(tweet.from_user_id) ?  puts("Duplicate Detected") : users.add(tweet.from_user_id) }    
    end
  users
  end

  def get_followers_from_userlist(list)
     friendslist = Hash.new
     list.map do |x| 
       if(Twitter.rate_limit_status.remaining_hits > 1)
          friendslist[x] = Twitter.follower_ids(x).ids
       else
         puts("Going to sleep for 1 hour")
         sleep(3700) 
         friendslist[x] = Twitter.follower_ids(x).ids
       end
     end
    friendslist
  end

  def save_friendslist(friendslist)
   output = 
    File.open('test.text', 'a') {|f| friendslist.map{ |k,v| v.map{|u| f.puts("#{u}\tfollows\t#{k}" ) } }}
    puts "File Saved Successfully"
  end
end
