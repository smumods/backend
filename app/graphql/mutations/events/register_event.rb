module Mutations
    module Events
        class RegisterEvent < Mutations::BaseMutation
            null true

            argument :id, ID, required: true

            field :event, Types::EventType, null: true
            field :user, Types::UserType, null: true    
            field :status, Boolean, null: true
            field :message, String, null: true

            def resolve(id:)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                    return
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                raise GraphQL::ExecutionError.new("You have to specify the event ID") unless id
                
                event = Event.find(id)
                raise GraphQL::ExecutionError.new("We could not find an event by that ID.") if event.nil?

                rsvp = Rsvp.find_by(user_id: current_user.id, event_id: event.id)
                if rsvp.nil?
                    if Rsvp.create(user_id: current_user.id, event_id: event.id)
                        return  { status: true, event: event, user: current_user }
                    else
                        raise GraphQL::ExecutionError.new("We could not RSVP you due to some server issues.")
                    end
                else
                    return { status: false, message: "You have already RSVPed for this event" }
                end
            end
        end
    end 
end