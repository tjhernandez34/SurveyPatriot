require 'spec_helper'

describe Question do

		let(:survey) { Survey.all[0] }
		let(:question) { survey.questions[0] }

	describe '#data' do

		it 'returns an Array' do
			expect(question.data(survey)).to be_a Array
		end

		it 'returns a Array of Choices' do
			expect(question.data(survey)[0]).to be_a Choice
		end
	end

	describe '#results' do

		it 'returns a Hash' do
			expect(question.results(survey)).to be_a Hash
		end

		it 'returns an Array of values that correspond to the Choice ids' do
			expect(question.results(survey).first).to be_a Array
			expect(question.results(survey).first[1][0]).to be_a Choice
		end

	end
end
