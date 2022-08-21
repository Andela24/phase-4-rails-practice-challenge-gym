class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created

    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_unprocessable_entity_response(exeption)
        render json: { errors: exception.record.error.full_messages }, status: :unprocessable_entity
end

end

# Create a new membership

# New membership require a gym_id, client_id, and membership charge.
# Validation: A client can have only one membership with gym