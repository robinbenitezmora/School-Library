require_relative '../src/decorator'
require_relative '../src/person'

describe Decorator do
  before(:each) do
    @person = Person.new(22, 'Abdulrahman')
    @decorator = Decorator.new(@person)
  end
  describe 'new decorated person' do
    it 'it has to contain a name' do
      expect(@decorator.correct_name).to eq('Abdulrahman')
    end
  end
end
