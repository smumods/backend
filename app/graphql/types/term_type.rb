module Types
  class TermType < Types::BaseObject
    field :all_professors, [Types::ProfessorType], null: true
    field :term, String, null: true

    def all_professors
      binding.pry
    end

    def term
      binding.pry
    end
  end
end
