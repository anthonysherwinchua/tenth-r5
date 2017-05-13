AcademicLevel.create([
                       {id: 1, name: 'N/A'},
                       {id: 2, name: 'Preschool'},
                       {id: 3, name: 'Elementary school'},
                       {id: 4, name: 'High school'},
                       {id: 5, name: 'Tertiary education'},
                       {id: 6, name: 'Vocational education'},
                       {id: 7, name: 'Graduate education'},
                       {id: 8, name: 'Adult education'}
                      ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE academic_levels_id_seq RESTART 9;')
