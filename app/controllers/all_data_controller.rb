class AllDataController < ApplicationController
  def index
    @job_roles = JobRole.all

    if params[:industry].present?
      @job_roles = @job_roles.where(industry: params[:industry])
    end

    if params[:literature_ok].present?
      @job_roles = @job_roles.where(literature_ok: params[:literature_ok])
    end

    if params[:trait].present?
      @job_roles = @job_roles.where("traits LIKE ?", "%#{params[:trait]}%")
    end
  end
end

