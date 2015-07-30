require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to belong_to(:order).with_foreign_key(:order_id) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:number) }
end
