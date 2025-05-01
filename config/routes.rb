Rails.application.routes.draw do
 
  
  
  

  get 'contact/index', to: 'contact#index'
  get 'hello/index'
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

  # 业界分析路由
  get 'job_field/', to: 'job_field#index'
  get 'job_field/conclusion', to: 'job_field#conclusion'

  get 'job_field/arts_science', to: 'job_field#arts_science'
  get 'job_field/web_sier', to: 'job_field#web_sier'
  get 'job_field/salary_compare', to: 'job_field#salary_compare'
  get 'job_field/certificate', to: 'job_field#certificate'
  
  get 'it_field/index', to: 'it_field#index'
  get 'it_field/arts_science', to: 'it_field#arts_science'
  get 'it_field/web_sier', to: 'it_field#web_sier'
  get 'it_field/salary_compare', to: 'it_field#salary_compare'
  get 'it_field/certificate', to: 'it_field#certificate'
  get 'it_field/con_sier', to: 'it_field#con_sier'
  get 'it_field/web_it', to: 'it_field#web_it'

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
  get 'bank_field/other_bank', to: 'bank_field#other_bank'

  get 'house_field/index', to: 'house_field#index'
  get 'house_field/developer', to: 'house_field#developer'
  get 'house_field/agent', to: 'house_field#agent'
  get 'house_field/management', to: 'house_field#management'
  get 'house_field/advisor', to: 'house_field#advisor'
  get 'house_field/rent', to: 'house_field#rent'

  get 'advertisement_field/index', to: 'advertisement_field#index'
  get 'advertisement_field/agency', to: 'advertisement_field#agency'


  get 'game_field/index', to: 'game_field#index'
  get 'game_field/hardware', to: 'game_field#hardware'
  get 'game_field/console', to: 'game_field#console'
  get 'game_field/webs', to: 'game_field#webs'

  get 'maker_field/index', to: 'maker_field#index'
  get 'maker_field/auto', to: 'maker_field#auto'
  get 'maker_field/food', to: 'maker_field#food'
  get 'maker_field/daily', to: 'maker_field#daily'

  get 'retail_field/index', to: 'retail_field#index'
  get 'retail_field/super', to: 'retail_field#super'
  get 'retail_field/transport', to: 'retail_field#transport'
  get 'retail_field/wholesale', to: 'retail_field#wholesale'

  get 'shi_field/index', to: 'shi_field#index'
  get 'shi_field/lawyer', to: 'shi_field#lawyer'
  get 'shi_field/shihoshoshi', to: 'shi_field#shihoshoshi'
  get 'shi_field/gyoseishoshi', to: 'shi_field#gyoseishoshi'
  get 'shi_field/benrishi', to: 'shi_field#benrishi'
  get 'shi_field/sharoshi', to: 'shi_field#sharoshi'
  get 'shi_field/kanteishi', to: 'shi_field#kanteishi'
  get 'shi_field/chosashi', to: 'shi_field#chosashi'
  get 'shi_field/dairishi', to: 'shi_field#dairishi'
  get 'shi_field/yohoshi', to: 'shi_field#yohoshi'



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
  get 'questions/telework', to: 'questions#telework'
  get 'questions/second_graduate', to: 'questions#second_graduate'

  get 'job_company', to: 'job_company#index'

  # 百科系统路由
  get 'wiki/index', to: 'wiki#index'
  get 'wiki/alm', to: 'wiki#alm'
  get 'wiki/ict', to: 'wiki#ict'
  get 'wiki/rpa', to: 'wiki#rpa'
  get 'wiki/dx', to: 'wiki#dx'
  get 'wiki/dd', to: 'wiki#dd'
  get 'wiki/pmi', to: 'wiki#pmi'
  get 'wiki/ma', to: 'wiki#ma'
  get 'wiki/esg', to: 'wiki#esg'
  get 'wiki/erp', to: 'wiki#erp'
  get 'wiki/crm', to: 'wiki#crm'
  get 'wiki/bi', to: 'wiki#bi'
  get 'wiki/ipo', to: 'wiki#ipo'
  get 'wiki/cfa', to: 'wiki#cfa'
  get 'wiki/cpa', to: 'wiki#cpa'
  get 'wiki/bcp', to: 'wiki#bcp'
  get 'wiki/jsox', to: 'wiki#jsox'
  get 'wiki/var', to: 'wiki#var'
  get 'wiki/telematics', to: 'wiki#telematics'
  get 'wiki/rm', to: 'wiki#rm'
  get 'wiki/basel', to: 'wiki#basel'
  get 'wiki/aml', to: 'wiki#aml'
  get 'wiki/sloan', to: 'wiki#sloan'
  get 'wiki/lc', to: 'wiki#lc'
  get 'wiki/ifrs', to: 'wiki#ifrs'
  get 'wiki/dwh', to: 'wiki#dwh'
  get 'wiki/api', to: 'wiki#api'
  get 'wiki/etl', to: 'wiki#etl'
  get 'wiki/jgbs', to: 'wiki#jgbs'
  get 'wiki/ecm', to: 'wiki#ecm'
  get 'wiki/dcm', to: 'wiki#dcm'
  get 'wiki/reit', to: 'wiki#reit'
  get 'wiki/spc', to: 'wiki#spc'
  get 'wiki/abs', to: 'wiki#abs'
  get 'wiki/rmbs', to: 'wiki#rmbs'
  get 'wiki/aum', to: 'wiki#aum'
  get 'wiki/ideco', to: 'wiki#ideco'
  get 'wiki/cicd', to: 'wiki#cicd'
  get 'wiki/uiux', to: 'wiki#uiux'
  get 'wiki/kpi', to: 'wiki#kpi'
  get 'wiki/saas', to: 'wiki#saas'
  get 'wiki/fas', to: 'wiki#fas'
  get 'wiki/cfo', to: 'wiki#cfo'
  get 'wiki/ae', to: 'wiki#ae'
  get 'wiki/cm', to: 'wiki#cm'
  get 'wiki/martech', to: 'wiki#martech'
  get 'wiki/proptech', to: 'wiki#proptech'
  get 'wiki/cadcae', to: 'wiki#cadcae'
  get 'wiki/tps', to: 'wiki#tps'
  get 'wiki/iot', to: 'wiki#iot'
  get 'wiki/pop', to: 'wiki#pop'
  get 'wiki/dm', to: 'wiki#dm'
  get 'wiki/oem', to: 'wiki#oem'
  get 'wiki/edi', to: 'wiki#edi'
  get 'wiki/milai', to: 'wiki#milai'
  get 'wiki/thirdpl', to: 'wiki#thirdpl'
  get 'wiki/scm', to: 'wiki#scm'
  get 'wiki/delica', to: 'wiki#delica'



  
  resources :personality_tests, only: [:new, :create, :show]

  resources :comments, only: [:index, :create, :destroy]

end
