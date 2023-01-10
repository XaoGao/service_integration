RSpec.describe SendStockJob do
  include Dry::Monads[:maybe, :result]

  subject(:job) { described_class.new(http_service:) }

  let(:http_service) do
    double("http_service", is_work_day:, get_full_stock:,
                           check_reserve_status:)
  end

  let(:is_work_day) { Success({ is_work_day: true }) }

  let(:check_reserve_status) do
    Success({ header: { message: "", code: 0, description: "" }, body: { ware_items: [
              {
                item_id: "AHD5-GD0",
                external_item_id: "",
                external_item_id_error: "",
                external_item_id_error_code: "0",
                condition_id: nil,
                dimension: nil,
                reserved_qty: 0.0,
                reserved_date_expires: nil,
                external_id: nil
              },
              {
                item_id: "AHD5-RE0",
                external_item_id: "",
                external_item_id_error: "",
                external_item_id_error_code: "0",
                condition_id: nil,
                dimension: nil,
                reserved_qty: 0.0,
                reserved_date_expires: nil,
                external_id: nil
              },
              {
                item_id: "HHR14B",
                external_item_id: "",
                external_item_id_error: "",
                external_item_id_error_code: "0",
                condition_id: nil,
                dimension: nil,
                reserved_qty: 0.0,
                reserved_date_expires: nil,
                external_id: nil
              }
            ] } })
  end

  let(:get_full_stock) do
    Success({ header: { message: "", code: 0, description: "" }, body: { category_items: [
              {
                available_for_shipping_count: "2428",
                ware_article: "AHD5-GD0",
                external_item_id: "AHD5-GD0",
                external_item_id_error: nil,
                external_item_id_error_code: nil,
                ware_packs_tatus: "OK",
                dimension: "Осн",
                ware_vendor: "Dreame",
                ware_price: "12993,500000",
                ware_price_currency: "RUR",
                rr_price: "19990,000000",
                total_invent_qty: "2545",
                available_for_b2b_order_qty: "2364",
                in_near_transit_count: "2560",
                in_far_transit_count: "0",
                net_weight: "1.340",
                weight: "1.340",
                unit_volume: "0.006",
                width: "10.000",
                height: "17.000",
                depth: "35.000",
                tax_pack_aging_count: "1",
                ware_full_name: "Фен серый Dreame Hair Artist AHD5-GD0 Grey",
                can_be_ordered: true,
                api_reserved_qty: "3",
                api_available_reserved_qty: "3",
                category_id: "БТ_Фены",
                category_name: "Фены",
                is_available_preorder: false,
                is_for_order: true,
                base_ware_price_currency: "RUR"
              },
              {
                available_for_shipping_count: "1393",
                ware_article: "AHD5-RE0",
                external_item_id: "AHD5-RE0",
                external_item_id_error: nil,
                external_item_id_error_code: nil,
                ware_packs_tatus: "OK",
                dimension: "Осн",
                ware_vendor: "Dreame",
                ware_price: "12993,500000",
                ware_price_currency: "RUR",
                rr_price: "19990,000000",
                total_invent_qty: "1530",
                available_for_b2b_order_qty: "1348",
                in_near_transit_count: "2060",
                in_far_transit_count: "0",
                net_weight: "1.340",
                weight: "1.340",
                unit_volume: "0.006",
                width: "10.000",
                height: "17.000",
                depth: "35.000",
                tax_pack_aging_count: "1",
                ware_full_name: "Фен красный Dreame Hair ArtistAHD5-RE0 Red",
                can_be_ordered: true,
                api_reserved_qty: "2",
                api_available_reserved_qty: "2",
                category_id: "БТ_Фены",
                category_name: "Фены",
                is_available_preorder: false,
                is_for_order: true,
                base_ware_price_currency: "RUR"
              },
              {
                available_for_shipping_count: "78",
                ware_article: "HHR14B",
                external_item_id: "HHR14B",
                external_item_id_error: nil,
                external_item_id_error_code: nil,
                ware_packs_tatus: "OK",
                dimension: "Осн",
                ware_vendor: "Dreame",
                ware_price: "37990,000000",
                ware_price_currency: "RUR",
                rr_price: "37990,000000",
                total_invent_qty: "82",
                available_for_b2b_order_qty: "0",
                in_near_transit_count: "1500",
                in_far_transit_count: "500",
                net_weight: "9.600",
                weight: "9.600",
                unit_volume: "0.078",
                width: "31.700",
                height: "72.000",
                depth: "34.000",
                tax_pack_aging_count: "1",
                ware_full_name: "Беспроводной пылесос для влажной и сухой уборки Dreame Wet and Dry Vacuum H12 Black",
                can_be_ordered: false,
                api_reserved_qty: "3",
                api_available_reserved_qty: "3",
                category_id: "УмД_ВертикПылесосы",
                category_name: "Вертикальные пылесосы",
                is_available_preorder: false,
                is_for_order: true,
                base_ware_price_currency: "RUR"
              }
            ] } })
  end

  let(:merchant) { create(:merchant, code: 5813, name: "Some name") }

  describe ".do_job" do
    it "success" do
      seller = SELLERS.find { |s| s.name == merchant.code }
      job.perform(merchant.id, seller.name, "send_stock")
      expect(1).to eq(1)
    end
  end
end
