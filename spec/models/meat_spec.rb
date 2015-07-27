require 'rails_helper'

RSpec.describe Meat, type: :model do
  it { is_expected.to belong_to(:order).with_foreign_key(:order_id) }
  it { is_expected.to define_enum_for(:type).with([:chicken, :meat, :sausage]) }
end
