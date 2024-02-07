class StudentsController < ApplicationController


    def new 
        @student = Student.new
        @student.build_university
    end

    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
    end

    def create
        @student = Student.new(student_params)
        if @student.save 
            redirect_to students_path
        end
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        @student.update(student_params)

        redirect_to  students_path 
    end

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to students_path, notice: "Student deleted successfully"
    end

    private

    def student_params
        params.require(:student).permit(:name, :program, :f_name, :university_id)
    end
end