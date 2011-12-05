require 'test_helper'

class TwitterUserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   test "A hashtag value will return a search term" do
     assert TwitterUser.analyze_hashtag('#SyRia') == 'syria'
   end  
end
