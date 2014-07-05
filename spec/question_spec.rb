require 'spec_helper'

describe Question do
	describe '#results' do
		
		let(:survey) { Survey.all[0] }
		let(:question) { survey.questions[0] }

		it 'returns an Array' do
			expect(question.results(survey)).to be_a Array
		end

		it 'returns a Array of Choices' do
			expect(question.results(survey)[0]).to be_a Choice
		end
	end
end