class CreatePersonJobs < ActiveRecord::Migration
  def change
    create_table :person_jobs do |t|
      t.integer :person_id
      t.integer :job_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
