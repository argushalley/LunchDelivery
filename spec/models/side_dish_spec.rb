require 'rails_helper'

RSpec.describe SideDish, type: :model do
  it { is_expected.to have_many(:order_side_dishes) }
  it { is_expected.to have_many(:orders).through(:order_side_dishes) }
end
