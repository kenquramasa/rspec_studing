FactoryBot.define do
  factory :code do
    raw_code { 
      'let y = s.reduce((a, b) => a <= b ? a : b),
      m = y.length,
      l = m'
    }
  end

  factory :params, class: Code do
    id { 10 }
  end
end
