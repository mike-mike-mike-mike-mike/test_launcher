require "delegate"

module TestLauncher
  module Frameworks
    module Implementation
      class Collection < SimpleDelegator
        alias :results :__getobj__

        def file_count
          results.group_by(&:file).size
        end

        def one_example?
          examples_found? && results.size == 1
        end

        def examples_found?
          results.any?(&:is_example?)
        end

        def last_edited
          results.sort_by(&:mtime).last
        end
      end
    end
  end
end