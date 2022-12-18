RSpec.describe SendStockJob do
  subject(:job) { described_class.new }

  let(:merchant) { create(:merchant, code: 5813, name: "Some name") }

  describe "test" do
    it ".do_job" do
      s = create(:shipment)
      si = create(:shipment_item, shipment: s)
      box = create(:box)
      sib = create(:shipment_item_to_box, shipment_item: si, box: box)
      debugger
      job.do_job(merchant.id, merchant.code)
      expect(1).to eq(1)
    end
  end
end
