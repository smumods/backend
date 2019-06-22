class Types::SearchResult < Types::BaseUnion
    description 'Courses and Professors that a search may return'
    possible_types Types::Course, Types::Professor
end