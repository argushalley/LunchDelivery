require 'rails_helper'

RSpec.describe Meat, type: :model do
  it { is_expected.to have_many(:order_meats) }
  it { is_expected.to have_many(:orders).through(:order_meats) }
end
