class ApplicantRequirementDecorator < BaseDecorator

  def relevant_date

  end

  def status_label
    case status
      when :missing then 'Not found'
      when :expire then "Expired since #{expire}"
      when :soon_to_expire then "Will expire soon on #{expire}"
      when :current then "Up to date"
      when :applied then "Applied on #{apply}"
      else
        "error status: #{status}"
    end
  end

  def status
    return :expired if expire && Date.current >= expire
    return :soon_to_expire if expire && Date.current >= (expire + 1.week)
    return :current if arrive
    return :applied if apply.present?
    :missing
  end

  def status_label_level
    case status
      when :missing, :expired then :danger
      when :soon_to_expire then :warning
      when :applied then :info
      when :current then :success
    end
  end

end
