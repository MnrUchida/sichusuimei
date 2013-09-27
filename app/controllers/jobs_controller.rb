# coding : utf-8

class JobsController < ApplicationController
  before_filter :get_record, :only => [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(params[:job])
    unless @job.save
      render action: :new
      return
    end
    redirect_to @job, notice: 'Meishiki was successfully created.'
  end

  def update
    unless @job.update_attributes(params[:job])
      render action: :edit
      return
    end

    redirect_to @job, notice: 'Meishiki was successfully updated.'
  end

  def destroy
    @job.destroy

    redirect_to jobs_url
  end

  private
  def get_record
    @job = Job.find(params[:id])
  end

end
