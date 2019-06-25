class Types::ReviewResultType < Types::BaseUnion
    description 'Return EITHER a Review or Professor'
    possible_types Types::CourseType, Types::ProfessorType

    def self.resolve_type(object, context)
        if object.is_a? Professor
            Types::ProfessorType
        else
            Types::CourseType
        end
    end
end