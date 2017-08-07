class ApplicantDocumentsPresenter

  attr_reader :application, :requirements, :job_opening

  def initialize(application_id)
    applicant_requirement_query = ApplicantRequirementsQuery.new(application_id)
    @application = applicant_requirement_query.application
    @job_opening = @application.job_opening

    @requirements = applicant_requirement_query.result.map do |applicant_requirement|
      ApplicantRequirementDecorator.new(applicant_requirement)
    end
  end

end
