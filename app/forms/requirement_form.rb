class RequirementForm < BaseForm

  attr_accessor :job_opening, :requirement

  def initialize(job_opening, requirement)
    @job_opening = job_opening
    @requirement = requirement
  end

  def documents
    @documents ||= Document.active
  end

  def save(params)
    @requirement.update(params)
  end

end
