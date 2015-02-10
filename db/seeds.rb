require 'faker'

#Create Questions
5.times do
  Question.create!(
    questions: Faker::Lorem.sentence,
    status: Faker::Lorem.word)
end
  
#Create Answers

20.times do
  Answer.create!(
    answers: Faker::Lorem.paragraph)
end

30.times do
  Tag.create!(
    name: Faker::Lorem.word)
end

puts "Seed finished!!!"
puts "#{Question.count} questions created"
puts "#{Answer.count} answers created"
puts "#{Tag.count} tags created"