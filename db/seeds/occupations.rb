Occupation.create([
                    { enabled: true, id: 1, name: 'N/A', shorthand: nil },
                    { enabled: true, id: 2, name: 'Domestic Helper', shorthand: 'DH' },
                    { enabled: true, id: 3, name: 'Factory Worker', shorthand: nil },
                    { enabled: true, id: 4, name: 'Caregiver', shorthand: nil },
                    { enabled: true, id: 5, name: 'Nurse', shorthand: nil },
                    { enabled: false, id: 6, name: 'Dancer', shorthand: nil },
                    { enabled: false, id: 7, name: 'Singer', shorthand: nil },
                    { enabled: true, id: 8, name: 'Caretaker', shorthand: nil }
                  ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE occupations_id_seq RESTART 9;')
