# frozen_string_literal: true

module Domain
  class EmployeeTitle
    def initialize(randomizer)
      @randomizer = randomizer
    end

    def generate
      seniority = generate_seniority
      department = generate_department
      specialty = generate_specialty
      "#{seniority} of #{department} #{specialty}"
    end

    private

    def generate_seniority
      seniorities = %w[VP Director President Chairman Head]
      generate_seniority_prefix + @randomizer.random_element_of(seniorities)
    end

    def generate_seniority_prefix
      prefix_or_none = ['Senior ', '']
      @randomizer.random_element_of(prefix_or_none)
    end

    def generate_department
      departments = ['Engineering', 'QA', 'Security', 'Sales',
                     'Marketing', 'Business', 'Product', 'Content',
                     'Machine Learning', 'Science', 'Analytics',
                     'Cloud', 'Financial', 'IT', 'HR', 'Software',
                     'Technology', 'AI', 'Data Science']
      @randomizer.random_element_of(departments)
    end

    def generate_specialty
      seniorities = %w[Operations Strategy Innovation Development]
      @randomizer.random_element_of(seniorities)
    end
  end
end
