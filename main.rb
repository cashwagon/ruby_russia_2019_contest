# frozen_string_literal: true

require 'csv'

answers = CSV.read('./rr_2019.csv')
# Uniq by email or phone.
filtered_answers = answers.uniq { |x| x[2] || x[3] }
correct_answers = [
  '[nil, nil, nil]',
  'TRUE',
  '{b: :c}',
  'Quack-quack',
  '7'
]

candidates_for_victory = filtered_answers.select do |candidate|
  candidate_answers = candidate[4..8]

  candidate_answers == correct_answers
end

puts "Количество кандидатов: #{candidates_for_victory.size}"

winner = candidates_for_victory.shuffle.sample

puts "Email победителя: #{winner[3]}"
