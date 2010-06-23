require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineRequireTimeEntryComments::Patches::TimeEntryTest < ActionController::TestCase

  context "TimeEntry" do
    subject { TimeEntry.new }

    should_validate_presence_of :comments

    context "#update_blank_comments_with" do
      setup do
        @existing_with_comment = TimeEntry.generate!(:comments => 'Existing')
        @existing_without_comment_1 = TimeEntry.spawn(:comments => '')
        @existing_without_comment_1.save(false)
        @existing_without_comment_2 = TimeEntry.spawn(:comments => '')
        @existing_without_comment_2.save(false)
        @existing_without_comment_3 = TimeEntry.spawn(:comments => '')
        @existing_without_comment_3.save(false)
      end
      
      should "update all TimeEntries without a comment" do
        TimeEntry.update_blank_comments_with("NO COMMENT ADDED")

        assert_equal "NO COMMENT ADDED", @existing_without_comment_1.reload.comments
        assert_equal "NO COMMENT ADDED", @existing_without_comment_2.reload.comments
        assert_equal "NO COMMENT ADDED", @existing_without_comment_3.reload.comments
      end
      
      should "skip TimeEntries with an existing comment" do
        TimeEntry.update_blank_comments_with("NO COMMENT ADDED")

        assert_equal "Existing", @existing_with_comment.reload.comments
      end
        
    end
  end
end
