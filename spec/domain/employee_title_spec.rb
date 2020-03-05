require File.dirname(__FILE__) + '/../../app/domain/employee_title'
require 'faker'

RSpec.describe "Employee Title Generation" do

	it "should include a senority prefix" do
		prefix = Faker::Company.buzzword

		generator = create_generator(prefix = prefix)
		result = generator.generate

		expect(result).to contain prefix
	end

	it "should generate a title with seniority" do
		seniority = Faker::Company.bs

		generator = create_generator(seniority = seniority)
		result = generator.generate

		expect(result).to contain seniority
		expect(result).to contain "of"
	end
	
	it "should generate a title with a department" do
		department = Faker::Company.profession

		generator = create_generator(department = department)
		result = generator.generate

		expect(result).to contain department
	end
	
	it "should generate a title with a specialty" do
		specialty = Faker::Company.suffix

		generator = create_generator(specialty = specialty)
		result = generator.generate

		expect(result).to contain specialty
	end

	it "should generate a title that is multiple words long" do
		generator = create_generator()
		result = generator.generate

		minimum_size = 4
		expect(result.split.size).to be >= minimum_size
	end	

	private
	def create_generator(prefix = Faker::Company.buzzword,
											 seniority = Faker::Company.bs,
											 department = Faker::Company.profession,
											 specialty = Faker::Company.suffix)
		randomizer = double("randomizer")

		expect(randomizer).to receive(:random_element_of).and_return(prefix)
		expect(randomizer).to receive(:random_element_of).and_return(seniority)
		expect(randomizer).to receive(:random_element_of).and_return(department)
		expect(randomizer).to receive(:random_element_of).and_return(specialty)

		Domain::EmployeeTitle.new(randomizer)
	end
end
