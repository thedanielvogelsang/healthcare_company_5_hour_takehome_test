require 'csv'
desc 'imports prescription history from root/prescription_history.csv'


task :database_cleanup do
  Rake::Task["db:drop"].invoke(`RAILS_ENV=development`)
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
end
PRESCRIPTION_HISTORY = 'prescription_history.csv'
task :import_data, [:filename] => :environment do
    pres_hist_csv = CSV.open PRESCRIPTION_HISTORY, headers: true, header_converters: :symbol
    pres_hist_csv.each do |row|
      pres = Prescriber.find_or_create_by(id: row[:prescriber_id], name: row[:prescriber_name])
      hosp = Hospital.find_or_create_by(id: row[:hospital_id], name: row[:hospital_name])
      med = Medication.find(row[:medication_id])
      disease = row[:disease]
      disease.to_i === 0 ? disease = Disease.find_by(name: row[:disease]) : disease

      prescription = Prescription.find_or_create_by(id: row[:prescription_id],
                                         disease_id: row[:disease],
                                         frequency_per_day: row[:frequency_per_day],
                                         days_supply: row[:days_supply])

      PrescriptionHistory.create(prescriber_id: pres.id,
                                hospital_id: hosp.id,
                                medication_id: med.id,
                                prescription_id: prescription.id
                                )
      puts 'prescription created'

    end
end
