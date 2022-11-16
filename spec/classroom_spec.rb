require_relative '../src/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math')
  end

  context 'when initialized' do
    it 'takes one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end

    it 'should create a Classroom class instance' do
      expect(@classroom.label).to eq('Math')
    end
  end
end
