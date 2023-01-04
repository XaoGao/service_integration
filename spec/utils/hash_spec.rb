RSpec.describe Hash do
  describe ".deep_transform_to_snake_case" do
    it "convert nested keys to snake case and sym" do
      expect({
        "Header" => { "ErrorCode" => 10,
                      "ErrorMessage" => { "Message" => "some",
                                          "Description" => "descriotion error" } }, "Body" => { "WareItems" => [] }
      }.deep_transform_to_snake_case).to eq({
                                              header: { error_code: 10,
                                                        error_message: { message: "some",
                                                                         description: "descriotion error" } }, body: { ware_items: [] }
                                            })
    end
  end

  describe ".deep_transform_keys" do
    it "convert nested keys to sym" do
      expect({
        "Header" => { "ErrorCode" => 10,
                      "ErrorMessage" => { "Message" => "some",
                                          "Description" => "descriotion error" } }, "Body" => { "WareItems" => [] }
      }.deep_transform_keys do |key|
               key.to_sym
             end).to eq({ Header: { ErrorCode: 10, ErrorMessage: { Message: "some", Description: "descriotion error" } },
                          Body: { WareItems: [] } })
    end
  end
end
