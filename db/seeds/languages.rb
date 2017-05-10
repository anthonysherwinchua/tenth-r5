Language.create([
                  { id: 1, name: 'English', enabled: true },
                  { id: 2, name: 'Mandarin', enabled: true }
                ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE languages_id_seq RESTART 3;')
