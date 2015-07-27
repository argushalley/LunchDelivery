require 'rails_helper'

RSpec.describe SideDish, type: :model do
  it { is_expected.to define_enum_for(:type).with([:pasta, :puree, :rice, :salad]) }
end
