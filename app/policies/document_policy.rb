class DocumentPolicy < LookupBasePolicy

  def disable?
    @record.requirements.size.zero?
  end

end
