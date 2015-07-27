require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:meats) }
  it { is_expected.to have_many(:side_dishes) }
  it { is_expected.to have_one(:address) }
end
