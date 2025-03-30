class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 300 }
  validate :no_forbidden_keywords  # 👈 添加这一行

  private

  def no_forbidden_keywords
    banned_words = ["傻逼", "垃圾", "fuck", "操", "滚", "你妈", "敏感词"]  # 你可以添加更多词
    if banned_words.any? { |word| content&.include?(word) }
      errors.add(:content, "中包含违禁词")
    end
  end
end
