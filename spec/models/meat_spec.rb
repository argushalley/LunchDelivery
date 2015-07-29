require 'rails_helper'

RSpec.describe Meat, type: :model do
  it { is_expected.to belong_to(:order).with_foreign_key(:order_id) }
end
