require 'spec_helper'

describe 'TimeLog' do
  describe '#comment_text' do
    before :each do
      @user = User.create name: 'Alisha', email: 'alisha@gmail.com'
      @log  = TimeLog.create user: @user
    end

    it "should return empty if there's no comment" do
      @log.comment_text.should be nil
    end

    it "should set the comment properly" do
      @log.comment_text = "Did something"
      @log.save

      @log.comments.should_not be_empty
      @log.comments.first.comments.should == "Did something"
    end

    it "should return the right comment" do
      @log.comment_text = "Hello"
      @log.comment_text.should == "Hello"
    end

    it "should create comments properly" do
      @log = TimeLog.new user: @user
      @log.update_attributes in: Time.now, date: Date.today, comment_text: "Hello"

      @log.errors.should be_empty
      TimeLog.find(@log.id).comments.size.should == 1
      TimeLog.find(@log.id).comments.first.comments == "Hello"
    end
  end
end
