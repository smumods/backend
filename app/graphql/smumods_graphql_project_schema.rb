class SmumodsGraphqlProjectSchema < GraphQL::Schema
  # Batching
  max_depth 4
  use GraphQL::Batch

  # Mutations & Queries
  mutation(Types::MutationType)
  query(Types::QueryType)
end
