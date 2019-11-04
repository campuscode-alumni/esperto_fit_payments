module Api::V1
  class PlansController < ApiController
    def create
      @plan = Plan.new(set_params)
      if @plan.save!
        render json: @plan, serializer: SimplePlanSerializer, status:201
      end
    end

    def index
      @plans = Plan.all
      return render json: @plans, each_serializer: SimplePlanSerializer, status: 200 if @plans != nil
    end

    def show
      @plan = Plan.find(params[:id])
      return render json: @plan, serializer: SimplePlanSerializer, status: 200 if @plan != nil
    end

    private

    def set_params
      params.require(:plan).permit(:name, :value)
    end
  end
end