class SmumodsGraphqlProjectSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # use GraphQL::Batch
  use BatchLoader::GraphQL
end
