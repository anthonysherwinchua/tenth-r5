ContactType.create([
                     { id: 1, name: 'N/A' },
                     { id: 2, name: 'Mobile Number' },
                     { id: 3, name: 'Home Phone Number' },
                     { id: 4, name: 'Office Phone Number' },
                     { id: 5, name: 'Fax Number' },
                     { id: 6, name: 'Web Address' },
                     { id: 7, name: 'Email Address' },
                     { id: 8, name: 'Postal Address' }
                   ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE contact_types_id_seq RESTART 9;')
