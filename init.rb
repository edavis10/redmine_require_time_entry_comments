require 'redmine'

Redmine::Plugin.register :redmine_require_time_entry_comments do
  name 'Require Time Entry Comments'
  author 'Eric Davis'
  description 'Require Time Entry Comments is a plugin to require adding comments to Time Entries.'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  version '0.1.0'
end

require 'dispatcher'
Dispatcher.to_prepare :redmine_require_time_entry_comments do

  require_dependency 'time_entry'
  TimeEntry.send(:include, RedmineRequireTimeEntryComments::Patches::TimeEntryPatch)
end
