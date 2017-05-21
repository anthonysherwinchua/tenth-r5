class CountryPolicy < LookupBasePolicy

  def disable?
    @record.job_openings.size.zero?
  end

end
