module Promos
  class BasicPromoRule
    def initialize(order_id)
      raise "Not implemented"
    end

    def apply(order_id)
      raise "Not implemented"
    end

    def eligible?
      raise "Not implemented"
    end
  end
end
