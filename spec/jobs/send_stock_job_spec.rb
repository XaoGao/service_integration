RSpec.describe SendStockJob do
  subject(:job) { described_class.new(http_service: http_service) }

  let(:http_service) { double("http_service", is_work_day: { is_work_day: true }) }

  let(:merchant) { create(:merchant, code: 5813, name: "Some name") }

  describe ".do_job" do
    it "success" do
      # seller = SELLERS.find { |s| s.name == merchant.code }
      # job.do_job(seller, merchant)
      # expect(1).to eq(1)
    end
  end
end
