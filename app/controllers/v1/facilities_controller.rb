class V1::FacilitiesController < ApplicationController

    def index
        begin
            results = Facility.search "*"

            render json: results, status: 200 

        rescue Searchkick::InvalidQueryError => e
            render json: e.as_json, status: 400
        end
    end

    def create
        @facility = Facility.create(facility_params)
        if @facility.save
         render json: @facility, status: 201 
        else
         render json: @facility.errors, status: 422
        end 
     end

     def show
        @facility = Facility.find(params[:id])
        render json: @facility, status: 200
     end

     def update
        @facility = Facility.find(params[:id])
         
        if @facility.update_attributes(facility_params)
            render json: @facility, status: 200 
        else
            render json: @facility.errors.messages, status: 422
        end
     end

     def destroy
        @facility = Facility.find(params[:id])

        @facility.destroy 
            if @facility.destroyed?
                render json: @facility , status: 200
            else
                render json: @facility.errors.messages, status: 404
            end
    end
     
     private

     def facility_params
        params.permit(
        :name,
        :latitude,
        :longitude,
        :full_adress,
        :district,
        :city,
        :type
        )
     end
end
