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
            time_entry.update_attribute(:comments, default_comment)
          end
        end
      end

      module InstanceMethods
      end
    end
  end
end
