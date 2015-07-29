require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:order_meats).dependent(:destroy) }
  it { is_expected.to have_many(:meats).through(:order_meats) }
  it { is_expected.to have_many(:order_side_dishes) }
  it { is_expected.to have_many(:side_dishes).through(:order_side_dishes) }
  it { is_expected.to have_one(:address).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:meats) }
  it { is_expected.to accept_nested_attributes_for(:side_dishes) }
  it { is_expected.to accept_nested_attributes_for(:address) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:meats) }
  it { is_expected.to validate_presence_of(:side_dishes) }
end
