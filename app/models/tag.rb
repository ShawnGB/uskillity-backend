class Tag < ApplicationRecord
  enum lang: { de: 0, en: 1}

  validates :text, length: { within: 1..32 }

  def self.language(language)
    where(lang: language)
  end

  def self.english
    where(lang: :en)
  end

  def self.german
    where(lang: :de)
  end
end
