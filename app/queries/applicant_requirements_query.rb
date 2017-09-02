class ApplicantRequirementsQuery

  attr_reader :application, :applicant, :job_opening, :result

  def initialize(application_id)
    @application = Application.eager_load(job_opening: [requirements: [:document]]).find(application_id)
    @applicant = @application.applicant
    @job_opening = @application.job_opening
  end

  def result
    @result ||= job_opening_required_documents.map do |required_document|
      find_or_initialize(required_document)
    end
  end

  private

  def find_or_initialize(required_document)
    applicant_requirements.detect { |requirement| requirement.document.id == required_document.id } ||
      @applicant.applicant_requirements.new(document: required_document)
  end

  def job_opening_required_documents
    @required_documents ||= job_opening.requirements.active.map(&:document)
  end

  def applicant_requirements
    @applicant_requirements ||= applicant.applicant_requirements
  end
end
