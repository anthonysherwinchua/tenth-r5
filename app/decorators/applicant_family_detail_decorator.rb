class ApplicantFamilyDetailDecorator < BaseDecorator

  def sisters
    super || 'N/A'
  end

  def brothers
    super || 'N/A'
  end

  def no_in_fam
    super || 'N/A'
  end

  def eldest
    super || 'N/A'
  end

  def youngest
    super || 'N/A'
  end

  def children
    super || 'N/A'
  end

end
