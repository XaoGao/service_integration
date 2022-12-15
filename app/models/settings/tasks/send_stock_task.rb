module SI
  module Settings
    module Tasks
      class SendStockTask < Task
        attr_reader :set_price, :set_amount, :set_amount_type

        def initialize(task)
          super task

          raise StandardError "set_price can not be nil or empty" if task[:set_price].nil?
          raise StandardError "set_amount can not be nil or empty" if task[:set_amount].nil?
          raise StandardError "set_amount_type can not be nil or empty" if task[:set_amount_type].nil?

          @set_price = task[:set_price]
          @set_amount = task[:set_amount]
          @set_amount_type = task[:set_amount_type]
        end
      end
    end
  end
end
