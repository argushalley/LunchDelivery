require 'rails_helper'

RSpec.describe Meat, type: :model do
  it { is_expected.to have_many(:order_meats) }
  it { is_expected.to have_many(:orders).through(:order_meats) }
  it { is_expected.to validate_presence_of(:name) }

  it 'validates uniqueness of name' do
    create(:meat)
    validate_uniqueness_of(:name)
  end
end
