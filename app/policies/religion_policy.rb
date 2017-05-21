class ReligionPolicy < LookupBasePolicy

  def disable?
    @record.applicants.size.zero?
  end

end
