class StudentsController < ApplicationController
  def index
    @students = Student.needs_financial_aid
    # @students = Student.where('needs = true')
  end

  def create
    unless params[:student][:needs_financial_aid]
      params[:student][:needs_financial_aid] = false
    end

    student = Student.new({
      name: params[:student][:name],
      school_days_completed: params[:student][:school_days_completed],
      needs_financial_aid: params[:student][:needs_financial_aid]
      })

    student.save

    redirect_to '/students'
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])

    unless params[:student][:needs_financial_aid]
      params[:student][:needs_financial_aid] = false
    end

    student.update({
      name: params[:student][:name],
      school_days_completed: params[:student][:school_days_completed],
      needs_financial_aid: params[:student][:needs_financial_aid]
      })

    student.save

    redirect_to "/students/#{student.id}"
  end

  def destroy
    Student.destroy(params[:id])
    redirect_to '/students'
  end
end
