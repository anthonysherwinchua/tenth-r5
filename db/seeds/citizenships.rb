Citizenship.create([
                     { id: 1, name: 'Filipino', enabled: true }
                   ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE citizenships_id_seq RESTART 2;')
