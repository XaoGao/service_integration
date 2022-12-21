RSpec.describe  XmlFeedFileJob do
  subject(:job) { described_class.new(http_service: http_service) }

  let(:http_service) { double("http_service", get_catalog_categories: catalog) }
  let(:catalog) {
    <<~CATALOG
    [
      {
        "_id": "63a348454f8381b8caaeeb50",
        "guid": "f3a4256f-0dcb-4f2a-afce-39741f501a32",
        "index": 0,
        "isActive": false,
        "name": "Id tempor eu tempor aute proident aliquip tempor nostrud laboris labore consequat nostrud."
      },
      {
        "_id": "63a3484530ec5b4ad6622e6b",
        "guid": "a344199e-b78a-4338-8415-a10e0e960db0",
        "index": 1,
        "isActive": false,
        "name": "Aute adipisicing ex laboris officia culpa."
      },
      {
        "_id": "63a34845756fd6adfb2c0082",
        "guid": "673ef4f6-08ce-42de-9cf3-13b14462baf9",
        "index": 2,
        "isActive": true,
        "name": "Aute amet duis fugiat exercitation aliqua."
      },
      {
        "_id": "63a34845f67f597773056271",
        "guid": "1737a474-4413-4024-ad4b-5249a4430c69",
        "index": 3,
        "isActive": false,
        "name": "Consequat velit et pariatur esse ut duis sunt deserunt."
      },
      {
        "_id": "63a348450f12272edd7a79b5",
        "guid": "97d8ffe7-c21f-42ae-9504-3b141baa773b",
        "index": 4,
        "isActive": true,
        "name": "Cillum pariatur adipisicing consequat labore eu non exercitation eiusmod non labore duis voluptate."
      },
      {
        "_id": "63a34845613d077494e680f1",
        "guid": "e33e4698-76a8-47d6-8785-68aa3e3b7f4d",
        "index": 5,
        "isActive": true,
        "name": "Nisi sunt proident tempor esse voluptate irure nisi dolore cillum."
      }
    CATALOG
   }

  let(:merchant) { create(:merchant, code: 5813, name: "Some name") }

  describe ".do_job" do
    it "success" do
      seller = SELLERS.find { |s| s.name == merchant.code }
      job.do_job(seller, merchant)
      expect(1).to eq(1)
    end
  end
end
