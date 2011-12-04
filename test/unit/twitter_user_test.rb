require 'test_helper'

class TwitterUserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   test "All records have usernames" do
	hasName = true
        TwitterUser.all
	TwitterUser.each do |t|
            if(t.username.nil?)
              hasName = false
            end
        end

   end
end
