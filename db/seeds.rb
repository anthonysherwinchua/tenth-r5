files = [
  'users',
  'blood_types',
  'citizenships',
  'civil_statuses',
  'contact_types',
  'countries',
  'documents',
  'languages',
  'occupations',
  'relationships',
  'religions',
  'schools',
  'skills',
  'skin_types',
  'zodiacs'
]

files.each do |file|
  if file.singularize.camelize.constantize.count < 1
    puts "File: #{file}"
    require Rails.root + "db/seeds/#{file}.rb"
  else
    puts "Skipping File: #{file}"
  end
end
