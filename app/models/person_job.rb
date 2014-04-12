class PersonJob < ActiveRecord::Base
  attr_accessible :person_id, :job_id, :start_date, :end_date

  belongs_to :person
  belongs_to :job

  def keys
    {person_id: person_id, job_id: job_id, id:id}
  end
end
