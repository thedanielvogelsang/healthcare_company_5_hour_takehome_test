require 'rails_helper'

describe 'Drug' do
  it 'should be able to be created with a name and id' do
    expect(Drug.count).to eq(0)

    Drug.create(id: 1234, name: 'Test Drug')

    expect(Drug.count).to eq(1)
  end
end
