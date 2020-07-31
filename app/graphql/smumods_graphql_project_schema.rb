class SmumodsGraphqlProjectSchema < GraphQL::Schema
  # Batching
  use GraphQL::Batch

  # Mutations & Queries
  mutation(Types::MutationType)
  query(Types::QueryType)
end
