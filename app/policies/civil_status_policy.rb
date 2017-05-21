class CivilStatusPolicy < LookupBasePolicy

  def disable?
    @record.applicants.size.zero?
  end

end
