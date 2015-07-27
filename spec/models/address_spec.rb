require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to belong_to(:order).with_foreign_key(:order_id) }
end
