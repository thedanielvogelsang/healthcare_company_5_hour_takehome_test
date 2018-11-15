require 'rails_helper'

describe 'Drug' do
  it 'should be able to be created with a name and id' do
    expect(Drug.count).to eq(0)

    Drug.create(id: 1234, name: 'Test Drug')

    expect(Drug.count).to eq(1)
  end
  it 'should be scoped to opoid boolean' do
    Drug.create(id: 1234, name: 'Test Drug', opioid: true)
    Drug.create(id: 1236, name: 'Test Drug 2', opioid: false)

    expect(Drug.count).to eq(2)
    expect(Drug.first.opioid).to be true
    expect(Drug.second.opioid).to be false
    expect(Drug.addictive.count).to eq(1)
    expect(Drug.addictive.first).to eq(Drug.first)
    expect(Drug.not_addictive.count).to eq(1)
    expect(Drug.not_addictive.first).to eq(Drug.last)
  end
end
