require_relative '../src/person'

describe Person do
  context 'when initialized' do
    person = Person.new(40, 'Jack', parent_permission: true)

    it 'takes three parameters and returns a Person object' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'returns correct parameters' do
      expect(person.name).to eq('Jack')
      expect(person.age).to eq(40)
      expect(person.parent_permission).to be(true)
    end

    context 'should create a Person class instance' do
      charles = Person.new(18, 'Charles', parent_permission: true)
      maria = Person.new(12, 'Maria', parent_permission: true)

      it 'correct name' do
        expect(charles.name).to eq('Charles')
        expect(maria.name).to eq('Maria')
      end

      it 'use of services is true' do
        expect(person.can_use_services?).to be(true)
      end
    end
  end
end
