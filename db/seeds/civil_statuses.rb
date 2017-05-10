CivilStatus.create([
                     { id: 1, name: 'N/A', enabled: true },
                     { id: 2, name: 'Single', enabled: true },
                     { id: 3, name: 'Married', enabled: true },
                     { id: 4, name: 'Separated', enabled: true },
                     { id: 5, name: 'Divorced', enabled: true },
                     { id: 6, name: 'Widowed', enabled: true }
                   ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE civil_statuses_id_seq RESTART 7;')
