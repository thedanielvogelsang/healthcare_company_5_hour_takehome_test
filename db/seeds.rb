# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

drug_1 = Drug.create(id: 3940, name: "Lebronta", opioid: true)
drug_2 = Drug.create(id: 3360, name: "Durantitor")
drug_3 = Drug.create(id: 8715, name: "Curryatine")
drug_4 = Drug.create(id: 1312, name: "Giannicillin")
drug_5 = Drug.create(id: 5764, name: "Hardenafil", opioid: true)

Medication.create([
                    { id: 91770057, drug_id: drug_1.id, strength: 10, strength_unit: "mg", form: "tablet" },
                    { id: 91770058, drug_id: drug_1.id, strength: 20, strength_unit: "mg", form: "tablet" },
                    { id: 91770059, drug_id: drug_1.id, strength: 30, strength_unit: "mg", form: "tablet" },
                    { id: 83147280, drug_id: drug_2.id, strength: 5, strength_unit: "mg/ml", form: "vial" },
                    { id: 83147281, drug_id: drug_2.id, strength: 10, strength_unit: "mg/ml", form: "vial" },
                    { id: 83147282, drug_id: drug_2.id, strength: 15, strength_unit: "mg/ml", form: "vial" },
                    { id: 83147283, drug_id: drug_2.id, strength: 25, strength_unit: "mg/ml", form: "vial" },
                    { id: 39698149, drug_id: drug_3.id, strength: 250, strength_unit: "mg", form: "capsule" },
                    { id: 39698150, drug_id: drug_3.id, strength: 500, strength_unit: "mg", form: "capsule" },
                    { id: 16765295, drug_id: drug_4.id, strength: 100, strength_unit: "mg", form: "tablet" },
                    { id: 16765296, drug_id: drug_4.id, strength: 200, strength_unit: "mg", form: "tablet" },
                    { id: 39947554, drug_id: drug_5.id, strength: 35, strength_unit: "mg/ml", form: "syringe" },
                    { id: 39947555, drug_id: drug_5.id, strength: 70, strength_unit: "mg/ml", form: "syringe" },
                    { id: 39947556, drug_id: drug_5.id, strength: 25, strength_unit: "mg/ml", form: "syringe" },
                    { id: 39947557, drug_id: drug_5.id, strength: 50, strength_unit: "mg/ml", form: "syringe" }
                  ])

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

puts "Done seeding data"
