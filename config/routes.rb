Rails.application.routes.draw do
 
  get '/admin/login', to: 'admin_sessions#new'
  post '/admin/login', to: 'admin_sessions#create'
  delete '/admin/logout', to: 'admin_sessions#destroy'

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
  get 'job_field/salary_compare', to: 'job_field#salary_compare'
  get 'job_field/certificate', to: 'job_field#certificate'

  get 'it_field/index', to: 'it_field#index'
  get 'it_field/arts_science', to: 'it_field#arts_science'
  get 'it_field/web_sier', to: 'it_field#web_sier'
  get 'it_field/salary_compare', to: 'it_field#salary_compare'
  get 'it_field/certificate', to: 'it_field#certificate'

  get 'consult_field/index', to: 'consult_field#index'
  get 'consult_field/strategy_consult', to: 'consult_field#strategy_consult'
  get 'consult_field/it_consult', to: 'consult_field#it_consult'
  get 'consult_field/personnel_consult', to: 'consult_field#personnel_consult'
  get 'consult_field/finance_consult', to: 'consult_field#finance_consult'
  get 'consult_field/risk_consult', to: 'consult_field#risk_consult'

  get 'insurance_field/index', to: 'insurance_field#index'
  get 'insurance_field/damage_insurance', to: 'insurance_field#damage_insurance'
  get 'insurance_field/life_insurance', to: 'insurance_field#life_insurance'

  get 'syosya_field/index', to: 'syosya_field#index'
  get 'syosya_field/sougou_syosya', to: 'syosya_field#sougou_syosya'
  get 'syosya_field/senmon_syosya', to: 'syosya_field#senmon_syosya'

  get 'accounting_auditing_field/index', to: 'accounting_auditing_field#index'
  get 'accounting_auditing_field/accounting', to: 'accounting_auditing_field#accounting'
  get 'accounting_auditing_field/auditing', to: 'accounting_auditing_field#auditing'


  get 'bank_field/index', to: 'bank_field#index'
  get 'bank_field/commercial_bank', to: 'bank_field#commercial_bank'
  get 'bank_field/investment_bank', to: 'bank_field#investment_bank'
  get 'bank_field/trust_bank', to: 'bank_field#trust_bank'
  get 'bank_field/retail_bank', to: 'bank_field#retail_bank'
  get 'bank_field/internet_bank', to: 'bank_field#internet_bank'
  get 'bank_field/other_bank', to: 'bank_field#other_bank'

  get 'questions/index', to: 'questions#index'
  get 'questions/mathematics', to: 'questions#mathematics'
  get 'questions/salaries', to: 'questions#salaries'
  get 'questions/graduation', to: 'questions#graduation'
  get 'questions/venture_bigname', to: 'questions#venture_bigname'
  get 'questions/gakureki', to: 'questions#gakureki'
  get 'questions/start_time', to: 'questions#start_time'
  get 'questions/japanese', to: 'questions#japanese'
  get 'questions/intern', to: 'questions#intern'
  get 'questions/arts_science_difference', to: 'questions#arts_science_difference'

  get 'job_company', to: 'job_company#index'

  resources :comments, only: [:index, :create, :destroy]

end
