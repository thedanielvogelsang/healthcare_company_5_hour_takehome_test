require 'rails_helper'

RSpec.describe Hospital, type: :model do
  context 'relationships' do
    # it {should belong_to(:hospital)}
    it {should have_many(:prescription_histories)}
  end
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:name)}
  end
  context 'intializing and saving' do
    it 'can be created with any integer as id' do
      hospital1 = Hospital.create(id: 48404, name: "Hospital1")
      hospital2 = Hospital.new(id: "ABAB", name: "Hospital2")
      expect(hospital1).to be_present
      expect(hospital2.save).to be false
    end
    it 'hospital ids must still be unique' do
      hospital1 = Hospital.create(id: 48404, name: "Hospital1")
      hospital2 = Hospital.new(id: 48404, name: "Hospital2")
      expect(hospital1).to be_present
      expect(hospital2.save).to be false
      expect(hospital2.errors
                      .messages
                      .values.include?(["has already been taken"])).to be true
    end
  end
end
