RSpec.describe SellersSettings::Tasks::SendStockTask do
  subject(:send_stock_task) { described_class.new(task, "SomeKlass") }

  let(:task) { { name: "SendStock", run: true, schedule: "* * * * *", set_price: false, set_amount: false, set_amount_type: true} }

  describe ".off" do
    context "when job off" do
      it { expect(send_stock_task.off).to be true }
    end

    context "when set_price true" do
      let(:task) { { name: "SendStock", run: true, schedule: "* * * * *", set_price: true, set_amount: false, set_amount_type: true} }

      it do
        expect(send_stock_task.off).to be false
      end
    end

    context "when set_amount true" do
      let(:task) { { name: "SendStock", run: true, schedule: "* * * * *", set_price: false, set_amount: true, set_amount_type: true} }

      it do
        expect(send_stock_task.off).to be false
      end
    end

    context "when set_price true and set_amount true" do
      let(:task) { { name: "SendStock", run: true, schedule: "* * * * *", set_price: true, set_amount: true, set_amount_type: true} }

      it do
        expect(send_stock_task.off).to be false
      end
    end
  end
end
