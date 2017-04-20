class PatientsController < ApplicationController
	before_action :find_patient, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor!, only: [:new, :edit]
	def index 
		if params.has_key?(:condition)
			@condition_id = Condition.find_by(name: params[:condition]).id
			@patients = Patient.where(:condition_id => @condition_id).order("created_at DESC")
		elsif params.has_key?(:doctor_id)
			@patients = Patient.where(:doctor_id => params[:doctor_id]).order("created_at DESC")
		else
			@patients = Patient.all.order("created_at DESC")
		end
	end

	def show 
	end

	def new 
		@patient = current_doctor.patients.build
		@conditions = Condition.all.map{ |c| [c.name,c.id]}
	end

	def create
		@patient = current_doctor.patients.build(patient_params)
		@patient.condition_id = params[:condition_id]

		if @patient.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@conditions = Condition.all.map{ |c| [c.name,c.id]}
	end 

	def update
		@patient.condition_id = params[:condition_id]
		if @patient.update(patient_params)
			redirect_to patient_path(@patient)
		else
			render 'edit'
		end
	end

	def destroy
		@patient.destroy
		redirect_to root_path
	end

	private
		def patient_params
			params.require(:patient).permit(:fname,:lname,:address,:dob,:bloodtype,:alergies,:condition_id)
		end

		def find_patient
			@patient = Patient.find(params[:id])
		end
end
