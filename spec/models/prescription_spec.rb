require 'rails_helper'

RSpec.describe Prescription, type: :model do
  before :each do
    disease_values = [
      {id: 96929, name: "Gout"},
      {id: 94396, name: "Foot Rot"},
      {id: 31059, name: "Walking Zombie Syndrome"},
      {id: 03637, name: "Smelly Appendix"},
      {id: 25173, name: "Shellshock"},
      {id: 21192, name: "Scurvy"},
      {id: 43583, name: "Athelete's Foot"},
      {id: 12212, name: "Cat Bite"},
      {id: 72107, name: "Hamster Bite"}
    ]

    Disease.create(disease_values)
    @gout = Disease.find(96929)
    @scurvy = Disease.find(21192)
  end
  context 'relationships' do
    it {should belong_to(:disease)}
    # it {should have_many(:prescription_histories)}
  end
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:frequency_per_day)}
    it {should validate_presence_of(:days_supply)}
  end
  context 'intializing and saving' do
    it 'can be created with any integer as id' do
      prescription1 = Prescription.create(id: 48404, disease_id: @gout.id, frequency_per_day: 2, days_supply: 7)
      prescription2 = Prescription.new(id: "ABAB", disease_id: @gout.id, frequency_per_day: 2, days_supply: 7)
      expect(prescription1).to be_present
      expect(prescription2.save).to be false
      expect(prescription2.errors
                      .messages
                      .values.include?(["id must be an Integer"])).to be true
    end
    it 'prescription ids must still be unique' do
      prescription1 = Prescription.create(id: 48404, disease_id: @gout.id, frequency_per_day: 2, days_supply: 7)
      prescription2 = Prescription.new(id: 48404, disease_id: @gout.id, frequency_per_day: 2, days_supply: 7)
      expect(prescription1).to be_present
      expect(prescription2.save).to be false
      expect(prescription2.errors
                      .messages
                      .values.include?(["has already been taken"])).to be true
    end
  end
end
