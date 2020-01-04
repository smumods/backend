class SmumodsGraphqlProjectSchema < GraphQL::Schema
  # Add NewRelic tracing
  use(GraphQL::Tracing::NewRelicTracing)

  mutation(Types::MutationType)
  query(Types::QueryType)
end
