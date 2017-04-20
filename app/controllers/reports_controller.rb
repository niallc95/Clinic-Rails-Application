class ReportsController < ApplicationController
	before_action :find_patient
	before_action :find_report, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor!, only: [:new, :edit]
	def new
		@report = Report.new 
	end 

	def show 
	end

	def create
		@report = Report.new(report_params)
		@report.doctor_id = current_doctor.id
		@report.patient_id = @patient.id

		if @report.save
			redirect_to patient_path(@patient)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @report.update(report_params)
			redirect_to patient_path(@patient)
		else 
			render 'edit'
		end
	end

	def destroy
		@report.destroy
		redirect_to patient_path(@patient)
	end

	private

		def report_params
			params.require(:report).permit(:date, :report)
		end

		def find_patient
			@patient = Patient.find(params[:patient_id])
		end

		def find_report
			@report = Report.find(params[:id])
		end

end
