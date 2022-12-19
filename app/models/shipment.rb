class Shipment < Sequel::Model(DB)
  include AASM

  aasm column: :status do
    state :init, initial: true
    state :confirming
    state :confirmed
    state :processing
    state :processed
    state :packing
    state :packed
    state :shipping
    state :shipped
    state :delivering
    state :delivered
    state :sales_order_processing
    state :sales_order_processed
    state :pending_cancellation
    state :cancelling
    state :cancelled
    state :error

    event :exception do
      transitions form: %i[init confirming confirmed processing processed packing packed shipping
                           shipped delivering delivered sales_order_processing sales_order_processed
                           pending_cancellation], to: :error
    end

    event :cancel do
      transitions form: %i[init confirming confirmed processing processed packing packed shipping
                           shipped delivering delivered sales_order_processing sales_order_processed], to: :cancelling
    end

    event :next_status do
      transitions form: :init, to: :confirming
      transitions form: :confirming, to: :confirmed
      transitions form: :processing, to: :processed
      transitions form: :processed, to: :packing
      transitions form: :packing, to: :packed
      transitions form: :packed, to: :shipping
      transitions form: :shipping, to: :shipped
      transitions form: :shipped, to: :delivering
      transitions form: :delivering, to: :delivered
    end

    after_all_transitions :log_status_change
  end

  many_to_one :merchant
  one_to_many :shipment_items

  def log_status_change
    Application.logger.info "changing status shipment #{id} from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end
