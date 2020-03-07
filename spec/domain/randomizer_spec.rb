# frozen_string_literal: true

require_relative '../../app/domain/randomizer'
require 'faker'

RSpec.describe 'Randomizer' do
  it 'should return a random array element' do
    array = [Faker::Company.bs, Faker::Company.catch_phrase,
             Faker::Company.buzzword]

    result = Domain::Randomizer.random_element_of(array)
    expect(array).to contain result
  end
end
