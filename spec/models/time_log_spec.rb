require 'spec_helper'

describe 'TimeLog' do
  describe '#comment_text' do
    before :each do
      @user = User.create name: 'Alisha', email: 'alisha@gmail.com'
      @log  = TimeLog.create user: @user
    end

    it "should return nil if there's no comment" do
      @log.comment_text.should == nil
    end

    it "should set the comment properly" do
      @log.comment_text = "Did something"

      @log.comment.should_not == nil
      @log.comment.comments.should == "Did something"
    end

    it "should return the right comment" do
      @log.comment_text = "Hello"
      @log.comment_text.should == "Hello"
    end
  end
end
