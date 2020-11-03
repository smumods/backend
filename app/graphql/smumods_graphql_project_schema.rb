class SmumodsGraphqlProjectSchema < GraphQL::Schema
  # Batching
  use GraphQL::Batch

  # Caching
  use GraphQL::Cache

  # Mutations & Queries
  mutation(Types::MutationType)
  query(Types::QueryType)
end
