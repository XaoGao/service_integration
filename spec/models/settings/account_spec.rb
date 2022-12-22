RSpec.describe Settings::Account do
  subject(:account) { described_class.new(login: "some login", password: "some password") }

  describe ".==" do
    context "when eql" do
      let(:other_account) { described_class.new(login: "some login", password: "some password") }

      it { expect(account == other_account).to be true }
    end

    context "when not eql" do
      it "different login" do
        other_account = described_class.new(login: "different login", password: "some password")
        expect(account == other_account).to be false
      end

      it "different password" do
        other_account = described_class.new(login: "some login", password: "different password")
        expect(account == other_account).to be false
      end

      it "different login and password" do
        other_account = described_class.new(login: "different login", password: "different password")
        expect(account == other_account).to be false
      end
    end
  end
end
