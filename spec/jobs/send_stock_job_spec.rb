RSpec.describe SendStockJob do
  subject(:job) { described_class.new }

  let(:merchant) { create(:merchant, code: 5813, name: "Some name") }

  describe "test" do
    it ".do_job" do
      job.do_job(merchant.id, merchant.code)
      expect(1).to eq(1)
    end
  end
end
