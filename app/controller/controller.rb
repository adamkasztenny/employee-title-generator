# frozen_string_literal: true

require 'sinatra'
require_relative '../domain/randomizer'
require_relative '../domain/employee_title'

get '/employee-title' do
  content_type 'application/json'
  title = create_title
  JSON.generate({ "title": title })
end

private

def create_title
  randomizer = Domain::Randomizer
  Domain::EmployeeTitle.new(randomizer).generate
end
