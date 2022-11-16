require_relative '../src/teacher'

describe Teacher do
  @specialization = 'Math'
  teacher = Teacher.new(nil, 'Jhon', true)

  context 'when teacher is created' do
    it 'should have specialization' do
      expect(teacher.specialization).to eq(@specialization)
    end
  end

  context 'when teacher can use services' do
    it 'should return true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end

  context 'should create an instance of Teacher' do
    it 'should return true' do
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end
end