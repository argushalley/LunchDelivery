require 'rails_helper'

RSpec.describe OrderSideDish, type: :model do
  it { is_expected.to belong_to(:side_dish) }
  it { is_expected.to belong_to(:order) }
end
