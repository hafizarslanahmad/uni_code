class HecsController < ApplicationController

    def new
        if Current.user.admin?
          @hec = Hec.new 
        else
            redirect_to root_path, alert: "User Admin  should be must"
        end 
    end

    def index 
        @hecs = Hec.all
    end
    
    def show
        @hec = Hec.find(params[:id])
    end

    def create
        if Current.user.admin?
        @hec = Hec.new(hec_params)
        @hec.save 
            redirect_to root_path, notice: "HEC created successfully"
        else 
            render new root_path, alert: "User Admin must "
        end
    end

    def edit 
        @hec = Hec.find(params[:id])
    end

    def update
        @hec = Hec.find(params[:id])
        if @hec.update(hec_params)
            redirect_to hecs_path, notice: "HEC has been updated"
        end
    end

    def destroy
        @hec = Hec.find(params[:id])
        @hec.destroy
        redirect_to hec_path, notice: "HEC deleted successfully"
    end

    private

    def hec_params
        params.require(:hec).permit(:country, :user_id)
    end
end