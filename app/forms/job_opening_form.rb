class JobOpeningForm < BaseForm

  attr_accessor :job_opening

  def initialize(job_opening)
    @job_opening = job_opening
  end

  def countries
    @countries ||= Country.active
  end

  def occupations
    @occupations ||= Occupation.active
  end

  def save(params)
    @job_opening.update(params)
  end

end
