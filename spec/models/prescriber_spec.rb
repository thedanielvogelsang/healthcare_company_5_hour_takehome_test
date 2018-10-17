require 'rails_helper'

RSpec.describe Prescriber, type: :model do
  context 'relationships' do
    # it {should belong_to(:hospital)}
    it {should have_many(:prescription_histories)}
  end
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:name)}
  end
  context 'intializing with int id' do
    it 'can be created with any integer as id' do
      prescriber1 = Prescriber.create(id: 48404, name: "Pr")
      prescriber2 = Prescriber.new(id: "ABAB", name: "Prescriber2")
      expect(prescriber1).to be_present
      expect(prescriber2.save).to be false
      expect(prescriber2.errors
                      .messages
                      .values.include?(["id must be an Integer"])).to be true
    end
    it 'prescriber ids must still be unique' do
      prescriber1 = Prescriber.create(id: 48404, name: "Prescriber1")
      prescriber2 = Prescriber.new(id: 48404, name: "Prescriber2")
      expect(prescriber1).to be_present
      expect(prescriber2.save).to be false
      expect(prescriber2.errors
                      .messages
                      .values.include?(["has already been taken"])).to be true
    end
  end
end
