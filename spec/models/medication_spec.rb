require 'rails_helper'

RSpec.describe Medication, type: :model do
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

    @drug_1 = Drug.create(id: 3940, name: "Lebronta", opioid: true)
    drug_2 = Drug.create(id: 3360, name: "Durantitor")
    drug_3 = Drug.create(id: 8715, name: "Curryatine")
    drug_4 = Drug.create(id: 1312, name: "Giannicillin")
    @drug_5 = Drug.create(id: 5764, name: "Hardenafil", opioid: true)

    Medication.create([
                        { id: 91770057, drug_id: @drug_1.id, strength: 10, strength_unit: "mg", form: "tablet" },
                        { id: 91770058, drug_id: @drug_1.id, strength: 20, strength_unit: "mg", form: "tablet" },
                        { id: 91770059, drug_id: @drug_1.id, strength: 30, strength_unit: "mg", form: "tablet" },
                        { id: 83147280, drug_id: drug_2.id, strength: 5, strength_unit: "mg/ml", form: "vial" },
                        { id: 83147281, drug_id: drug_2.id, strength: 10, strength_unit: "mg/ml", form: "vial" },
                        { id: 83147282, drug_id: drug_2.id, strength: 15, strength_unit: "mg/ml", form: "vial" },
                        { id: 83147283, drug_id: drug_2.id, strength: 25, strength_unit: "mg/ml", form: "vial" },
                        { id: 39698149, drug_id: drug_3.id, strength: 250, strength_unit: "mg", form: "capsule" },
                        { id: 39698150, drug_id: drug_3.id, strength: 500, strength_unit: "mg", form: "capsule" },
                        { id: 16765295, drug_id: drug_4.id, strength: 100, strength_unit: "mg", form: "tablet" },
                        { id: 16765296, drug_id: drug_4.id, strength: 200, strength_unit: "mg", form: "tablet" },
                        { id: 39947554, drug_id: @drug_5.id, strength: 35, strength_unit: "mg/ml", form: "syringe" },
                        { id: 39947555, drug_id: @drug_5.id, strength: 70, strength_unit: "mg/ml", form: "syringe" },
                        { id: 39947556, drug_id: @drug_5.id, strength: 25, strength_unit: "mg/ml", form: "syringe" },
                        { id: 39947557, drug_id: @drug_5.id, strength: 50, strength_unit: "mg/ml", form: "syringe" }
                      ])
    @med1 = Medication.first
    @med2 = Medication.second
    @med15 = Medication.last

    @hospital1 = Hospital.create(id: 48404, name: "Hospital1")
    @hospital2 = Hospital.create(id: 48405, name: "Hospital2")

    @prescriber1 = Prescriber.create(id: 1, name: "Dr. Lhakani")
    @prescriber2 = Prescriber.create(id: 2, name: "Dr. Anders")

    @prescription1 = Prescription.create(id: 84, disease_id: @gout.id, frequency_per_day: 2, days_supply: 7)
    @prescription2 = Prescription.create(id: 12, disease_id: @gout.id, frequency_per_day: 1, days_supply: 10)
    @prescription3 = Prescription.create(id: 1, disease_id: @gout.id, frequency_per_day: 1, days_supply: 10)

    @pres_his1 = PrescriptionHistory.create(
                  prescriber_id: @prescriber1.id,
                  hospital_id: @hospital1.id,
                  medication_id: @med1.id,
                  prescription_id: @prescription1.id)
    @pres_his2 = PrescriptionHistory.create(
                  prescriber_id: @prescriber1.id,
                  hospital_id: @hospital1.id,
                  medication_id: @med1.id,
                  prescription_id: @prescription2.id)
    @pres_his3 = PrescriptionHistory.create(
                  prescriber_id: @prescriber2.id,
                  hospital_id: @hospital1.id,
                  medication_id: @med15.id,
                  prescription_id: @prescription3.id)
  end
  context 'relationships' do
    # it {should belong_to(:hospital)}
    it {should have_many(:prescription_histories)}
  end
  context 'second endpoint (most commonly ordered med) tests' do
    it 'can calculate correct medication given id' do
      medication = Medication.joins(:prescription_histories).joins(:prescriptions)
                .where(:prescriptions => {disease_id: @gout.id})
                .group("medications.id").order("COUNT(medications.id) DESC").first

      expect(medication).to eq(@med1)
    end
  end
end
