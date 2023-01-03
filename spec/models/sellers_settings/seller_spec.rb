RSpec.describe SellersSettings::Seller do
  subject(:seller) { SELLERS.first }

  describe ".header_for_work_day" do
    context "when interval is found" do
      it { expect(seller.header_for_work_day.login).to eq("seller_platform_api1") }
      it { expect(seller.header_for_work_day.password).to eq("0000000") }
      it { expect(seller.header_for_work_day).to be_a(SellersSettings::Account) }
    end
  end

  describe ".account_by_interval" do
    context "when work day is true" do
      it { expect(seller.account_by_interval(true).login).to eq("seller_platform_api1") }
      it { expect(seller.account_by_interval(true).password).to eq("0000000") }
      it { expect(seller.account_by_interval(true)).to be_a(SellersSettings::Account) }
    end

    context "when work day is false" do
      it { expect(seller.account_by_interval(false).login).to eq("seller_platform_api2") }
      it { expect(seller.account_by_interval(false).password).to eq("0000000") }
      it { expect(seller.account_by_interval(false)).to be_a(SellersSettings::Account) }
    end
  end

  describe ".account" do
    it { expect(seller.account.login).to eq("merchant") }
    it { expect(seller.account.password).to eq("0000000") }
    it { expect(seller.account).to be_a(SellersSettings::Account) }
  end
end
