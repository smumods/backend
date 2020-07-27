class SmumodsGraphqlProjectSchema < GraphQL::Schema
  # Batching
  max_depth 6
  use GraphQL::Batch

  # Mutations & Queries
  mutation(Types::MutationType)
  query(Types::QueryType)
end
