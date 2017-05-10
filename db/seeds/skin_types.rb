SkinType.create([
                  { id: 1, name: 'N/A' },
                  { id: 2, name: 'Very Light' },
                  { id: 3, name: 'Light' },
                  { id: 4, name: 'Dark intermediate' },
                  { id: 5, name: 'Dark' },
                  { id: 6, name: 'Very dark' }
                ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE skin_types_id_seq RESTART 7;')
