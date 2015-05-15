require 'spec_helper'

describe User do

  let(:sean){ User.create! }

  let(:parking_spot){ ParkingSpot}

# describe User do

#   let(:bob){ User.create! }

#   let(:survey){ Survey.create!(creator: bob) }

#   let(:question){ Question.create!(survey: survey) }

#   let(:choice){ Choice.create!(question: question) }

#   let(:answer){
#     Answer.create!(
#       user: bob,
#       question: question,
#       choice: choice,
#     )
#   }

#   it 'should have many surveys' do
#     expect(bob.my_surveys).to eq []
#     bob.reload
#     expect(bob.my_surveys).to eq [survey]
#     survey.reload
#     expect(survey.creator).to eq bob
#   end

#   it 'should have many answers' do
#     expect(bob.answers).to eq []
#     answer # create the answer
#     bob.reload
#     expect(bob.answers).to eq [answer]
#   end

#   it 'should be able to give me all the answers for a given survey' do
#     expect(bob.answers.for_survey(survey)).to eq []
#     answer # create an answer
#     bob.reload
#     expect(bob.answers.for_survey(survey)).to eq [answer]
#     other_survey = Survey.create!(creator: User.create!)
#     expect(bob.answers.for_survey(other_survey)).to eq []
#   end

#   it 'should have many taken_surveys' do
#     expect(bob.taken_surveys).to eq []
#     answer # bob answers a survey question
#     bob.reload
#     expect(bob.taken_surveys).to eq [survey]
#   end

# end