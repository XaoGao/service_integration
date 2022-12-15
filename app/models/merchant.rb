class Merchant < Sequel::Model(DB)
  one_to_many :shipments
end
