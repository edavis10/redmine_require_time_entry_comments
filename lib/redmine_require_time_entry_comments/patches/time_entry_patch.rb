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
      end

      module InstanceMethods
      end
    end
  end
end
