Religion.create([
                  { enabled: true, id: 1, name: 'N/A' },
                  { enabled: true, id: 2, name: 'Roman Catholic' },
                  { enabled: true, id: 3, name: 'Christian' },
                  { enabled: true, id: 4, name: 'Jehova\'s Witness' },
                  { enabled: true, id: 5, name: 'Protestant' },
                  { enabled: true, id: 6, name: 'Dating Daan' },
                  { enabled: true, id: 7, name: 'Born Again' },
                  { enabled: true, id: 8, name: 'Islam' },
                  { enabled: true, id: 9, name: 'Evangelical' },
                  { enabled: true, id: 10, name: 'Iglesia ni Cristo' },
                  { enabled: true, id: 11, name: 'CATHOLIC' },
                  { enabled: true, id: 12, name: 'ROMAN CHATOLIC' },
                  { enabled: true, id: 13, name: 'ROMANA CATHOLIC' },
                  { enabled: true, id: 14, name: 'ROMAN CARHOLIC' },
                  { enabled: true, id: 15, name: 'ROMAN CATH' },
                  { enabled: true, id: 16, name: 'AGLIPAYAN' },
                  { enabled: true, id: 17, name: 'BAPTIS' },
                  { enabled: true, id: 18, name: 'BORN AGAIN CHRISTIAN' },
                  { enabled: true, id: 19, name: 'ROM AN CATHOLIC' },
                  { enabled: true, id: 20, name: 'PENTECOST' },
                  { enabled: true, id: 21, name: 'IGLESIA NG DIOS' },
                  { enabled: true, id: 22, name: 'ANGLICAN' },
                  { enabled: true, id: 23, name: 'AGLIPAY' },
                  { enabled: true, id: 24, name: 'IGLESIA NI KRISTO' },
                  { enabled: true, id: 25, name: 'JCMC' },
                  { enabled: true, id: 26, name: 'BAPTIST' },
                  { enabled: true, id: 27, name: 'PIC' },
                  { enabled: true, id: 28, name: 'I.N.C' },
                  { enabled: true, id: 29, name: 'ASSEMBLY OF GOD' },
                  { enabled: true, id: 30, name: 'CHURCH OF GOD' },
                  { enabled: true, id: 31, name: 'LATTER DAY SAINT' },
                  { enabled: true, id: 32, name: 'ADVENTIST' },
                  { enabled: true, id: 33, name: 'METHODIST' },
                  { enabled: true, id: 34, name: 'MCGI' },
                  { enabled: true, id: 35, name: 'JEHOVAS WITNESS' },
                  { enabled: true, id: 36, name: 'UNITED PENTICOSTAL CHURCH' },
                  { enabled: true, id: 37, name: 'LUTHERAN' },
                  { enabled: true, id: 38, name: 'SEVENT DAY ADVENTIST' },
                  { enabled: true, id: 39, name: 'PENTECOSTAL CHRISTIAN' },
                  { enabled: true, id: 40, name: 'HOLY PLACE INTERNATIONAL MINISTRY' },
                  { enabled: true, id: 41, name: 'UCEP' },
                  { enabled: true, id: 42, name: 'GRACE GOSPEL' },
                  { enabled: true, id: 43, name: 'RIC' },
                  { enabled: true, id: 44, name: 'CHURCH OF CHRIST' },
                  { enabled: true, id: 45, name: 'BIBLE BAPTIST CHURCH' },
                  { enabled: true, id: 46, name: 'PICC' },
                  { enabled: true, id: 47, name: 'IGLESI NI KRISTO' },
                  { enabled: true, id: 48, name: 'CHATOLIC' },
                  { enabled: true, id: 49, name: 'MORMON' },
                  { enabled: true, id: 50, name: 'JEHOVAH\'S WITNESESS' },
                  { enabled: true, id: 51, name: 'INDEPENDIENTE' },
                  { enabled: true, id: 52, name: 'SEVENTH DAY ADVENTIST' },
                  { enabled: true, id: 53, name: 'PENTECOSTAL' },
                  { enabled: true, id: 54, name: 'THE LORD\'S RECOVERY' },
                  { enabled: true, id: 55, name: '(KRISTOHANON) THE LORD\'S RECOVERY' },
                  { enabled: true, id: 56, name: 'SINGLE' },
                  { enabled: true, id: 57, name: 'ESPIRITISTA' },
                  { enabled: true, id: 58, name: 'UECFI' },
                  { enabled: true, id: 59, name: 'BARTIST' },
                  { enabled: true, id: 60, name: 'ROMANCATHOLIC' },
                  { enabled: true, id: 61, name: 'PHIL IND' },
                  { enabled: true, id: 62, name: 'JEHOVAH\'S WITNESSES' },
                  { enabled: true, id: 63, name: 'S.D.A' },
                  { enabled: true, id: 64, name: 'SDA' },
                  { enabled: true, id: 65, name: 'WESLEYAN' },
                  { enabled: true, id: 66, name: 'JEHOVA\'S WITNESSES' }
                ])
ActiveRecord::Base.connection.execute('ALTER SEQUENCE religions_id_seq RESTART 67;')
