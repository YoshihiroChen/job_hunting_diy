class PersonalityTestsController < ApplicationController


  QUESTION_MAPPINGS = [
    { "A" => :extraversion, "B" => :introversion, "C" => :plan,   "D" => :random },    # 第1题
    { "A" => :rational, "B" => :emotional, "C" => :decisive,   "D" => :cautious },   # 第2题
    { "A" => :restraint, "B" => :impulse, "C" => :fact, "D" => :dream }, # 第3题
    { "A" => :leader, "B" => :subordinate, "C" => :fact,   "D" => :dream },    # 第4题
    { "A" => :decisive, "B" => :cautious, "C" => :impulse,    "D" => :restraint },     # 第5题
    { "A" => :restraint, "B" => :impulse, "C" => :extraversion,    "D" => :introversion },     # 第6题
    { "A" => :fact, "B" => :dream, "C" => :traditional,    "D" => :creative },     # 第7题
    { "A" => :extraversion, "B" => :introversion, "C" => :dream,    "D" => :fact },     # 第8题
    { "A" => :restraint, "B" => :impulse, "C" => :leader,    "D" => :subordinate },     # 第9题
    { "A" => :rational, "B" => :emotional, "C" => :creative,    "D" => :traditional },     # 第10题
    { "A" => :leader, "B" => :subordinate, "C" => :cautious,    "D" => :decisive },     # 第11题
    { "A" => :plan, "B" => :random, "C" => :rational,    "D" => :emotional },     # 第12题
    { "A" => :extraversion, "B" => :introversion, "C" => :fact,    "D" => :dream },     # 第13题
    { "A" => :creative, "B" => :traditional, "C" => :restraint,    "D" => :impulse },     # 第14题
    { "A" => :decisive, "B" => :cautious, "C" => :random,    "D" => :plan },     # 第15题
    { "A" => :rational, "B" => :emotional, "C" => :extraversion,    "D" => :introversion },     # 第16题
    { "A" => :creative, "B" => :fact, "C" => :dream,    "D" => :traditional },     # 第17题
    { "A" => :plan, "B" => :random, "C" => :subordinate,    "D" => :leader },     # 第18题
    { "A" => :leader, "B" => :cautious, "C" => :decisive,    "D" => :subordinate },     # 第19题
    { "A" => :plan, "B" => :rational, "C" => :emotional,    "D" => :random },     # 第20题
    { "A" => :extraversion, "B" => :introversion, "C" => :creative,    "D" => :traditional },     # 第21题
    { "A" => :traditional, "B" => :creative, "C" => :leader,    "D" => :subordinate },     # 第22题
    { "A" => :plan, "B" => :random, "C" => :decisive,    "D" => :cautious },     # 第23题
    { "A" => :leader, "B" => :subordinate, "C" => :decisive,    "D" => :cautious },     # 第24题
    { "A" => :extraversion, "B" => :introversion, "C" => :creative,    "D" => :traditional },     # 第25题
    { "A" => :cautious, "B" => :decisive, "C" => :emotional,    "D" => :rational },     # 第26题
    { "A" => :rational, "B" => :emotional, "C" => :creative,    "D" => :traditional },     # 第27题
    { "A" => :restraint, "B" => :impulse, "C" => :leader,    "D" => :subordinate },     # 第28题
    { "A" => :plan, "B" => :random, "C" => :rational,    "D" => :emotional },     # 第29题
    { "A" => :plan, "B" => :introversion, "C" => :extraversion,    "D" => :random },     # 第30题
    { "A" => :fact, "B" => :dream, "C" => :impulse,    "D" => :restraint },     # 第31题
    { "A" => :impulse, "B" => :restraint, "C" => :fact,    "D" => :dream }     # 第32题

  ]


  ALL_JOBS = [
    # 咨询
    { industry: "咨询", role: "战略咨询", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "沟通强、逻辑、决策快" },
    { industry: "咨询", role: "财务咨询", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "数据敏感、细致、文案多" },
    { industry: "咨询", role: "人事&组织咨询", literature_ok: "★★★★☆", traits: ["外向", "感性", "谨慎", "创新", "计划", "领导", "理想", "自律"], note: "沟通管理、共情力" },
    { industry: "咨询", role: "IT咨询", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "项目推动、技术+业务桥梁" },
    { industry: "咨询", role: "风险咨询", literature_ok: "★★★☆☆", traits: ["外向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "风控/合规/分析" },

    # 保险
    { industry: "保险", role: "资产运用（投资）", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "数据分析、理财管理" },
    { industry: "保险", role: "精算师", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "数学导向、独立分析" },
    { industry: "保险", role: "商品企划", literature_ok: "★★★★★", traits: ["外向", "感性", "谨慎", "创新", "计划", "领导", "理想", "自律"], note: "创意、市场嗅觉" },
    { industry: "保险", role: "营业/代理店支援", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "保守", "计划", "服从", "理想", "自律"], note: "沟通、开拓、外联" },
    { industry: "保险", role: "承保评估", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "合同条款分析、风险判断" },
    { industry: "保险", role: "理赔服务", literature_ok: "★★★★☆", traits: ["外向", "感性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "客户应对、服务导向" },
    { industry: "保险", role: "系统开发/IT企划", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "技术/后台/系统思维" },
    { industry: "保险", role: "数据分析/DX推进", literature_ok: "★★★☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "数据驱动、跨部门沟通" },

    # 商业银行及金融
    { industry: "商业银行", role: "オープン职（综合职）", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "面向综合，业务+沟通" },
    { industry: "商业银行", role: "グローバル职（国际业务）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "语言/海外业务/灵活应变" },
    { industry: "商业银行", role: "カスタマー服务", literature_ok: "★★★★★", traits: ["外向", "感性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "客户导向、细致" },
    { industry: "商业银行", role: "トレードビジネス（外汇等）", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "交易/业务拓展" },
    { industry: "商业银行", role: "フィナンシャル・エンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数理/建模/后台" },
    { industry: "商业银行", role: "戦略財務（会计·税务）", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "财务/会计" },
    { industry: "商业银行", role: "システム·デジタル", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "技术、系统" },
    { industry: "商业银行", role: "ウェルスマネジメント", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "沟通/销售/金融素养" },
    { industry: "商业银行", role: "グローバル・マーケッツ", literature_ok: "★★☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "市场/销售/交涉" },

    # 投资银行
    { industry: "投资银行", role: "国内营业（オープン/アソシエイト）", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "综合业务、沟通销售" },
    { industry: "投资银行", role: "法人营业（オープン）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "企业客户、逻辑表达" },
    { industry: "投资银行", role: "投资银行（IB）", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "财务/逻辑/项目推进" },
    { industry: "投资银行", role: "市场部（グローバル·マーケッツ）", literature_ok: "★★☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "市场/销售/快节奏" },
    { industry: "投资银行", role: "金融工程", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数理建模/IT" },
    { industry: "投资银行", role: "研究分析（リサーチ）", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "资料分析/政策/宏观" },
    { industry: "投资银行", role: "系统（システム）", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "系统开发/技术支持" },
    { industry: "投资银行", role: "风险管理", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "风险计量/建模" },

    # 信托银行
    { industry: "信托银行", role: "オープン採用", literature_ok: "★★★★★", traits: ["外向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "综合型" },
    { industry: "信托银行", role: "グローバル採用", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "语言+国际业务" },
    { industry: "信托银行", role: "アクチュアリー", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "年金精算/专业性强" },
    { industry: "信托银行", role: "ファンドマネージャー", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "投资/管理/理财" },
    { industry: "信托银行", role: "システム·デジタル", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "IT开发/后台" },

    # 零售银行
    { industry: "零售银行", role: "ビジネス系職種", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "业务策划、产品开发" },
    { industry: "零售银行", role: "エンジニア職（開発）", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "编程/技术" },
    { industry: "零售银行", role: "データ／分析系", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数据分析" },
    { industry: "零售银行", role: "カスタマー系", literature_ok: "★★★★☆", traits: ["外向", "感性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "客户服务、营业支援" },
    { industry: "零售银行", role: "管理／内部統制", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "合规、审查" },

    # 综合商社
    { industry: "综合商社", role: "総合職（営業職）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "自律"], note: "业务、谈判、海外驻在" },
    { industry: "综合商社", role: "事業企画職", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "市场分析、战略" },
    { industry: "综合商社", role: "コーポレート職", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "后台职能、稳定" },
    { industry: "综合商社", role: "技術職", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "技术支持、工程管理" },
    { industry: "综合商社", role: "貿易事務職", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "传统文科生主力" },

    # 专门商社
    { industry: "专门商社", role: "営業職", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "自律"], note: "客户开发、谈判" },
    { industry: "专门商社", role: "商品企画職", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "新商品提案、调查" },
    { industry: "专门商社", role: "貿易事務職", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "流程管理、协调" },
    { industry: "专门商社", role: "管理部門職", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "人事、法务、会计等" },

    # 会计
    { industry: "会计", role: "経理担当", literature_ok: "★★★★★", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "财务会计、数据处理" },
    { industry: "会计", role: "会計事務所職員", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "中小事务所、培训型" },
    { industry: "会计", role: "税務系会計職員", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "税务知识、资格考取" },
    { industry: "会计", role: "財務企画 / CFO支援", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "领导", "理想", "自律"], note: "战略/高门槛" },
    { industry: "会计", role: "会计类顾问（会計系コンサル）", literature_ok: "★★☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "项目制、咨询导向" },

    # 审计
    { industry: "审计", role: "审计人员（監査職）", literature_ok: "★★★★★", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "逻辑、细致" },
    { industry: "审计", role: "IT审计人员", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "IT/理工优先" },
    { industry: "审计", role: "审计品质管理人员", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "资深CPA转任" },
    { industry: "审计", role: "会计制度支援人员", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "高年次/资深" },
    { industry: "审计", role: "海外集团审计支援人员", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "理想", "自律"], note: "语言/国际沟通" },
    { industry: "审计", role: "审计辅助人员", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "事务支援、非专业路线" },

    # 不动产开发商
    { industry: "不动产开发商", role: "企画調査部", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "市场分析、逻辑" },
    { industry: "不动产开发商", role: "不動産投資研究所", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数据分析、研究" },
    { industry: "不动产开发商", role: "経営企画部", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "战略思考、决策" },
    { industry: "不动产开发商", role: "鑑定企画室", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "估价、分析" },
    { industry: "不动产开发商", role: "営業部門（开发营业）", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "现实", "冲动"], note: "客户沟通、业务推进" },
    { industry: "不动产开发商", role: "法务协力部/总务", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "合同、法规、细致" },
    { industry: "不动产开发商", role: "建設企画部", literature_ok: "★★☆☆☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "协调管理、项目推动" },
    { industry: "不动产开发商", role: "各事业本部", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "项目综合管理" },
    { industry: "不动产开发商", role: "DX本部", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "IT创新、变革" },
    { industry: "不动产开发商", role: "S&E総合研究所", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "可持续研究、理工主力" },
    { industry: "不动产开发商", role: "ケアデザイン室", literature_ok: "★★☆☆☆", traits: ["外向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "老年福祉、社会学" },
    { industry: "不动产开发商", role: "広報部", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "品牌推广、表达力" },
    { industry: "不动产开发商", role: "IR室", literature_ok: "★★★☆☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "金融知识、沟通" },
    { industry: "不动产开发商", role: "海外事業本部", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "外语、跨文化沟通" },
    { industry: "不动产开发商", role: "PM部門（资产管理）", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "收益优化、协调管理" },
    { industry: "不动产开发商", role: "可持续发展推进本部", literature_ok: "★★★☆☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "理想", "自律"], note: "ESG、政策" },
    { industry: "不动产开发商", role: "経理部", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "财务分析" },

    # 不动产中介
    { industry: "不动产中介", role: "営業職（個人向・法人向）", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "提案、客户沟通" },
    { industry: "不动产中介", role: "営業支援職", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "事务支援、细致" },
    { industry: "不动产中介", role: "IT・企画系職种", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "技术、分析、项目管理" },
    { industry: "不动产中介", role: "店舗マネジメント（店长候补）", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "管理晋升、组织力" },

    # 不动产物业
    { industry: "不动产物业", role: "PM職（物业管理）", literature_ok: "★★★★★", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "协调交涉、收支管理" },
    { industry: "不动产物业", role: "BM職（设备管理）", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "技术、现场工程" },
    { industry: "不动产物业", role: "RM職（住户管理）", literature_ok: "★★★★☆", traits: ["外向", "感性", "谨慎", "创新", "随意", "领导", "理想", "冲动"], note: "社区协调、共情力" },
    { industry: "不动产物业", role: "CM職（施工统筹）", literature_ok: "★★☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "项目管理、现场调度" },
    { industry: "不动产物业", role: "本社職（后台）", literature_ok: "★★★★★", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "人事、法务、企划" },

    # 不动产资产管理
    { industry: "不动产资产管理", role: "AM职（新卒）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "财务素养、沟通能力" },
    { industry: "不动产资产管理", role: "企画・IR", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "逻辑表达、金融知识" },
    { industry: "不动产资产管理", role: "财务/法务", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "簿记/法律基础" },
    { industry: "不动产资产管理", role: "法人営業", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "冲动"], note: "REIT产品推广" },

    # 不动产租赁
    { industry: "不动产租赁", role: "招商・租赁营业（リーシング営業）", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "提案力、沟通协调" },
    { industry: "不动产租赁", role: "商业运营・设施管理", literature_ok: "★★★★☆", traits: ["外向", "感性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "服务意识、数据追踪" },
    { industry: "不动产租赁", role: "合同管理・法务支援", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "契约理解、法律知识" },

    # 广告代理店
    { industry: "广告代理店", role: "Business Produce（AE）", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "沟通、协调、项目管理" },
    { industry: "广告代理店", role: "Strategy", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "逻辑、企划、分析" },
    { industry: "广告代理店", role: "Creative", literature_ok: "★★★☆☆", traits: ["内向", "感性", "果断", "创新", "随意", "服从", "理想", "冲动"], note: "文案适合文科，设计需技能" },
    { industry: "广告代理店", role: "Media & Content", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "内容合作、媒体策划" },
    { industry: "广告代理店", role: "Global Business", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "国际沟通、多语种" },
    { industry: "广告代理店", role: "Business / Digital Trans", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数据分析、MarTech工具" },

    # 制造业
    { industry: "制造业", role: "国内営業", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "营业、谈判、外联" },
    { industry: "制造业", role: "海外営業", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "语言、国际业务" },
    { industry: "制造业", role: "生産管理・物流", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "供应链、流程优化" },
    { industry: "制造业", role: "調達", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "采购、协调" },
    { industry: "制造业", role: "経理", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "会计、财务" },
    { industry: "制造业", role: "渉外広報", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "传播、新闻、公关" },
    { industry: "制造业", role: "総務・人事", literature_ok: "★★★★☆", traits: ["内向", "感性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "人事、社工、法务" },
    { industry: "制造业", role: "Gazoo Racing", literature_ok: "★★☆☆☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "体育管理、品牌" },
    { industry: "制造业", role: "マーケティング", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "市场、品牌" },
    { industry: "制造业", role: "宣伝", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "广告、新闻、设计" },
    { industry: "制造业", role: "デザインルーム", literature_ok: "★★★☆☆", traits: ["内向", "感性", "果断", "创新", "随意", "服从", "理想", "冲动"], note: "视觉、平面设计" },
    { industry: "制造业", role: "セールス", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "自律"], note: "销售、商务" },
    { industry: "制造业", role: "情報企画", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数据、情报" },
    { industry: "制造业", role: "財務経理", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "财务、会计" },
    { industry: "制造业", role: "原料調達", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "采购、供应链" },
    { industry: "制造业", role: "人材開発", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "人力资源、教育" },

    # 士业
    { industry: "士业", role: "行政書士", literature_ok: "★★★★★", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "法律文书、规章处理" },
    { industry: "士业", role: "司法書士", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "法律/作图、文书" },
    { industry: "士业", role: "社会保険労務士", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "法规/制度/合规" },
    { industry: "士业", role: "弁護士", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "法律辩护、沟通" },
    { industry: "士业", role: "不動産鑑定士", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "会计/经济/评估" },
    { industry: "士业", role: "海事代理士", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "冲动"], note: "法规/文书/交涉" },
    { industry: "士业", role: "土地家屋調査士", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "测量/作图" },
    { industry: "士业", role: "気象予報士", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "数理/气象/技术型" },
    { industry: "士业", role: "弁理士", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "理工技术+法律" },

    # IT咨询·SIer
    { industry: "IT咨询/SIer", role: "IT咨询顾问（ITコンサルタント）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "业务理解、沟通协调、项目管理" },
    { industry: "IT咨询/SIer", role: "系统企划/业务分析", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "业务流程分析、需求整理" },
    { industry: "IT咨询/SIer", role: "项目经理/项目管理支援（PM/PMO）", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "协调能力、组织力" },
    { industry: "IT咨询/SIer", role: "客户成功/售前咨询", literature_ok: "★★★☆☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "沟通与客户支持" },
    { industry: "IT咨询/SIer", role: "系统工程师（SE）", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "技术职能" },
    { industry: "IT咨询/SIer", role: "开发工程师（程序员）", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "编程、开发" },
    { industry: "IT咨询/SIer", role: "IT销售/解决方案销售", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "冲动"], note: "客户关系和沟通" },
    { industry: "IT咨询/SIer", role: "运营/客户支持", literature_ok: "★★★☆☆", traits: ["内向", "感性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "用户沟通、协调" },

    # Web系IT
    { industry: "Web系IT", role: "Web开发工程师", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "服从", "现实", "自律"], note: "开发经验/技术" },
    { industry: "Web系IT", role: "后端/基础设施工程师", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "服从", "现实", "自律"], note: "编程/高阶技术" },
    { industry: "Web系IT", role: "前端工程师", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "随意", "服从", "现实", "自律"], note: "JS/HTML/CSS" },
    { industry: "Web系IT", role: "UI/UX设计师", literature_ok: "★★★☆☆", traits: ["内向", "感性", "果断", "创新", "随意", "服从", "理想", "冲动"], note: "美术、体验、逻辑" },
    { industry: "Web系IT", role: "产品经理", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "业务、技术、企划" },
    { industry: "Web系IT", role: "Web营销/广告运营", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "分析、企划、创新" },
    { industry: "Web系IT", role: "数据分析师/数据科学家", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "统计、业务分析" },
    { industry: "Web系IT", role: "企划/新事业开发", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "理想", "自律"], note: "创新思考、市场理解" },
    { industry: "Web系IT", role: "IT销售/客户经理", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "冲动"], note: "沟通、客户支持" },
    { industry: "Web系IT", role: "运营/用户支持", literature_ok: "★★★☆☆", traits: ["内向", "感性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "协调与服务意识" },

    # 主机游戏开发商
    { industry: "主机游戏开发商", role: "企画（Planner）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "创意和沟通，文科生较多" },
    { industry: "主机游戏开发商", role: "デザイナー（Designer）", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "需美术技能，门槛高" },
    { industry: "主机游戏开发商", role: "プログラマー（Programmer）", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "编程能力，理工为主" },
    { industry: "主机游戏开发商", role: "サウンド（Sound）", literature_ok: "★★☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "需音乐专业，较少招文科" },
    { industry: "主机游戏开发商", role: "総合職（General）", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "后台岗位，文科主力" },
    
    # 主机研发&游戏开发商
    { industry: "主机研发&游戏开发商", role: "ゲーム開発", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "编程/开发岗，理工科主力" },
    { industry: "主机研发&游戏开发商", role: "システム開発", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "系统开发，理工为主" },
    { industry: "主机研发&游戏开发商", role: "ネットワークサービス開発", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "网络服务，需技术背景" },
    { industry: "主机研发&游戏开发商", role: "コーポレートIT", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "内部IT，理工为主" },
    { industry: "主机研发&游戏开发商", role: "技術系総合", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "技术综合，理工为主" },
    { industry: "主机研发&游戏开发商", role: "知的財産（理工系）", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "知识产权，少量法学文科" },
    { industry: "主机研发&游戏开发商", role: "生産技術", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "生产工程，工学为主" },
    { industry: "主机研发&游戏开发商", role: "電気電子技術", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "电气电子，理工为主" },
    { industry: "主机研发&游戏开发商", role: "機構技術", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "机械结构，理工为主" },
    { industry: "主机研发&游戏开发商", role: "ステージデザイン", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "关卡设计，美术/创意岗" },
    { industry: "主机研发&游戏开发商", role: "キャラクターデザイン", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "角色设计，需美术作品集" },
    { industry: "主机研发&游戏开发商", role: "UI/UXデザイン", literature_ok: "★★☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "UI/UX，有理科与文科复合型" },
    { industry: "主机研发&游戏开发商", role: "エフェクトデザイン", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "特效设计，美术/动画岗" },
    { industry: "主机研发&游戏开发商", role: "カットシーンデザイン", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "过场动画，需美术/影视" },
    { industry: "主机研发&游戏开发商", role: "CGスペシャリスト", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "计划", "服从", "理想", "自律"], note: "CG特效，理工/美术" },
    { industry: "主机研发&游戏开发商", role: "プロダクトデザイン（硬件）", literature_ok: "★☆☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "硬件设计，工业/理工" },
    { industry: "主机研发&游戏开发商", role: "グラフィックデザイン", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "平面设计，美术主力" },
    { industry: "主机研发&游戏开发商", role: "イラストレーション", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "插画创作，美术主力" },
    { industry: "主机研发&游戏开发商", role: "3DCGモデリング", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "自律"], note: "3D建模，美术/动画岗" },
    { industry: "主机研发&游戏开发商", role: "サウンド系（音乐/音效）", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "音乐/音效，音乐专业" },
    { industry: "主机研发&游戏开发商", role: "制作企画系（企划/PM/管理）", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "策划/管理，文理皆可" },
    { industry: "主机研发&游戏开发商", role: "経理", literature_ok: "★★★★★", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "会计/财务，文科主力" },
    { industry: "主机研发&游戏开发商", role: "法務", literature_ok: "★★★★★", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "法务/合规，文科主力" },
    { industry: "主机研发&游戏开发商", role: "知的財産（管理系）", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "知识产权管理，法律专业优先" },
    { industry: "主机研发&游戏开发商", role: "人事", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "人力资源，文科为主" },
    { industry: "主机研发&游戏开发商", role: "パブリッシャー支援", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "出版支持，专业不限" },
    { industry: "主机研发&游戏开发商", role: "購買・生産管理", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "采购/管理，文理皆可" },
    { industry: "主机研发&游戏开发商", role: "通訳コーディネート", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "服从", "理想", "自律"], note: "翻译协调，语言/文科主力" },
    { industry: "主机研发&游戏开发商", role: "販売戦略・プロモーション", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "市场/推广，文科主力" },
    { industry: "主机研发&游戏开发商", role: "販売管理（海外・国内）", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "销售管理，文科为主" },
    
    # Web系游戏公司
    { industry: "Web系游戏公司", role: "プロデューサー", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "管理协调，专业不限" },
    { industry: "Web系游戏公司", role: "ディレクター", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "内容统筹，沟通表达" },
    { industry: "Web系游戏公司", role: "ゲームプランナー", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "玩法企划，创意表达" },
    { industry: "Web系游戏公司", role: "シナリオライター", literature_ok: "★★★★★", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "脚本文案，文科优势" },
    { industry: "Web系游戏公司", role: "プロジェクトマネージャー", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "项目推进，管理能力" },
    { industry: "Web系游戏公司", role: "アートディレクター", literature_ok: "★☆☆☆☆", traits: ["外向", "感性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "美术统筹，需专业" },
    { industry: "Web系游戏公司", role: "イラストレーター", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "绘画技能，美术要求" },
    { industry: "Web系游戏公司", role: "UIデザイナー", literature_ok: "★☆☆☆☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "UI美术，有作品集" },
    { industry: "Web系游戏公司", role: "3DCGアーティスト", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "计划", "服从", "理想", "自律"], note: "3D建模，美术专业" },
    { industry: "Web系游戏公司", role: "ミュージック", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "音乐创作，需专业" },
    { industry: "Web系游戏公司", role: "アニメーションデザイナー", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "动画技能，美术要求" },
    { industry: "Web系游戏公司", role: "テクニカルアーティスト", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "服从", "理想", "自律"], note: "技术+美术，需技能" },
    { industry: "Web系游戏公司", role: "デザイン制作管理", literature_ok: "★★★☆☆", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "美术管理，偏综合" },
    { industry: "Web系游戏公司", role: "サウンドデザイン", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "随意", "服从", "理想", "冲动"], note: "音效音乐，需技能" },
    { industry: "Web系游戏公司", role: "モーションキャプチャースタッフ", literature_ok: "★☆☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "动画拍摄，技术背景" },
    { industry: "Web系游戏公司", role: "クライアントサイドエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "客户端开发，理工为主" },
    { industry: "Web系游戏公司", role: "サーバーサイドエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "后端开发，理工为主" },
    { industry: "Web系游戏公司", role: "フロントエンドエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "前端开发，技术岗" },
    { industry: "Web系游戏公司", role: "コンシューマーエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "主机开发，技术岗" },
    { industry: "Web系游戏公司", role: "ゲームエンジンエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "引擎开发，计算机专业" },
    { industry: "Web系游戏公司", role: "iOS/Android エンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "服从", "现实", "自律"], note: "移动端开发，理工岗" },
    { industry: "Web系游戏公司", role: "インフラエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "服务器/网络，理工岗" },
    { industry: "Web系游戏公司", role: "開発運用サポートエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "运维支持，IT技能" },
    { industry: "Web系游戏公司", role: "データ分析エンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "数据分析，理工技能" },
    { industry: "Web系游戏公司", role: "業務サポートエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "内部IT支持，技术岗" },
    { industry: "Web系游戏公司", role: "AIエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "AI算法，需理工背景" },
    { industry: "Web系游戏公司", role: "リサーチ・エンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "理想", "自律"], note: "研究创新，技术岗" },
    { industry: "Web系游戏公司", role: "研究職", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "理想", "自律"], note: "研发，理工主力" },
    { industry: "Web系游戏公司", role: "デバッグ職", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "测试辅助，文科极少数" },
    { industry: "Web系游戏公司", role: "漫画編集職", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "内容编辑，文科常见" },
    { industry: "Web系游戏公司", role: "アニメ製作職", literature_ok: "★★★☆☆", traits: ["外向", "感性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "管理/动画，综合型" },
    { industry: "Web系游戏公司", role: "映像制作室", literature_ok: "★★★☆☆", traits: ["外向", "感性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "影像管理，偏美术" },
    { industry: "Web系游戏公司", role: "デザイン制作室", literature_ok: "★★☆☆☆", traits: ["外向", "感性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "美术/管理，文理皆可" },
    { industry: "Web系游戏公司", role: "ライツ事業職", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "IP授权，文科优势" },
    { industry: "Web系游戏公司", role: "メディアプランナー", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "媒体策划，文科主力" },
    { industry: "Web系游戏公司", role: "宣伝プランナー", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "冲动"], note: "宣传企划，创意表达" },
    { industry: "Web系游戏公司", role: "グローバル事業職", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "国际业务，多语种" },
    { industry: "Web系游戏公司", role: "ローカライゼーション", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "服从", "理想", "自律"], note: "本地化，语言文科主力" },
    { industry: "Web系游戏公司", role: "プラットフォームエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "平台开发，理工岗" },
    { industry: "Web系游戏公司", role: "セキュリティエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "安全运维，理工岗" },
    { industry: "Web系游戏公司", role: "社内システムインフラエンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "内部IT，技术岗" },
    { industry: "Web系游戏公司", role: "社内システム開発エンジニア", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "系统开发，理工岗" },
    { industry: "Web系游戏公司", role: "バックオフィス", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "后台综合，文科主力" },

    # 零售公司
    { industry: "零售公司", role: "販売マネジメント", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "店铺运营、人员管理、人事评价" },
    { industry: "零售公司", role: "マーチャンダイザー", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "商品企划、进货、销售战略" },
    { industry: "零售公司", role: "スーパーバイザー", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "店铺指导、商品管理、库存教育" },
    { industry: "零售公司", role: "RE・VMD", literature_ok: "★★☆☆☆", traits: ["内向", "感性", "谨慎", "创新", "计划", "服从", "理想", "自律"], note: "店铺陈列与设备维护" },
    { industry: "零售公司", role: "品質管理", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "商品质量与安全检查" },
    { industry: "零售公司", role: "販売促進", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "随意", "领导", "理想", "冲动"], note: "广告宣传、POP、DM、促销" },
    { industry: "零售公司", role: "施設管理", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "建筑、电气、防灾等维护" },
    { industry: "零售公司", role: "トレーナー", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "保守", "计划", "领导", "理想", "自律"], note: "员工教育与教材开发" },
    { industry: "零售公司", role: "事業推進", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "催事计划、租赁业务、合作开拓" },
    { industry: "零售公司", role: "海外部", literature_ok: "★★★★☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "进出口、国际采购业务" },
    { industry: "零售公司", role: "物流企画開発", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "物流改革、配送系统设计" },
    { industry: "零售公司", role: "マーケティング戦略", literature_ok: "★★★☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "领导", "现实", "自律"], note: "数据分析、战略策划、顾客洞察" },

    # 批发公司
    { industry: "批发公司", role: "小売業向営業", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "现实", "冲动"], note: "面向零售商销售提案" },
    { industry: "批发公司", role: "デリカ向営業", literature_ok: "★★★★☆", traits: ["外向", "理性", "谨慎", "创新", "计划", "领导", "现实", "自律"], note: "向惣菜部门销售提案" },
    { industry: "批发公司", role: "外食業向営業", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "现实", "冲动"], note: "向餐饮客户提案交涉" },
    { industry: "批发公司", role: "商品開発担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "品牌商品开发企划" },
    { industry: "批发公司", role: "輸出入担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "商品进出口业务" },
    { industry: "批发公司", role: "マーケティング企画", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "创新", "随意", "领导", "理想", "自律"], note: "市场分析与战略企划" },
    { industry: "批发公司", role: "受注・発注担当", literature_ok: "★★☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "订单处理与库存调整" },
    { industry: "批发公司", role: "センター運営担当", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "物流中心管理" },
    { industry: "批发公司", role: "物流企画・開発", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "物流系统规划改革" },
    { industry: "批发公司", role: "情報システム担当", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "系统开发与DX推进" },
    { industry: "批发公司", role: "経理担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "财务与会计管理" },
    { industry: "批发公司", role: "法務／品質管理／人事", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "合规、人事与质量控制" },

    # 物流公司
    { industry: "物流公司", role: "営業所経営担当", literature_ok: "★★★★★", traits: ["外向", "理性", "果断", "保守", "计划", "领导", "现实", "自律"], note: "营业所运营管理" },
    { industry: "物流公司", role: "サービス企画担当", literature_ok: "★★★★★", traits: ["外向", "感性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "服务与方案企划" },
    { industry: "物流公司", role: "デジタル推進担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "果断", "创新", "计划", "服从", "现实", "自律"], note: "系统改革与数位转型" },
    { industry: "物流公司", role: "輸送ネットワーク設計担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "运输网络设计" },
    { industry: "物流公司", role: "経営戦略・企画担当", literature_ok: "★★★★☆", traits: ["外向", "理性", "果断", "创新", "计划", "领导", "理想", "自律"], note: "全社战略与企划" },
    { industry: "物流公司", role: "法務・コンプライアンス担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "法律事务与合规管理" },
    { industry: "物流公司", role: "財務・会計担当", literature_ok: "★★★☆☆", traits: ["内向", "理性", "谨慎", "保守", "计划", "服从", "现实", "自律"], note: "财务与会计操作" },
    { industry: "物流公司", role: "高度ロジスティクスコース", literature_ok: "★☆☆☆☆", traits: ["内向", "理性", "谨慎", "创新", "计划", "服从", "现实", "自律"], note: "高级物流设计与优化" },
    { industry: "物流公司", role: "セールスドライバーコース", literature_ok: "★★★★☆", traits: ["外向", "感性", "果断", "保守", "随意", "服从", "现实", "冲动"], note: "送货与客户关系构筑" }






  ]



  def new
    # 渲染性格测试表单
  end

  def create
    scores = Hash.new(0)
    (1..32).each do |i|
      most  = params["q#{i}_most"]
      least = params["q#{i}_least"]
      map   = QUESTION_MAPPINGS[i-1]
      scores[map[most]] += 2 if most.present?
      scores[map[least]] -= 1 if least.present?
    end
    @scores = scores
  
    # ========== 复制 show 的逻辑开始 ==========
    trait_pairs = [
      [:introversion, :extraversion],
      [:emotional, :rational],
      [:cautious, :decisive],
      [:traditional, :creative],
      [:random, :plan],
      [:subordinate, :leader],
      [:dream, :fact],
      [:impulse, :restraint]
    ]
  
    direction_labels = [
      ["内向", "外向"],
      ["感性", "理性"],
      ["谨慎", "果断"],
      ["保守", "创新"],
      ["随意", "计划"],
      ["服从", "领导"],
      ["理想", "现实"],
      ["冲动", "自律"]
    ]
  
    @user_traits = []
    trait_pairs.each_with_index do |(left, right), i|
      if @scores[left].to_i > @scores[right].to_i
        @user_traits << direction_labels[i][0]
      else
        @user_traits << direction_labels[i][1]
      end
    end
    
    @matches = ALL_JOBS.map do |job|
      match_count = job[:traits].zip(@user_traits).count { |a, b| a == b }
      job.merge(match_count: match_count)
    end.sort_by { |job|
      [-job[:match_count], -literature_score(job[:literature_ok])]
    }



    @top_matches = @matches.first(30)
    @all_matches = @matches.first(300)
    # ========== 复制 show 的逻辑结束 ==========
  
    render :show
  end
  
  

  def show
    # 展示结果页面
    trait_pairs = [
      [:introversion, :extraversion],
      [:emotional, :rational],
      [:cautious, :decisive],
      [:traditional, :creative],
      [:random, :plan],
      [:subordinate, :leader],
      [:dream, :fact],
      [:impulse, :restraint]
    ]

    direction_labels = [
      ["内向", "外向"],
      ["感性", "理性"],
      ["谨慎", "果断"],
      ["保守", "创新"],
      ["随意", "计划"],
      ["服从", "领导"],
      ["理想", "现实"],
      ["冲动", "自律"]
    ]

    @user_traits = []
    trait_pairs.each_with_index do |(left, right), i|
      if @scores[left].to_i > @scores[right].to_i
        @user_traits << direction_labels[i][0] # 左端向
      else
        @user_traits << direction_labels[i][1] # 右端向
      end
    end


    @matches = ALL_JOBS.map do |job|
      match_count = job[:traits].zip(@user_traits).count { |a, b| a == b }
      job.merge(match_count: match_count)
    end.sort_by { |job|
      [-job[:match_count], -literature_score(job[:literature_ok])]
    }

    
    # 推荐前5个最匹配的岗位（可根据需要调整数量）
    @top_matches = @matches.first(30)
    @all_matches = @matches.first(300)

  end


  helper_method :job_record

  def job_record(job)
    JobRole.find_by(industry: job[:industry], role: job[:role]) || JobRole.new
  end




  private
  def literature_score(str)
    str.count("★")
  end
end

