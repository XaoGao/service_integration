RSpec.describe SendStockJob do
  describe "test" do
    it do
      merchant = Merchant.create(active: true, code: 5813, name: "Some name")
      SendStockJob.new.perform(merchant.id, merchant.code, "send stock")
      expect(1).to eq 1
    end
  end
end
