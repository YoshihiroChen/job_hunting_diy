module Admin
  class JobRolesController < ApplicationController
    # 简单防护（生产环境建议更严格）
    http_basic_authenticate_with name: "admin", password: "yourpassword" if Rails.env.production?

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
    

    def edit
      @job_role = JobRole.find(params[:id])
    end

    def update
      @job_role = JobRole.find(params[:id])
      if @job_role.update(job_role_params)
        redirect_to admin_job_roles_path, notice: "更新成功"
      else
        render :edit
      end
    end

    private

    def job_role_params
      params.require(:job_role).permit(
        :note,
        :literature_ok,
        :extraversion_text,
        :rational_text,
        :decisive_text,
        :creative_text,
        :plan_text,
        :leader_text,
        :realistic_text,
        :disciplined_text,
        traits: []
      )
    end
    
    
    
    
  end
end

