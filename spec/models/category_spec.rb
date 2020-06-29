require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }
  it { is_expected.to validate_presence_of(:amount) }
  #it { is_expected.to have_many(:orders) }
  it { is_expected.to validate_length_of(:amount).is_at_least(10) }
end
