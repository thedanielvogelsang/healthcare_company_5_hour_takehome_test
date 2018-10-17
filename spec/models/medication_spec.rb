require 'rails_helper'

RSpec.describe Medication, type: :model do
  context 'relationships' do
    # it {should belong_to(:hospital)}
    it {should have_many(:prescription_histories)}
  end
end
