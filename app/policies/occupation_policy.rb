class OccupationPolicy < LookupBasePolicy

  def disable?
    @record.job_openings.size.zero?
  end

end
