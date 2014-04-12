# coding : utf-8

class PersonJobController < ApplicationController
  before_filter :set_person, :only => [:index, :show, :edit, :new, :update, :create, :destroy]
  before_filter :set_person_job, :only => [:show, :edit, :update, :destroy]

  def index
    @person_jobs = @person.person_jobs
  end

  def show
  end

  def new
    @person_job = @person.person_jobs.build
  end

  def edit
  end

  def create
    @person_job = @person.person_jobs.build(params[:person_job])

    unless @person_job.save
      render action: :new
      return
    end
    redirect_to person_person_job_path(@person_job.keys), notice: 'Meishiki was successfully created.'
  end

  def update
    unless @person_job.update_attributes(params[:person_job])
      render action: :edit
      return
    end

    redirect_to person_person_job_path(@person_job.keys), notice: 'Meishiki was successfully updated.'

  end

  def destroy
    @person_job.destroy

    redirect_to person_person_job_index_path(@person_job.keys)
  end

  private
  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_person_job
    @person_job = @person.person_jobs.find(params[:id])
  end
end
