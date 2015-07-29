require 'rails_helper'

RSpec.describe OrderMeat, type: :model do
  it { is_expected.to belong_to(:meat) }
  it { is_expected.to belong_to(:order) }
end
