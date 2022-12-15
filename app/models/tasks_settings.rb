module SI
  class TasksSettings
    attr_reader :send_stock, :create_xml_feed_file, :get_new_shipments, :confirm_shipments,
                :send_shipments_to_goods, :create_journal_in_ax, :get_result_command_journal,
                :get_journal_packing, :confirm_of_packing, :get_receive_shipped, :send_shipped_to_goods,
                :receive_delivered_orders_data, :create_shipment_in_ax, :get_result_command_shipment,
                :send_cancel_shipment_items, :create_reject_journal, :get_result_command_reject_journal,
                :receiving_data_on_delivered_shipments

    def initialize(tasks_settings)
      @send_stock = SendStockTask.new tasks_settings[:send_stock] unless tasks_settings[:send_stock].nil?
      @create_xml_feed_file = CreateXmlFeedFileTask.new tasks_settings[:create_xml_feed_file] unless tasks_settings[:create_xml_feed_file].nil?
      @get_new_shipments = GetNewShipmentsTask.new tasks_settings[:get_new_shipments] unless tasks_settings[:get_new_shipments].nil?
      @confirm_shipments = ConfirmShipmentsTask.new tasks_settings[:confirm_shipments] unless tasks_settings[:confirm_shipments].nil?
      @send_shipments_to_goods = SendShipmentsToGoodsTaskTask.new tasks_settings[:send_shipments_to_goods] unless tasks_settings[:send_shipments_to_goods].nil?
      @create_journal_in_ax = CreateJournalInAxTask.new tasks_settings[:create_journal_in_ax] unless tasks_settings[:create_journal_in_ax].nil?
      @get_result_command_journal = GetResultCommandJournalTask.new tasks_settings[:get_result_command_journal] unless tasks_settings[:get_result_command_journal].nil?
      @get_journal_packing = GetJournalPackingTask.new tasks_settings[:get_journal_packing] unless tasks_settings[:get_journal_packing].nil?
      @confirm_of_packing = ConfirmOfPackingTask.new tasks_settings[:confirm_of_packing] unless tasks_settings[:confirm_of_packing].nil?
      @get_receive_shipped = GetReceiveShippedTask.new tasks_settings[:get_receive_shipped] unless tasks_settings[:get_receive_shipped].nil?
      @send_shipped_to_goods = SendShippedToGoodsTask.new tasks_settings[:send_shipped_to_goods] unless tasks_settings[:send_shipped_to_goods].nil?
      @receive_delivered_orders_data = ReceiveDeliveredOrdersDataTask.new tasks_settings[:receive_delivered_orders_data] unless tasks_settings[:receive_delivered_orders_data].nil?
      @create_shipment_in_ax = CreateShipmentInAxTask.new tasks_settings[:create_shipment_in_ax] unless tasks_settings[:create_shipment_in_ax].nil?
      @get_result_command_shipment = GetResultCommandShipmentTask.new tasks_settings[:get_result_command_shipment] unless tasks_settings[:get_result_command_shipment].nil?
      @send_cancel_shipment_items = SendCancelShipmentItemsTask.new tasks_settings[:send_cancel_shipment_items] unless tasks_settings[:send_cancel_shipment_items].nil?
      @create_reject_journal = CreateRejectJournalTask.new tasks_settings[:create_reject_journal] unless tasks_settings[:create_reject_journal].nil?
      @get_result_command_reject_journal = GetResultCommandRejectJournalTask.new tasks_settings[:get_result_command_reject_journal] unless tasks_settings[:get_result_command_reject_journal].nil?
      @receiving_data_on_delivered_shipments = ReceivingDataOnDeliveredShipmentsTask.new tasks_settings[:receiving_data_on_delivered_shipments] unless tasks_settings[:receiving_data_on_delivered_shipments].nil?
    end
  end
end
