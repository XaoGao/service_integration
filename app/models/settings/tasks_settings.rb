module Settings
  class TasksSettings
    attr_reader :send_stock, :create_xml_feed_file, :get_new_shipments, :confirm_shipments,
                :send_shipments_to_goods, :create_journal_in_ax, :get_result_command_journal,
                :get_journal_packing, :confirm_of_packing, :get_receive_shipped, :send_shipped_to_goods,
                :receive_delivered_orders_data, :create_shipment_in_ax, :get_result_command_shipment,
                :send_cancel_shipment_items, :create_reject_journal, :get_result_command_reject_journal,
                :receiving_data_on_delivered_shipments

    def initialize(tasks_settings)
      @send_stock = Tasks::SendStockTask.new(tasks_settings[:send_stock], "SendStockJob") unless tasks_settings[:send_stock].nil?
      unless tasks_settings[:create_xml_feed_file].nil?
        @create_xml_feed_file = Tasks::CreateXmlFeedFileTask.new(tasks_settings[:create_xml_feed_file], "CreateXmlFeedFileJob")
      end
      unless tasks_settings[:get_new_shipments].nil?
        @get_new_shipments = Tasks::GetNewShipmentsTask.new(tasks_settings[:get_new_shipments], "GetNewShipmentsJob")
      end
      unless tasks_settings[:confirm_shipments].nil?
        @confirm_shipments = Tasks::ConfirmShipmentsTask.new(tasks_settings[:confirm_shipments], "ConfirmShipmentsJob")
      end
      unless tasks_settings[:send_shipments_to_goods].nil?
        @send_shipments_to_goods = Tasks::SendShipmentsToGoodsTaskTask.new(tasks_settings[:send_shipments_to_goods], "SendShipmentsToGoodsTaskJob")
      end
      unless tasks_settings[:create_journal_in_ax].nil?
        @create_journal_in_ax = Tasks::CreateJournalInAxTask.new(tasks_settings[:create_journal_in_ax], "CreateJournalInAxJob")
      end
      unless tasks_settings[:get_result_command_journal].nil?
        @get_result_command_journal = Tasks::GetResultCommandJournalTask.new(tasks_settings[:get_result_command_journal], "GetResultCommandJournalJob")
      end
      unless tasks_settings[:get_journal_packing].nil?
        @get_journal_packing = Tasks::GetJournalPackingTask.new(tasks_settings[:get_journal_packing], "GetJournalPackingJob")
      end
      unless tasks_settings[:confirm_of_packing].nil?
        @confirm_of_packing = Tasks::ConfirmOfPackingTask.new(tasks_settings[:confirm_of_packing], "ConfirmOfPackingJob")
      end
      unless tasks_settings[:get_receive_shipped].nil?
        @get_receive_shipped = Tasks::GetReceiveShippedTask.new(tasks_settings[:get_receive_shipped], "GetReceiveShippedJob")
      end
      unless tasks_settings[:send_shipped_to_goods].nil?
        @send_shipped_to_goods = Tasks::SendShippedToGoodsTask.new(tasks_settings[:send_shipped_to_goods], "SendShippedToGoodsJob")
      end
      unless tasks_settings[:receive_delivered_orders_data].nil?
        @receive_delivered_orders_data = Tasks::ReceiveDeliveredOrdersDataTask.new(tasks_settings[:receive_delivered_orders_data], "ReceiveDeliveredOrdersDataJob")
      end
      unless tasks_settings[:create_shipment_in_ax].nil?
        @create_shipment_in_ax = Tasks::CreateShipmentInAxTask.new(tasks_settings[:create_shipment_in_ax], "CreateShipmentInAxJob")
      end
      unless tasks_settings[:get_result_command_shipment].nil?
        @get_result_command_shipment = Tasks::GetResultCommandShipmentTask.new(tasks_settings[:get_result_command_shipment], "GetResultCommandShipmentJob")
      end
      unless tasks_settings[:send_cancel_shipment_items].nil?
        @send_cancel_shipment_items = Tasks::SendCancelShipmentItemsTask.new(tasks_settings[:send_cancel_shipment_items], "SendCancelShipmentItemsJob")
      end
      unless tasks_settings[:create_reject_journal].nil?
        @create_reject_journal = Tasks::CreateRejectJournalTask.new(tasks_settings[:create_reject_journal], "CreateRejectJournalJob")
      end
      unless tasks_settings[:get_result_command_reject_journal].nil?
        @get_result_command_reject_journal = Tasks::GetResultCommandRejectJournalTask.new(tasks_settings[:get_result_command_reject_journal], "GetResultCommandRejectJournalJob")
      end
      return if tasks_settings[:receiving_data_on_delivered_shipments].nil?

      @receiving_data_on_delivered_shipments = Tasks::ReceivingDataOnDeliveredShipmentsTask.new(tasks_settings[:receiving_data_on_delivered_shipments], "ReceivingDataOnDeliveredShipmentsJob")
    end

    def tasks
      [send_stock, create_xml_feed_file, get_new_shipments, confirm_shipments, send_shipments_to_goods,
       create_journal_in_ax, get_result_command_journal, get_journal_packing, confirm_of_packing, get_receive_shipped,
       send_shipped_to_goods, receive_delivered_orders_data, create_shipment_in_ax, get_result_command_shipment,
       send_cancel_shipment_items, create_reject_journal, get_result_command_reject_journal,
       receiving_data_on_delivered_shipments].compact
    end
  end
end
