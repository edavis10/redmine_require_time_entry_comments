namespace :require_time_entry_comments do
  desc "Update all time entries without a comment. Use COMMENT='a comment'"
  task :update_empty_time_entry_comments => :environment do
    comment = ENV['COMMENT']
    comment = "NO COMMENT ADDED" if comment.blank?
    TimeEntry.update_blank_comments_with(comment)
  end
end
