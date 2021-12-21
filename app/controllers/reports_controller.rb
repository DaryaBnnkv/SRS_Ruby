class ReportsController < ApplicationController
	def index
		@report = Report.all
	end

	def new
		@user = User.all
		@users = []
		@user.uniq {|p| @users << ["#{p.first_name} #{p.last_name}", p.id]}
	end

	def show
		@report = Report.find(params[:id])
	end

	def create
		@report = Report.new(params.require(:report).permit(:title, :desc, :user_id))
		@report.save
		redirect_to @report, flash: {success: "Report succeed"}
	end

	def set_mark
		puts params.inspect
		@report = Report.find(params[:id])
		@report.grade = params.require(:mark).permit(:grade)["grade"]
		@report.save
		redirect_to "/"
	end

	def destroy
		@report = Report.destroy(params[:id])
		redirect_to "/"
	end
end
