class UniversitiesController < ApplicationController

    def new
        if Current.user.admin?  
            @university = University.new
            @university.students.build
        else
            redirect_to root_path, alert: "User Admin  should be must"
        end
    end

    def index
        @universities = University.all
    end

    def show
        @university = University.find(params[:id])
        @student = @university.students.build
    end

    def create
        if Current.user.admin?
            @university = University.new(uni_params)
            pass = SecureRandom.hex 3
            @user=User.create(name: @university.name, email: @university.name + '@gmail.com', password: pass, role: "university")
            puts pass
            @university.user_id = @user.id
            if @university.save 
                UserMailer.share_password(@user, pass).deliver_now

            end
        end

        redirect_to universities_path
    end

    def edit
        @university = University.find(params[:id])
    end

    def update
        @university = University.find(params[:id])
        @university.update(uni_params)

        redirect_to universities_path 
    end

    def destroy
        @university = University.find(params[:id])
        @university.destroy
        redirect_to universities_path, notice: "University deleted successfully"
    end

    private

    def uni_params
        params.require(:university).permit(:name, :city, :specialization, :user_id)
    end
end