module Heist
  class Runtime
    
    class List
      include Enumerable
      attr_reader :cells
      
      def initialize(cells)
        @cells = cells
      end
      
      def eval(scope)
        Frame.new(self, scope).evaluate
      end
      
      def each(&block)
        @cells.each(&block)
      end
      
      def first
        @cells.first
      end
      
      def rest
        self.class.new(@cells[1..-1])
      end
    end
    
  end
end

