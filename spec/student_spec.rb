require_relative '../src/student'
require_relative '../src/classroom'

describe Student do
  before :each do
    @student = Student.new(21, 'John', parent_permission: true)
  end

  context 'when initialized' do
    it 'takes three parameters and returns a Student object' do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'should create a Student class instance' do
      charles = Student.new(18, 'Charles', parent_permission: true)
      maria = Student.new(12, 'Maria', parent_permission: true)

      expect(charles.name).to eq('Charles')
      expect(maria.name).to eq('Maria')
    end

    it 'use of services is true' do
      expect(@student.can_use_services?).to be(true)
    end
  end

  context 'when play_hooky' do
    it 'returns a string' do
      expect(@student.play_hooky).to be_a(String)
    end
  end
end