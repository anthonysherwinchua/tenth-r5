class ApplicantForm < BaseForm

  attr_accessor :applicant

  def initialize(applicant)
    @applicant = applicant
  end

  def religions
    @religions ||= Religion.active
  end

  def citizenships
    @citizenships ||= Citizenship.active
  end

  def civil_statuses
    @civil_statuses ||= CivilStatus.active
  end

  def genders
    @genders ||= Applicant.genders.keys.map{|key| [key.titleize, key] }
  end

  def save(params)
    @applicant.update(params)
  end

end
