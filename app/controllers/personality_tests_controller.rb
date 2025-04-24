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
    render :show
  end
  

  def show
    # 展示结果页面
  end
end

