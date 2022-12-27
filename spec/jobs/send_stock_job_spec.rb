RSpec.describe SendStockJob do
  include Dry::Monads[:maybe, :result]

  subject(:job) { described_class.new(http_service: http_service) }

  let(:http_service) do
    double("http_service", is_work_day: is_work_day, get_full_stock: get_full_stock,
      check_reserve_status: check_reserve_status)
  end

  let(:is_work_day) { Success({ is_work_day: true }) }

  let(:check_reserve_status) { Success({ header: { message: "", code: 0, description: "" }, body: { ware_items: [
    {
      ItemId: "AHD5-GD0",
      ExternalItemId: "",
      ExternalItemIdError: "",
      ExternalItemIdErrorCode: "0",
      ConditionId: nil,
      Dimension: nil,
      ReservedQty: 0.0,
      ReserveDateExpires: nil,
      ExternalId: nil
    },
    {
      ItemId: "AHD5-RE0",
      ExternalItemId: "",
      ExternalItemIdError: "",
      ExternalItemIdErrorCode: "0",
      ConditionId: nil,
      Dimension: nil,
      ReservedQty: 0.0,
      ReserveDateExpires: nil,
      ExternalId: nil
    },
    {
      ItemId: "HHR14B",
      ExternalItemId: "",
      ExternalItemIdError: "",
      ExternalItemIdErrorCode: "0",
      ConditionId: nil,
      Dimension: nil,
      ReservedQty: 0.0,
      ReserveDateExpires: nil,
      ExternalId: nil
    }
  ] } }) }

  let(:get_full_stock) { Success({ header: { message: "", code: 0, description: "" }, body: { category_items: [
    {
      AvailableForShippingCount: "2428",
      WareArticle: "AHD5-GD0",
      ExternalItemId: "AHD5-GD0",
      ExternalItemIdError: nil,
      ExternalItemIdErrorCode: nil,
      WarePackStatus: "OK",
      Dimension: "Осн",
      WareVendor: "Dreame",
      WarePrice: "12993,500000",
      WarePriceCurrency: "RUR",
      RRPrice: "19990,000000",
      TotalInventQty: "2545",
      AvailableForB2BOrderQty: "2364",
      InNearTransitCount: "2560",
      InFarTransitCount: "0",
      NetWeight: "1.340",
      Weight: "1.340",
      UnitVolume: "0.006",
      Width: "10.000",
      Height: "17.000",
      Depth: "35.000",
      TaxPackagingCount: "1",
      WareFullName: "Фен серый Dreame Hair Artist AHD5-GD0 Grey",
      CanBeOrdered: true,
      APIReservedQty: "3",
      APIAvailableReservedQty: "3",
      CategoryId: "БТ_Фены",
      CategoryName: "Фены",
      IsAvailablePreOrder: false,
      IsForOrder: true,
      BaseWarePriceCurrency: "RUR"
    },
    {
      AvailableForShippingCount: "1393",
      WareArticle: "AHD5-RE0",
      ExternalItemId: "AHD5-RE0",
      ExternalItemIdError: nil,
      ExternalItemIdErrorCode: nil,
      WarePackStatus: "OK",
      Dimension: "Осн",
      WareVendor: "Dreame",
      WarePrice: "12993,500000",
      WarePriceCurrency: "RUR",
      RRPrice: "19990,000000",
      TotalInventQty: "1530",
      AvailableForB2BOrderQty: "1348",
      InNearTransitCount: "2060",
      InFarTransitCount: "0",
      NetWeight: "1.340",
      Weight: "1.340",
      UnitVolume: "0.006",
      Width: "10.000",
      Height: "17.000",
      Depth: "35.000",
      TaxPackagingCount: "1",
      WareFullName: "Фен красный Dreame Hair ArtistAHD5-RE0 Red",
      CanBeOrdered: true,
      APIReservedQty: "2",
      APIAvailableReservedQty: "2",
      CategoryId: "БТ_Фены",
      CategoryName: "Фены",
      IsAvailablePreOrder: false,
      IsForOrder: true,
      BaseWarePriceCurrency: "RUR"
    },
    {
      AvailableForShippingCount: "78",
      WareArticle: "HHR14B",
      ExternalItemId: "HHR14B",
      ExternalItemIdError: nil,
      ExternalItemIdErrorCode: nil,
      WarePackStatus: "OK",
      Dimension: "Осн",
      WareVendor: "Dreame",
      WarePrice: "37990,000000",
      WarePriceCurrency: "RUR",
      RRPrice: "37990,000000",
      TotalInventQty: "82",
      AvailableForB2BOrderQty: "0",
      InNearTransitCount: "1500",
      InFarTransitCount: "500",
      NetWeight: "9.600",
      Weight: "9.600",
      UnitVolume: "0.078",
      Width: "31.700",
      Height: "72.000",
      Depth: "34.000",
      TaxPackagingCount: "1",
      WareFullName: "Беспроводной пылесос для влажной и сухой уборки Dreame Wet and Dry Vacuum H12 Black",
      CanBeOrdered: false,
      APIReservedQty: "3",
      APIAvailableReservedQty: "3",
      CategoryId: "УмД_ВертикПылесосы",
      CategoryName: "Вертикальные пылесосы",
      IsAvailablePreOrder: false,
      IsForOrder: true,
      BaseWarePriceCurrency: "RUR"
    }
  ] } }) }

  let(:merchant) { create(:merchant, code: 5813, name: "Some name") }

  describe ".do_job" do
    it "success" do
      seller = SELLERS.find { |s| s.name == merchant.code }
      job.perform(merchant.id, seller.name, "send_stock")
      expect(1).to eq(1)
    end
  end
end
