class ApplicantDecorator < BaseDecorator

  def name
    @name ||= [first_name, middle_initial, last_name, suffix_name].join(' ')
  end

  def middle_initial
    @middle_initial ||= middle_name.blank? ? nil : "#{middle_name[0]}."
  end

  def gender
    super.titleize
  end

  def age
    @age ||= "#{(Date.current.year - birthday.year)} y/o"
  end

  def height
    "#{super} cms"
  end

  def weight
    "#{super} kgs"
  end

end
