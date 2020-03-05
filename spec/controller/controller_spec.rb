# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../app/controller/controller'
require 'json'

RSpec.describe 'Employee Title Route' do
  it 'should return JSON' do
    visit '/employee-title'

    content_type = last_response.headers['Content-Type']
    expect(content_type).to eq('application/json')

    body_as_json = JSON.parse(response_body)
    expect(body_as_json).not_to be_empty
  end

  it 'should return a randomly generated employee title with a fixed size' do
    visit '/employee-title'

    body_as_json = JSON.parse(response_body)
    title = body_as_json['title']

    expect(title.split.size).to be > 1
    expect(title.split.size).to be <= 6
  end
end
