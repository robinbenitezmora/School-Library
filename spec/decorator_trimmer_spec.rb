require_relative '../src/trimmer'
require_relative '../src/person'

describe TrimmerDecorator do
  before(:each) do
    @person = Person.new(22, 'Abdulrahman')
    @trimmer = TrimmerDecorator.new(@person)
  end

  describe 'new trimmed person' do
    it 'should have a name with 10 characters or less' do
      expect(@trimmer.correct_name.length).to be <= 10
    end
  end
end
