module RedmineRequireTimeEntryComments
  module Patches
    module TimeEntryPatch
      def self.included(base)
        base.extend(ClassMethods)

        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          validates_presence_of :comments
        end
      end

      module ClassMethods
        def update_blank_comments_with(default_comment)
          all(:conditions => ["comments = '' OR comments IS NULL"]).each do |time_entry|
            time_entry.comments = default_comment
            if time_entry.save
              logger.error "TimeEntry#update_blank_comments_with: Failed saving TimeEntry #{time_entry.id}. #{time_entry.errors.full_messages}"
            end
          end
        end
      end

      module InstanceMethods
      end
    end
  end
end
