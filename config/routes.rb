Rails.application.routes.draw do
  # 首页路由
  root 'home#index'
  
  # 就职流程路由
  get 'job_process', to: 'job_process#index'
  get 'job_process/es', to: 'job_process#es'
  get 'job_process/network_test', to: 'job_process#network_test'
  get 'job_process/gd', to: 'job_process#gd'
  get 'job_process/interview', to: 'job_process#interview'
  get 'job_process/offer', to: 'job_process#offer'
  
  # 情报收集路由
  get 'info_collection', to: 'info_collection#index'
  get 'info_collection/foreign_company', to: 'info_collection#foreign_company'
  get 'info_collection/rikunavi', to: 'info_collection#rikunavi'
  get 'info_collection/openwork', to: 'info_collection#openwork'
  get 'info_collection/onecareer', to: 'info_collection#onecareer'
  get 'info_collection/mynavi', to: 'info_collection#mynavi'
  get 'info_collection/social_media', to: 'info_collection#social_media'
  get 'info_collection/npo', to: 'info_collection#npo'
  get 'info_collection/official', to: 'info_collection#official'


  get 'job_field', to: 'job_field#index'
  get 'job_field/arts_science', to: 'job_field#arts_science'
  get 'job_field/web_sier', to: 'job_field#web_sier'

  get 'job_company', to: 'job_company#index'
end
