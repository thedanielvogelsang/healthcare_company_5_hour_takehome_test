# RxREVU Technical Assessment

### Setup

To setup, you will need to clone the repo down to your machine and create a branch with using your name.
* i.e. `git checkout -b firstname-lastname`

Run the following:

* `rake db:create`
* `rake db:migrate`
* `rake db:seed`

The `seeds.rb` file contains relevant data for the following models: `Drug`, `Medication`, and `Disease`.
* A `drug` `has_many` `medications`
    * For example, the drug `Lipitor` would have several medications of different forms and strengths.
        * Lipitor
            * Lipitor 10 mg tablet
            * Lipitor 20 mg tablet
            * Lipitor 10 mg time release capsule
            * Lipitor 20 mg time release capsule
* A `disease` consists of only a name and an identifier.
* Reference the `schema` or `rails console` for additional information about specific columns and types on these models.
* You will likely need to create additional models/tables to accomplish the tasks outlined below. 

### Overview
We are looking for code quality, not necessarily just rushing through and checking off each task below. It is perfectly acceptable not to finish all the outlined tasks. If you are unable to finish in the time allotted we will ask you to explain your plan for implementing the rest of the tasks.
* i.e. What classes, models, tables, endpoints would you have created? How would they work together?

A successful candidate will be able to demonstrate a strong grasp of data modeling and seperation of concerns/responsibilities.

### Assignment

You have been provided with a `.csv` file called `prescription_history.csv` that contains information about historical prescriptions that were written by a variety of doctors at a variety of different hospitals.
* This file can be found in the highest level project directory at `/prescription_history.csv` 

Each row contains the following columns:
* `prescriber_id`
* `prescriber_name`
* `hospital_id`
* `hospital_name`
* `medication_id`
* `prescription_id`
* `frequency_per_day`
* `days_supply`
* `disease`

The columns `medication_id` and `disease` correspond to existing tables in the database. 

You will need to:

1. Ingest the `csv` into the database in whatever manner seems most fitting.
2.  Create a set of analytics around the data ingested to determine the following:
    * The most commonly prescribed drug at each hospital.
    * The average number of prescriptions written by each prescriber.
    * Most common medication ordered to treat each disease.
    * Which prescriber appears to prescribe the greatest quantity (`frequency_per_day * days_supply`) of addictive painkillers.
        * Denoted by the `opioid` `boolean` on `Drug`.
3. The logic related to these analytics should be tested using `rspec`.
4. Create a set of API endpoints that can be called to retrieve this information in a structured `JSON` format.

### Submission
* To submit your work create a pull request with your branch against the original branch.
* For more information on creating a pull request, reference GitHub: https://help.github.com/articles/creating-a-pull-request/











