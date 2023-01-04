RSpec.describe String do
  describe ".underscore" do
    it "convert CameCase to snake_case" do
      expect("SomeMessage".underscore).to eq("some_message")
    end
  end
end
