AcademicDegree.create([
                        { name: 'BS in Something', enabled: true, id: 12 },
                        { name: 'ELEMENTARY GRADUATE', enabled: true, id: 13 },
                        { name: 'HIGH SCHOOL GRADUATE', enabled: true, id: 14 },
                        { name: 'CAREGIVER GRADUATE ', enabled: true, id: 15 },
                        { name: 'UNDERGRADUATE OF NURSING', enabled: true, id: 16 },
                        { name: 'GRADUATE OF BACHELOR OF ARTS', enabled: true, id: 17 },
                        { name: 'GRADUATE OF BS EDUCATION', enabled: true, id: 18 },
                        { name: 'GRADUATE OF BUS. ADMINISTRATION', enabled: true, id: 19 },
                        { name: 'GRADUATE OF COOKING FOOD & BEVERAGE', enabled: true, id: 20 },
                        { name: 'VOC. GRAD OF COMPUTER SYSTEM TECH.', enabled: true, id: 21 },
                        { name: 'BS MANAGEMENT GRADUATE', enabled: true, id: 22 },
                        { name: 'REFLEXOLOGY GRADUATE ', enabled: true, id: 23 },
                        { name: 'VOCATIONAL GRADUATE', enabled: true, id: 24 },
                        { name: 'UNDERGRADUATE OF COMMERCE', enabled: true, id: 25 },
                        { name: 'GRADUATE OF FINANCE', enabled: true, id: 26 },
                        { name: 'COLLEGE LEVEL', enabled: true, id: 27 },
                        { name: 'UNDERGRADUATE HIGH SCHOOOL', enabled: true, id: 28 },
                        { name: 'UNDERGRADUATE AGRICULTURE', enabled: true, id: 29 },
                        { name: 'UNDERGRADUATE COLLEGE', enabled: true, id: 30 },
                        { name: 'UNDER GRADUATE', enabled: true, id: 31 },
                        { name: 'GRADUATE', enabled: true, id: 32 },
                        { name: 'COMPUTER SECRETARIAL', enabled: true, id: 33 },
                        { name: 'COMPUTER SCIENCE ', enabled: true, id: 34 },
                        { name: 'UNDERGARADUATE', enabled: true, id: 35 },
                        { name: 'UNDERGRADUATE', enabled: true, id: 36 },
                        { name: 'COLLEGE GRADUATE', enabled: true, id: 37 },
                        { name: 'UNDERGTADUATE', enabled: true, id: 38 },
                        { name: 'HIGH  SCHOOL GRADUATE', enabled: true, id: 39 },
                        { name: 'ELEMENTATY GRADUATE', enabled: true, id: 40 },
                        { name: 'HIGH SCHOOL GRADDUATE', enabled: true, id: 41 },
                        { name: 'GRADUTE', enabled: true, id: 42 },
                        { name: 'COLLEGE UNDERGRADUATE', enabled: true, id: 43 },
                        { name: 'PRACTICAL NURSING', enabled: true, id: 44 },
                        { name: 'FOOD TECHNOLOGY GRADUATE', enabled: true, id: 45 },
                        { name: 'BS BURSING', enabled: true, id: 46 },
                        { name: 'COMPUTER TECHNOLOGY', enabled: true, id: 47 },
                        { name: 'BS ADMINSTRATION', enabled: true, id: 48 },
                        { name: '0', enabled: true, id: 49 },
                        { name: 'ELEMEMTARY GRADUATE', enabled: true, id: 50 },
                        { name: 'VOCATIONAL UNDERGRADUATE', enabled: true, id: 51 },
                        { name: 'COMMUTER SECRETARIAL', enabled: true, id: 52 },
                        { name: 'ELEMETARY SCHOOL', enabled: true, id: 53 },
                        { name: 'NURSING VOCATIONAL GRADUATE', enabled: true, id: 54 },
                        { name: 'COLEGE LEVEL', enabled: true, id: 55 },
                        { name: 'ELEMENTARY GARDUATE', enabled: true, id: 56 },
                        { name: 'HIG SCHOOL GRADUATE', enabled: true, id: 57 },
                        { name: 'BS NURSING GRADUATE', enabled: true, id: 58 },
                        { name: 'ELEMENTARY SCHOOL', enabled: true, id: 59 },
                        { name: 'ELEM GRADUATE', enabled: true, id: 60 },
                        { name: 'VOCATIONALGRADUATE', enabled: true, id: 61 },
                        { name: 'ELEMENATRTY', enabled: true, id: 62 },
                        { name: 'COLLEGE UNDERGARDUATE', enabled: true, id: 63 },
                        { name: 'O', enabled: true, id: 64 },
                        { name: 'HIGH SCHOOL GRADAUTE', enabled: true, id: 65 },
                        { name: 'BS BUSINESS ADMINISTRATION', enabled: true, id: 66 },
                        { name: 'BS COMPUTER SCIENCE', enabled: true, id: 67 },
                        { name: 'MIDWIFERY', enabled: true, id: 68 },
                        { name: 'COLLEGE UNDEGRADUATE', enabled: true, id: 69 },
                        { name: 'HIGH SCHOOL UNDERGRADUATE', enabled: true, id: 70 },
                        { name: 'HIGH SCHOOL ', enabled: true, id: 71 },
                        { name: 'COLLEGE LEVEL;', enabled: true, id: 72 },
                        { name: 'HIGH SCHOOL RADUATE', enabled: true, id: 73 },
                        { name: 'HIGHSCHOOL GRADUATE', enabled: true, id: 74 },
                        { name: 'VOCALTIONAL GRADUATE', enabled: true, id: 75 },
                        { name: 'ELEMENTARY RADUATE', enabled: true, id: 76 },
                        { name: 'ELEMETARY GRADUATE', enabled: true, id: 77 },
                        { name: 'HIGH SCHOLL ', enabled: true, id: 78 },
                        { name: 'COLLEG UNDERGRADUATE', enabled: true, id: 79 },
                        { name: 'HIGH SCHOOL, GRADUATE', enabled: true, id: 80 },
                        { name: 'ELELEMENTARY GRADUATE', enabled: true, id: 81 },
                        { name: 'ELELEMANTARY GRADUATE ', enabled: true, id: 82 },
                        { name: 'TESDA GRADUATE', enabled: true, id: 83 },
                        { name: 'ELELEMNTARY GRADUATE', enabled: true, id: 84 },
                        { name: 'HIGH SCHOOLGRADUATE', enabled: true, id: 85 }
                      ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE academic_degrees_id_seq RESTART 86;')