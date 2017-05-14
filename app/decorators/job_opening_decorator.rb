class JobOpeningDecorator < BaseDecorator

  def country_was
    @country_was ||= changes.include?(:country_id) ? Country.find(changes[:country_id].first) : country
  end

  def occupation_was
    @occupation_was ||= changes.include?(:occupation_id) ? Occupation.find(changes[:occupation_id].first) : occupation
  end

end
