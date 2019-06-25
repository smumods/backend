class SmumodsGraphqlProjectSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # resolve_type lambda { |_obj, _ctx| }
end
