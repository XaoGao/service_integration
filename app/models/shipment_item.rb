class ShipmentItem < Sequel::Model(DB)
  include AASM

  aasm column: :status do
    state :init, initial: true
    state :reserved
    state :confirmed
    state :packed
    state :packing_expired
    state :shipped
    state :delivered
    state :sales_order_processe
    state :merchant_canceled_confirmation_reject
    state :merchant_canceled_confirmation_expired
    state :merchant_canceled_late_reject
    state :merchant_canceled_packing_expired
    state :merchant_canceled_shipping_expired
    state :pending_cancellation
    state :cancellin
    state :customer_canceled
    state :error

    event :exception do
      transitions form: %i[init reserved confirmed confirmed packed packing_expired shipped
                           delivered sales_order_processe merchant_canceled_confirmation_reject
                           merchant_canceled_confirmation_expired merchant_canceled_packing_expired
                           merchant_canceled_shipping_expired pending_cancellation], to: :error
    end

    event :cancel do
      transitions form: %i[init reserved confirmed confirmed packed packing_expired shipped
                           delivered sales_order_processe merchant_canceled_confirmation_reject
                           merchant_canceled_confirmation_expired merchant_canceled_packing_expired
                           merchant_canceled_shipping_expired pending_cancellation], to: :cancelling
    end

    event :next_status do
      transitions form: :init, to: :reserved
      transitions form: :reserved, to: :confirmed
      transitions form: :confirmed, to: :shipped
      transitions form: :shipped, to: :delivered
      transitions form: :delivered, to: :sales_order_processe
      transitions form: :cancel, to: :cancelling
    end

    after_all_transitions :log_status_change
  end

  many_to_one :shipment

  many_to_many :boxes, left_key: :shipment_item_id, right_key: :box_id, join_table: :shipment_item_to_boxes

  def log_status_change
    Application.logger.info "changing status shipment #{id} from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end
