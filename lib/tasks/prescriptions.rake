require 'csv'

namespace :prescriptions do

  desc "Create the sample prescriptions CSV file"

  task :generate_data => :environment do |task|
    filename = "prescription_history.csv"
    sh %{ rm #{filename} }
    sh %{ touch #{filename} }
    prescribers = prescribers_with_hospital
    CSV.open(filename, "wb") do |csv|
      csv << header_row
      6342.times{
        csv << generate_random_row(prescribers)
      }
    end
  end

  def generate_random_row(prescribers)
    prescriber = prescribers.sample
    [
      prescriber[:prescriber][:id],
      prescriber[:prescriber][:name],
      prescriber[:hospital][:id],
      prescriber[:hospital][:name],
      get_medication_id,
      get_prescription_id,
      frequencies.sample,
      days_supply.sample,
      get_disease
    ]
  end

  def header_row
    [
      "prescriber_id",
      "prescriber_name",
      "hospital_id",
      "hospital_name",
      "medication_id",
      "prescription_id",
      "frequency_per_day",
      "days_supply",
      "disease"
    ]
  end

  def get_prescription_id
    rand.to_s[2..11]
  end

  def get_medication_id
    Medication.pluck(:id).sample
  end

  def get_disease
    if rand(1..10) % 3 == 0
      Disease.pluck(:name).sample
    else
      Disease.pluck(:id).sample
    end
  end

  def generate_prescribers
    (0..20).to_a.map{ |num| { id: num, name: Faker::Name.unique.name } }
  end

  def hospital_info
    [
      { id: 12, name: "Mercy Hospital"},
      { id: 42, name: "General Hospital"},
      {id: 04, name: "Memorial Hospital"},
      { id: 63, name: "St John's Hospital"}
    ]
  end

  def prescribers_with_hospital
    prescribers = generate_prescribers
    prescribers.map do |prescriber|
      { prescriber: prescriber, hospital: rand_hospital }
    end
  end

  def rand_hospital
    hospital_info[rand(0..3)]
  end

  def frequencies
    [ 1, 2, 3, 4 ]
  end

  def days_supply
    [ 1, 7, 14, 30, 90 ]
  end
end


