Zodiac.create([
                { id: 1, name: 'N/A' },
                { id: 2, name: 'ARIES' },
                { id: 3, name: 'TAURUS' },
                { id: 4, name: 'GEMINI' },
                { id: 5, name: 'CANCER' },
                { id: 6, name: 'LEO' },
                { id: 7, name: 'VIRGO' },
                { id: 8, name: 'LIBRA' },
                { id: 9, name: 'SCORPIO' },
                { id: 10, name: 'SAGITTARIUS' },
                { id: 11, name: 'CAPRICORN' },
                { id: 12, name: 'AQUARIUS' },
                { id: 13, name: 'PISCES' }
              ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE zodiacs_id_seq RESTART 14;')
