require 'rails_helper'

RSpec.describe Hospital, type: :model do
  context 'relationships' do
    # it {should belong_to(:hospital)}
    # it {should have_many(:prescription_histories)}
  end
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:name)}
  end
end
