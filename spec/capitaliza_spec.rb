require_relative '../src/capitalize'
require_relative '../src/person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new('john', 20, parent_permission: true)
    @capitalize = CapitalizeDecorator.new(@person)
  end

  context 'when initialized' do
    it 'takes one parameter and returns a CapitalizeDecorator object' do
      expect(@capitalize).to be_an_instance_of(CapitalizeDecorator)
    end
  end
end
