CLASS zcl_flight_data_generator_af DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_flight_data_generator_af IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA oall_stat TYPE STANDARD TABLE OF /dmo/oall_stat.
    DATA oall_stat_t TYPE STANDARD TABLE OF /dmo/oall_stat_t.
    DATA book_stat_t TYPE STANDARD TABLE OF /dmo/book_stat_t.
    DATA book_stat TYPE STANDARD TABLE OF /dmo/book_stat.

    DATA customers TYPE STANDARD TABLE OF /dmo/customer.
    DATA agencies TYPE STANDARD TABLE OF /dmo/agency.

    oall_stat = VALUE #(
  ( client = '100' overall_status = 'O'  )
  ( client = '100' overall_status = 'A'  )
  ( client = '100' overall_status = 'X'  )
   ).

    book_stat = VALUE #(
  ( client = '100' booking_status = 'N'  )
  ( client = '100' booking_status = 'B'  )
  ( client = '100' booking_status = 'X'  )
   ).


    oall_stat_t = VALUE #(
  ( client = '100' overall_status = 'O' language = 'E' text = 'Open'  )
  ( client = '100' overall_status = 'A' language = 'E' text = 'Accepted'  )
  ( client = '100' overall_status = 'X' language = 'E' text = 'Rejected'  )
   ).


    book_stat_t = VALUE #(
    ( client = '100' booking_status = 'N' language = 'E' text = 'New'  )
    ( client = '100' booking_status = 'B' language = 'E' text = 'Booked'  )
    ( client = '100' booking_status = 'X' language = 'E' text = 'Canceled'  )
     ).

    agencies = VALUE #(
    ( client = '100' agency_id = '070001' name = 'Sunshine Travel' street = '134 West Street' postal_code = '54323' city = 'Rochester' country_code = 'US' phone_number = '+1 901-632-5620' email_address = 'info@sunshine-travel.sap'
    web_address = 'http://www.sunshine-travel.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
    dummy_field = '' /dmo/zzsloganzag = 'Fast and smooth!'  )
  ( client = '100' agency_id = '070002' name = 'Fly High' street = 'Berliner Allee 11' postal_code = '40880' city = 'Duesseldorf' country_code = 'DE' phone_number = '+49 2102 69555' email_address = 'info@flyhigh.sap' web_address = 'http://www.flyhigh.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Cool and smooth! Fly with us! We are the leader in business!'  )
  ( client = '100' agency_id = '070003' name = 'Happy Hopping' street = 'Calvinstr. 36' postal_code = '13467' city = 'Berlin' country_code = 'DE' phone_number = '+49 30-8853-0' email_address = 'info@haphop.sap' web_address = 'http://www.haphop.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Happy Hopping is the leader in business!'  )
  ( client = '100' agency_id = '070004' name = 'Pink Panther' street = 'Auf der Schanz 54' postal_code = '65936' city = 'Frankfurt' country_code = 'DE' phone_number = '+49 69-467653-0' email_address = 'info@pinkpanther.sap'
  web_address = 'http://www.pinkpanther.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'We are the best!'  )
  ( client = '100' agency_id = '070005' name = 'Your Choice' street = 'Gustav-Jung-Str. 425' postal_code = '90455' city = 'Nuernberg' country_code = 'DE' phone_number = '+49 9256-4548-0' email_address = 'info@yc.sap' web_address = 'http://www.yc.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = '' /dmo/zzsloganzag = 'Better with us!'  )
  ( client = '100' agency_id = '070006' name = 'Bella Italia' street = 'Via Marconi 123' postal_code = '00139' city = 'Roma' country_code = 'IT' phone_number = '+39 6 893546721' email_address = 'info@tours.it/Adventure/'
  web_address = 'http://www.tours.it/Adventure/' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Cool and save!'  )
  ( client = '100' agency_id = '070007' name = 'Hot Socks Travel' street = '224 Balnagask Rd' postal_code = '8053' city = 'Sydney' country_code = 'AU' phone_number = '+61 2 2004 5000' email_address = 'info@hst.co.au' web_address = 'http://www.hst.co.au'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and save! Hot Socks Travel is the best!'  )
  ( client = '100' agency_id = '070008' name = 'Burns Nuclear' street = '14 Science Park Drive' postal_code = '118228' city = 'Singapore' country_code = 'SG' phone_number = '+65 777-5566' email_address = 'info@burns-burns-burns.sg'
  web_address = 'http://www.burns-burns-burns.sg' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Fast and smooth! We are the leader in business!'  )
  ( client = '100' agency_id = '070009' name = 'Honauer Reisen GmbH' street = 'Baumgarten 8' postal_code = '4212' city = 'Neumarkt' country_code = 'AT' phone_number = '+43 7941 8903' email_address = 'info@honauer.at' web_address = 'http://www.honauer.at'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and save! Honauer Reisen GmbH is the best!'  )
  ( client = '100' agency_id = '070010' name = 'Travel from Walldorf' street = 'Altonaer Str. 24' postal_code = '10557' city = 'Berlin' country_code = 'DE' phone_number = '+49 30-622860' email_address = 'info@travel-from-walldorf'
  web_address = 'http://www.travel-from-walldorf' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Fast and smooth! Travel from Walldorf is the leader in business!'  )
  ( client = '100' agency_id = '070011' name = 'Voyager Enterprises' street = 'Gustavslundsvaegen 151' postal_code = '70563' city = 'Stockholm' country_code = 'SE' phone_number = '+46 8/ 587 70000' email_address = 'info@starfleet.ufp'
  web_address = 'http://www.starfleet.ufp' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and smooth!'  )
  ( client = '100' agency_id = '070012' name = 'Ben McCloskey Ltd.' street = '74 Court Oak Rd' postal_code = 'B17 9TN' city = 'Birmingham' country_code = 'GB' phone_number = '+44 121 365-2251' email_address = 'info@ben-mcCloskey.co.uk'
  web_address = 'http://www.ben-mcCloskey.co.uk' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Cool and smooth! Fly with the leader in business!'  )
  ( client = '100' agency_id = '070013' name = 'Pillepalle Trips' street = 'Gorki Park 4' postal_code = '8008' city = 'Zuerich' country_code = 'CH' phone_number = '+41 1 345-5321' email_address = 'info@pi-pa-tri.sap'
  web_address = 'http://www.pi-pa-tri.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Cool and save! Pillepalle Trips is the leader in business!'  )
  ( client = '100' agency_id = '070014' name = 'Kangeroos' street = 'Lancaster drive 435' postal_code = '20001' city = 'London' country_code = 'GB' phone_number = '+44 171-2937638' email_address = 'info@hopp.sap' web_address = 'http://www.hopp.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Better with us! We are the best!'  )
  ( client = '100' agency_id = '070015' name = 'Bavarian Castle' street = 'Pilnizerstr. 241' postal_code = '01069' city = 'Dresden' country_code = 'DE' phone_number = '+49 98-32832732' email_address = 'info@neu.schwanstein.sap'
  web_address = 'http://www.neu.schwanstein.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Fly with us! We are the best!'  )
  ( client = '100' agency_id = '070016' name = 'Ali''s Bazar' street = '45, Mac Arthur Boulevard' postal_code = '19113' city = 'Boston' country_code = 'US' phone_number = '+1 508-692-5200' email_address = 'info@ali.sap' web_address = 'http://www.ali.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Better with Ali''s Bazar! We are the leader in business!'  )
  ( client = '100' agency_id = '070017' name = 'Super Agency' street = '50 Cranworth St' postal_code = 'G12 8AG' city = 'Glasgow' country_code = 'GB' phone_number = '+44 141 711-5643' email_address = 'info@super.sap' web_address = 'http://www.super.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Super Agency is the best!'  )
  ( client = '100' agency_id = '070018' name = 'Wang Chong' street = 'Gagarine Park' postal_code = '150021' city = 'Moscow' country_code = 'RU' phone_number = '+7 3287-213321' email_address = 'info@wang.chong.sap' web_address = 'http://www.wang.chong.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = '' /dmo/zzsloganzag = 'Fast and save!'  )
  ( client = '100' agency_id = '070019' name = 'Around the World' street = 'An der Breiten Wiese 122' postal_code = '30625' city = 'Hannover' country_code = 'DE' phone_number = '+49 511-347589-0' email_address = 'info@atw.sap'
  web_address = 'http://www.atw.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fly with us!'  )
  ( client = '100' agency_id = '070020' name = 'No Return' street = 'Wahnheider Str. 57' postal_code = '51105' city = 'Koeln' country_code = 'DE' phone_number = '+49 221-5689-100' email_address = 'info@bye-bye.sap' web_address = 'http://www.bye-bye.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'No Return is the leader in business!'  )
  ( client = '100' agency_id = '070021' name = 'Special Agency Peru' street = 'Triberger Str. 42' postal_code = '70569' city = 'Stuttgart' country_code = 'DE' phone_number = '+49 711-7100' email_address = 'info@sap.com' web_address = 'http://www.sap.com'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = '' /dmo/zzsloganzag = 'We are the best!'  )
  ( client = '100' agency_id = '070022' name = 'Caribian Dreams' street = 'Deichstrasse 45' postal_code = '26721' city = 'Emden' country_code = 'DE' phone_number = '+49 2670-8560-0' email_address = 'info@cuba-libre.sap'
  web_address = 'http://www.cuba-libre.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Cool and save! Caribian Dreams is the best!'  )
  ( client = '100' agency_id = '070023' name = 'Asia By Plane' street = '6-9 Iidabashi 7-chome' postal_code = '102-0072' city = 'Tokyo' country_code = 'JP' phone_number = '+81 3-3239-3501' email_address = 'info@asia-by-plane.co.jp'
  web_address = 'http://www.asia-by-plane.co.jp' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'We are the best!'  )
  ( client = '100' agency_id = '070024' name = 'Everywhere' street = 'Regensburger Platz 23' postal_code = '81679' city = 'Muenchen' country_code = 'DE' phone_number = '+49 89-2499239' email_address = 'info@everywhere.sap'
  web_address = 'http://www.everywhere.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'We are the leader in business!'  )
  ( client = '100' agency_id = '070025' name = 'Happy Holiday' street = 'Rastenburger Str. 12' postal_code = '28779' city = 'Bremen' country_code = 'DE' phone_number = '+49 3266-288817' email_address = 'info@haphol.sap'
  web_address = 'http://www.haphol.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fly with Happy Holiday! We are the best!'  )
  ( client = '100' agency_id = '070026' name = 'No Name' street = 'Schwalbenweg 43' postal_code = '52078' city = 'Aachen' country_code = 'DE' phone_number = '+49 241-77729' email_address = 'info@nn.sap' web_address = 'http://www.nn.sap' attachment = ''
  mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = '' /dmo/zzsloganzag = 'Cool and save! We are the best!'  )
  ( client = '100' agency_id = '070027' name = 'Fly Low' street = 'Chemnitzer Str. 42' postal_code = '01187' city = 'Dresden' country_code = 'DE' phone_number = '+49 351-5423-00' email_address = 'info@fly-low.sap' web_address = 'http://www.fly-low.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Better with the leader in business!'  )
  ( client = '100' agency_id = '070028' name = 'Aussie Travel' street = 'Queens Road' postal_code = 'M8 7RYP' city = 'Manchester' country_code = 'GB' phone_number = '+44 161 2052000' email_address = 'info@down-under.sap'
  web_address = 'http://www.down-under.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and save! Aussie Travel is the best!'  )
  ( client = '100' agency_id = '070029' name = 'Up ''n'' Away' street = 'Nackenbergerstr. 92' postal_code = '30625' city = 'Hannover' country_code = 'DE' phone_number = '+49 511 403266-0' email_address = 'info@una.sap' web_address = 'http://www.una.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Better with the leader in business!'  )
  ( client = '100' agency_id = '070030' name = 'Trans World Travel' street = '100 Industrial Drive' postal_code = '60804' city = 'Chicago' country_code = 'US' phone_number = '+1 708-454-8723' email_address = 'info@twt.sap'
  web_address = 'http://www.twt.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and save! Trans World Travel is the best!'  )
  ( client = '100' agency_id = '070031' name = 'Bright Side of Life' street = '340 State Street' postal_code = '30432' city = 'San Francisco' country_code = 'US' phone_number = '+1 415-454-9877' email_address = 'info@ruebennase.sap'
  web_address = 'http://www.ruebennase.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and save! We are the best!'  )
  ( client = '100' agency_id = '070032' name = 'Sunny, Sunny, Sunny' street = '1300 State Street' postal_code = '19003' city = 'Philadelphia' country_code = 'US' phone_number = '+1 215-090-7659' email_address = 'info@s3.sap'
  web_address = 'http://www.s3.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'We are the leader in business!'  )
  ( client = '100' agency_id = '070033' name = 'Fly & Smile' street = 'Zeppelinstr. 17' postal_code = '60318' city = 'Frankfurt' country_code = 'DE' phone_number = '+49 69-99-0' email_address = 'info@fly-and-smile.sap'
  web_address = 'http://www.fly-and-smile.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Cool and smooth!'  )
  ( client = '100' agency_id = '070034' name = 'Supercheap' street = '1400, Washington Circle' postal_code = '30439' city = 'Los Angeles' country_code = 'US' phone_number = '+1 251-369-2510' email_address = 'info@supercheap.sap'
  web_address = 'http://www.supercheap.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Cool and save! We are the best!'  )
  ( client = '100' agency_id = '070035' name = 'Hitchhiker' street = '21 Rue de Moselle' postal_code = '92132' city = 'Issy-les-Moulineaux' country_code = 'FR' phone_number = '+33 1-405-555-888' email_address = 'info@42.sap'
  web_address = 'http://www.42.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'We are the best!'  )
  ( client = '100' agency_id = '070036' name = 'Fly Now, Pay Later' street = '100 Madison' postal_code = '11012' city = 'New York' country_code = 'US' phone_number = '+1 512 343-8543' email_address = 'info@fn-pl.sap' web_address = 'http://www.fn-pl.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fly with the leader in business!'  )
  ( client = '100' agency_id = '070037' name = 'Real Weird Vacation' street = '949 5th Street' postal_code = 'V6T 1Z4' city = 'Vancouver' country_code = 'CA' phone_number = '+1 604 827-8024' email_address = 'info@reweva.sap'
  web_address = 'http://www.reweva.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'We are the leader in business!'  )
  ( client = '100' agency_id = '070038' name = 'Cap Travels Ltd.' street = '10 Mandela St' postal_code = '2128' city = 'Johannesburg' country_code = 'ZA' phone_number = '+27 11 886-8981' email_address = 'info@cap-travels.co.za'
  web_address = 'http://www.cap-travels.co.za' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Better with Cap Travels Ltd.! We are the leader in business!'  )
  ( client = '100' agency_id = '070039' name = 'Rainy, Stormy, Cloudy' street = 'Lindenstr. 462' postal_code = '70563' city = 'Stuttgart' country_code = 'DE' phone_number = '+49 711-7992-00' email_address = 'info@windy.sap/rsc/'
  web_address = 'http://www.windy.sap/rsc/' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Rainy, Stormy, Cloudy is the best!'  )
  ( client = '100' agency_id = '070040' name = 'Women only' street = 'Kirchstr. 53' postal_code = '55124' city = 'Mainz' country_code = 'DE' phone_number = '+49 6131-543-00' email_address = 'info@women-only.sap' web_address = 'http://www.women-only.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Fast and smooth! We are the best!'  )
  ( client = '100' agency_id = '070041' name = 'Maxitrip' street = 'Flugfeld 17' postal_code = '65128' city = 'Wiesbaden' country_code = 'DE' phone_number = '+49 611-55 66 77' email_address = 'info@maxitrip.sap' web_address = 'http://www.maxitrip.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Better with us! We are the best!'  )
  ( client = '100' agency_id = '070042' name = 'The Ultimate Answer' street = 'Manchester Rd 20' postal_code = 'AB1 1SA' city = 'Avon' country_code = 'GB' phone_number = '+44 934-66799' email_address = 'info@thulan.sap'
  web_address = 'http://www.thulan.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'The Ultimate Answer is the leader in business!'  )
  ( client = '100' agency_id = '070043' name = 'Intertravel' street = 'Michigan Ave' postal_code = '60154' city = 'Chicago' country_code = 'US' phone_number = '+1 788 798-6555' email_address = 'info@intertravel.sap'
  web_address = 'http://www.intertravel.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'We are the best!'  )
  ( client = '100' agency_id = '070044' name = 'Ultimate Goal' street = '300 Peach tree street Sou' postal_code = '01069' city = 'Atlanta' country_code = 'US' phone_number = '+1 874-654-6686' email_address = 'info@ultimate-goal.sap'
  web_address = 'http://www.ultimate-goal.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '
  dummy_field = '' /dmo/zzsloganzag = 'Fly with Ultimate Goal!'  )
  ( client = '100' agency_id = '070045' name = '' street = '20890 East Central Ave' postal_code = '30987' city = 'Palo Alto' country_code = 'US' phone_number = '+1 652 645-5236' email_address = 'info@sar.sap' web_address = 'http://www.sar.sap'
  attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
  /dmo/zzsloganzag = 'Cool and save! Fly with the best!'  )
  ( client = '100' agency_id = '070046' name = 'Hendrik''s' street = '1200 Industrial Drive' postal_code = '60153' city = 'Chicago' country_code = 'US' phone_number = '+1 08-924-9884' email_address = 'info@essen.sap/150596'
 web_address = 'http://www.essen.sap/150596' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
 /dmo/zzsloganzag = 'Fast and smooth!'  )
 ( client = '100' agency_id = '070047' name = 'All British Air Planes' street = '224 Tomato Lane' postal_code = '08965' city = 'Vineland' country_code = 'US' phone_number = '+44 609-896-Moore' email_address = 'info@abap.sap'
 web_address = 'http://www.abap.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
 /dmo/zzsloganzag = 'Fast and save!'  )
 ( client = '100' agency_id = '070048' name = 'Rocky Horror Tours' street = '789 Santa Monica Blvd.' postal_code = '08934' city = 'Santa Monica' country_code = 'US' phone_number = '+1 64351-6455-654' email_address = 'info@frank.furter.sap'
 web_address = 'http://www.frank.furter.sap' attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
 /dmo/zzsloganzag = 'Rocky Horror Tours is the best!'  )
 ( client = '100' agency_id = '070049' name = 'Flights and More' street = '213 Park Blvd.' postal_code = '35515' city = 'Los Walldos' country_code = 'US' phone_number = '+1 646 555-6876' email_address = 'info@fam.sap' web_address = 'http://www.fam.sap'
 attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = ''
 /dmo/zzsloganzag = 'Flights and More is the best!'  )
 ( client = '100' agency_id = '070050' name = 'Not Only By Bike' street = 'Saalburgstr. 765' postal_code = '60385' city = 'Frankfurt' country_code = 'DE' phone_number = '+49 69 465789-0' email_address = 'info@nobb.sap' web_address = 'http://www.nobb.sap'
 attachment = '' mime_type = '' filename = '' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 ' dummy_field = '' /dmo/zzsloganzag = 'Cool and save!'  )
  ).

    customers = VALUE #(
    ( client = '100' customer_id = '000001' first_name = 'Theresia' last_name = 'Buchholm' title = 'Mrs.' street = 'Lerchenstr. 82' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-341-184709'
    email_address = 'theresia.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000002' first_name = 'Johannes' last_name = 'Buchholm' title = 'Mr.' street = 'Muehltalstr. 14' postal_code = '68723' city = 'Schwetzingen' country_code = 'DE' phone_number = '+49-291-299232'
    email_address = 'johannes.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000003' first_name = 'James' last_name = 'Buchholm' title = 'Mr.' street = 'Froschstr. 91' postal_code = '90419' city = 'Nuernberg' country_code = 'DE' phone_number = '+49-601-130850'
    email_address = 'james.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000004' first_name = 'Thomas' last_name = 'Buchholm' title = 'Mr.' street = 'Hauptstr. 84' postal_code = '63263' city = 'Neu-Isenburg' country_code = 'DE' phone_number = '+49-394-339928'
    email_address = 'thomas.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000005' first_name = 'Anna' last_name = 'Buchholm' title = 'Mrs.' street = 'Hasnerstrasse 13' postal_code = '4020' city = 'Linz' country_code = 'AT' phone_number = '+43-957-258037'
    email_address = 'anna.buchholm@flight.example.at' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000006' first_name = 'Uli' last_name = 'Buchholm' title = 'Mrs.' street = 'Caspar-David-Friedrich-Str. 97' postal_code = '75757' city = 'Elsenz' country_code = 'DE' phone_number = '+49-367-156738'
    email_address = 'uli.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000007' first_name = 'Jean-Luc' last_name = 'Buchholm' title = 'Mr.' street = 'Lake Shore Drive 92' postal_code = '22334' city = 'San Francisco' country_code = 'US' phone_number = '+1-848-371606'
    email_address = 'jean-luc.buchholm@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000008' first_name = 'August' last_name = 'Buchholm' title = 'Mr.' street = 'Lerchenstr. 23' postal_code = '64342' city = 'Seeheim-Jugenheim' country_code = 'DE' phone_number = '+49-184-089871'
    email_address = 'august.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000009' first_name = 'Achim' last_name = 'Buchholm' title = 'Mr.' street = 'Stauboernchenstrasse 64' postal_code = '76137' city = 'Karlsruhe' country_code = 'DE' phone_number = '+49-797-976779'
    email_address = 'achim.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000010' first_name = 'Irmtraut' last_name = 'Buchholm' title = 'Mrs.' street = 'Franz-Marc-Str. 31' postal_code = '69207' city = 'Kurt' country_code = 'DE' phone_number = '+49-417-532827'
    email_address = 'irmtraut.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000011' first_name = 'Thilo' last_name = 'Buchholm' title = 'Mr.' street = 'Golden Gate Drive 10' postal_code = '17844' city = 'Washington' country_code = 'US' phone_number = '+1-178-451995'
    email_address = 'thilo.buchholm@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000012' first_name = 'Adam' last_name = 'Buchholm' title = 'Mr.' street = 'Via Giulio Cesare 55' postal_code = '00195' city = 'Roma' country_code = 'IT' phone_number = '+39-599-068501'
    email_address = 'adam.buchholm@flight.example.it' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000013' first_name = 'Christa' last_name = 'Buchholm' title = 'Mrs.' street = 'Zwischergasse 28' postal_code = '64283' city = 'Darmstadt' country_code = 'DE' phone_number = '+49-202-786338'
    email_address = 'christa.buchholm@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000014' first_name = 'Andreas' last_name = 'Vrsic' title = 'Mr.' street = 'Carl-Metz Strasse 19' postal_code = '69190' city = 'Walldorf' country_code = 'DE' phone_number = '+49-290-279097'
    email_address = 'andreas.vrsic@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000015' first_name = 'Adam' last_name = 'Vrsic' title = 'Mr.' street = 'Via Giulio Cesare 55' postal_code = '00195' city = 'Roma' country_code = 'IT' phone_number = '+39-668-295457'
    email_address = 'adam.vrsic@flight.example.it' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000016' first_name = 'Max' last_name = 'Vrsic' title = 'Mr.' street = 'Caspar-David-Friedrich-Str. 100' postal_code = '15344' city = 'Strausberg' country_code = 'DE' phone_number = '+49-182-347044'
    email_address = 'max.vrsic@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000017' first_name = 'Uli' last_name = 'Vrsic' title = 'Mrs.' street = 'Golden Gate Drive 96' postal_code = '63728' city = 'New Orleans' country_code = 'US' phone_number = '+1-877-138602'
    email_address = 'uli.vrsic@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000018' first_name = 'Max' last_name = 'Vrsic' title = 'Mr.' street = 'Rankestr. 100' postal_code = '15344' city = 'Strausberg' country_code = 'DE' phone_number = '+49-778-692286'
    email_address = 'max.vrsic@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000019' first_name = 'Uli' last_name = 'Vrsic' title = 'Mrs.' street = 'Franz-Marc-Str. 97' postal_code = '75757' city = 'Elsenz' country_code = 'DE' phone_number = '+49-444-014771'
    email_address = 'uli.vrsic@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000020' first_name = 'Uli' last_name = 'Jeremias' title = 'Mrs.' street = 'Waldmann 97' postal_code = '75757' city = 'Elsenz' country_code = 'DE' phone_number = '+49-964-656127'
    email_address = 'uli.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000021' first_name = 'Johann' last_name = 'Jeremias' title = 'Mr.' street = 'Elzstrasse 16' postal_code = '68789' city = 'St. Leon-Rot' country_code = 'DE' phone_number = '+49-888-680507'
    email_address = 'johann.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000022' first_name = 'Marta' last_name = 'Jeremias' title = 'Mrs.' street = 'Schillerstr. 73' postal_code = '69180' city = 'Wiesloch' country_code = 'DE' phone_number = '+49-597-642616'
    email_address = 'marta.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000023' first_name = 'Uli' last_name = 'Jeremias' title = 'Mrs.' street = 'Schillerstr. 98' postal_code = '75757' city = 'Elsenz' country_code = 'DE' phone_number = '+49-402-216176'
    email_address = 'uli.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000024' first_name = 'Siegfried' last_name = 'Jeremias' title = 'Mr.' street = 'Karl-Marx-Allee 99' postal_code = '70111' city = 'Reutlingen' country_code = 'DE' phone_number = '+49-327-932455'
    email_address = 'siegfried.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000025' first_name = 'Uli' last_name = 'Jeremias' title = 'Mrs.' street = 'Golden Gate Drive 96' postal_code = '63728' city = 'New Orleans' country_code = 'US' phone_number = '+1-979-397077'
    email_address = 'uli.jeremias@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000026' first_name = 'Andrej' last_name = 'Jeremias' title = 'Mr.' street = 'Hasnerstrasse 11' postal_code = '4020' city = 'Linz' country_code = 'AT' phone_number = '+43-708-350117'
    email_address = 'andrej.jeremias@flight.example.at' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000027' first_name = 'Jean' last_name = 'Jeremias' title = 'Mr.' street = 'Windstone Drive 49' postal_code = '76018' city = 'Arlington' country_code = 'US' phone_number = '+1-507-627802'
    email_address = 'jean.jeremias@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000028' first_name = 'Ruth' last_name = 'Jeremias' title = 'Mrs.' street = 'Akazienweg 80' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-561-068521'
    email_address = 'ruth.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000029' first_name = 'Ruth' last_name = 'Jeremias' title = 'Mrs.' street = 'Gartenstr. 81' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-992-843745'
    email_address = 'ruth.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000030' first_name = 'Holm' last_name = 'Jeremias' title = 'Mr.' street = 'Raupelsweg 30' postal_code = '69207' city = 'Kurt' country_code = 'DE' phone_number = '+49-361-117645'
    email_address = 'holm.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000031' first_name = 'Johannes' last_name = 'Jeremias' title = 'Mr.' street = 'Froschstr. 15' postal_code = '68789' city = 'St. Leon-Rot' country_code = 'DE' phone_number = '+49-379-419386'
    email_address = 'johannes.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000032' first_name = 'Simon' last_name = 'Jeremias' title = 'Mr.' street = 'Rankestr. 1' postal_code = '23496' city = 'Dielheim' country_code = 'DE' phone_number = '+49-565-525925'
    email_address = 'simon.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000033' first_name = 'Walter' last_name = 'Jeremias' title = 'Mr.' street = 'Im Warmet 43' postal_code = '68163' city = 'Mannheim-Lindenhof' country_code = 'DE' phone_number = '+49-560-102459'
    email_address = 'walter.jeremias@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000034' first_name = 'Andrej' last_name = 'Gutenberg' title = 'Mr.' street = 'Hasnerstrasse 12' postal_code = '4020' city = 'Linz' country_code = 'AT' phone_number = '+43-541-295006'
    email_address = 'andrej.gutenberg@flight.example.at' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000035' first_name = 'Jean-Luc' last_name = 'Gutenberg' title = 'Mr.' street = 'Voodoo Avenue 92' postal_code = '22334' city = 'San Francisco' country_code = 'US' phone_number = '+1-724-243193'
    email_address = 'jean-luc.gutenberg@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000036' first_name = 'Allen' last_name = 'Gutenberg' title = 'Mr.' street = 'Golden Gate Drive 64' postal_code = '07666' city = 'Teaneck' country_code = 'US' phone_number = '+1-461-048473'
    email_address = 'allen.gutenberg@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000037' first_name = 'Astrid' last_name = 'Gutenberg' title = 'Mrs.' street = 'Franz-Marc-Str. 80' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-554-155645'
    email_address = 'astrid.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000038' first_name = 'Peter' last_name = 'Gutenberg' title = 'Mr.' street = 'Stauboernchenstrasse 88' postal_code = '16233' city = 'Potsdam' country_code = 'DE' phone_number = '+49-936-608305'
    email_address = 'peter.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000039' first_name = 'Uli' last_name = 'Gutenberg' title = 'Mrs.' street = 'Ausserhalb 96' postal_code = '75757' city = 'Elsenz' country_code = 'DE' phone_number = '+49-727-032302'
    email_address = 'uli.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000040' first_name = 'Cindy' last_name = 'Gutenberg' title = 'Mrs.' street = 'rue Nieuport 51' postal_code = '06130' city = 'Grasse' country_code = 'FR' phone_number = '+33-614-244824'
    email_address = 'cindy.gutenberg@flight.example.fr' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000041' first_name = 'Lee' last_name = 'Gutenberg' title = 'Mr.' street = 'Oak Street 66' postal_code = '07666' city = 'Teaneck' country_code = 'US' phone_number = '+1-777-577758'
    email_address = 'lee.gutenberg@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000042' first_name = 'Ruth' last_name = 'Gutenberg' title = 'Mrs.' street = 'Akazienweg 80' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-253-734727'
    email_address = 'ruth.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000043' first_name = 'Volker' last_name = 'Gutenberg' title = 'Mr.' street = 'Wilhelminentr. 4' postal_code = '86343' city = 'Koenigsbrunn' country_code = 'DE' phone_number = '+49-216-423891'
    email_address = 'volker.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000044' first_name = 'Kurt' last_name = 'Gutenberg' title = 'Mr.' street = 'Gruenlingweg 37' postal_code = '68753' city = 'Amelie' country_code = 'DE' phone_number = '+49-346-339582'
    email_address = 'kurt.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000045' first_name = 'Friedrich' last_name = 'Gutenberg' title = 'Mr.' street = 'Ausserhalb 85' postal_code = '63263' city = 'Neu-Isenburg' country_code = 'DE' phone_number = '+49-929-637659'
    email_address = 'friedrich.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000046' first_name = 'Mathilde' last_name = 'Gutenberg' title = 'Mrs.' street = 'Melissenstr. 22' postal_code = '64342' city = 'Seeheim-Jugenheim' country_code = 'DE' phone_number = '+49-143-043896'
    email_address = 'mathilde.gutenberg@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000047' first_name = 'Benjamin' last_name = 'Gutenberg' title = 'Mr.' street = 'Rue Balzac 94' postal_code = '75839' city = 'Paris' country_code = 'FR' phone_number = '+33-702-290855'
    email_address = 'benjamin.gutenberg@flight.example.fr' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000048' first_name = 'Florian' last_name = 'Fischmann' title = 'Mr.' street = 'Sagamore St. 69' postal_code = '17758' city = 'N. Massapequa' country_code = 'US' phone_number = '+1-402-838641'
    email_address = 'florian.fischmann@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000049' first_name = 'Guillermo' last_name = 'Fischmann' title = 'Mr.' street = 'Lake Shore Drive 68' postal_code = '17758' city = 'N. Massapequa' country_code = 'US' phone_number = '+1-658-201545'
    email_address = 'guillermo.fischmann@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000050' first_name = 'Matthias' last_name = 'Fischmann' title = 'Mr.' street = 'Meerfeldstr. 40' postal_code = '67105' city = 'Schifferstadt' country_code = 'DE' phone_number = '+49-408-391502'
    email_address = 'matthias.fischmann@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000051' first_name = 'Christine' last_name = 'Fischmann' title = 'Mrs.' street = 'Pza. Pablo Ruiz Picasso 76' postal_code = '41006' city = 'Sevilla' country_code = 'ES' phone_number = '+34-575-380123'
    email_address = 'christine.fischmann@flight.example.es' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000052' first_name = 'Salvador' last_name = 'Fischmann' title = 'Mr.' street = 'Camelias 75' postal_code = '08014' city = 'Barcelona' country_code = 'ES' phone_number = '+34-897-813632'
    email_address = 'salvador.fischmann@flight.example.es' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000053' first_name = 'Salvador' last_name = 'Fischmann' title = 'Mr.' street = 'Pza. Pablo Ruiz Picasso 75' postal_code = '08014' city = 'Barcelona' country_code = 'ES' phone_number = '+34-267-608201'
    email_address = 'salvador.fischmann@flight.example.es' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000054' first_name = 'Chantal' last_name = 'Columbo' title = 'Mrs.' street = 'rue Voltaire 48' postal_code = 'B - 1030' city = 'Bruxelles' country_code = 'BE' phone_number = '+32-516-362256'
    email_address = 'chantal.columbo@flight.example.be' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000055' first_name = 'Matthias' last_name = 'Columbo' title = 'Mr.' street = 'Franz-Marc-Str. 40' postal_code = '67105' city = 'Schifferstadt' country_code = 'DE' phone_number = '+49-385-402292'
    email_address = 'matthias.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000056' first_name = 'Walter' last_name = 'Columbo' title = 'Mr.' street = 'Im Warmet 43' postal_code = '68163' city = 'Mannheim-Lindenhof' country_code = 'DE' phone_number = '+49-257-613249'
    email_address = 'walter.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000057' first_name = 'Lee' last_name = 'Columbo' title = 'Mr.' street = 'Oak Street 66' postal_code = '07666' city = 'Teaneck' country_code = 'US' phone_number = '+1-883-722676'
    email_address = 'lee.columbo@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000058' first_name = 'Christoph' last_name = 'Columbo' title = 'Mr.' street = 'Erlengrund 18' postal_code = '69231' city = 'Rauenberg' country_code = 'DE' phone_number = '+49-306-848583'
    email_address = 'christoph.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000059' first_name = 'Christoph' last_name = 'Columbo' title = 'Mr.' street = 'Arndtstrasse 18' postal_code = '69231' city = 'Rauenberg' country_code = 'DE' phone_number = '+49-131-183282'
    email_address = 'christoph.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000060' first_name = 'Holm' last_name = 'Columbo' title = 'Mr.' street = 'Karl-Schwaner-Str. 31' postal_code = '69207' city = 'Kurt' country_code = 'DE' phone_number = '+49-268-164747'
    email_address = 'holm.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000061' first_name = 'Ulla' last_name = 'Columbo' title = 'Mrs.' street = 'Camelias 71' postal_code = '28020' city = 'Madrid' country_code = 'ES' phone_number = '+34-810-781441'
    email_address = 'ulla.columbo@flight.example.es' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000062' first_name = 'Ruth' last_name = 'Columbo' title = 'Mrs.' street = 'Erlengrund 80' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-569-107478'
    email_address = 'ruth.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000063' first_name = 'Volker' last_name = 'Columbo' title = 'Mr.' street = 'Im Warmet 4' postal_code = '86343' city = 'Koenigsbrunn' country_code = 'DE' phone_number = '+49-864-200980'
    email_address = 'volker.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000064' first_name = 'Irmtraut' last_name = 'Columbo' title = 'Mrs.' street = 'Karl-Marx-Allee 32' postal_code = '79104' city = 'Freiburg' country_code = 'DE' phone_number = '+49-435-675969'
    email_address = 'irmtraut.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000065' first_name = 'Christa' last_name = 'Columbo' title = 'Mrs.' street = 'Rankestr. 28' postal_code = '64283' city = 'Darmstadt' country_code = 'DE' phone_number = '+49-576-667502'
    email_address = 'christa.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000066' first_name = 'Peter' last_name = 'Columbo' title = 'Mr.' street = 'Goeckinghofstr. 88' postal_code = '16233' city = 'Potsdam' country_code = 'DE' phone_number = '+49-373-908611'
    email_address = 'peter.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000067' first_name = 'Jasmin' last_name = 'Columbo' title = 'Mrs.' street = 'Zwischergasse 5' postal_code = '86343' city = 'Koenigsbrunn' country_code = 'DE' phone_number = '+49-357-207833'
    email_address = 'jasmin.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000068' first_name = 'Johann' last_name = 'Columbo' title = 'Mr.' street = 'Ausfallstr. 15' postal_code = '68789' city = 'St. Leon-Rot' country_code = 'DE' phone_number = '+49-372-872364'
    email_address = 'johann.columbo@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000069' first_name = 'Thilo' last_name = 'Neubasler' title = 'Mr.' street = 'Sagamore St. 10' postal_code = '17844' city = 'Washington' country_code = 'US' phone_number = '+1-726-883966'
    email_address = 'thilo.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000070' first_name = 'Max' last_name = 'Neubasler' title = 'Mr.' street = 'Ausserhalb 100' postal_code = '15344' city = 'Strausberg' country_code = 'DE' phone_number = '+49-813-577391'
    email_address = 'max.neubasler@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000071' first_name = 'Theresia' last_name = 'Neubasler' title = 'Mrs.' street = 'Sagamore St. 83' postal_code = '60657' city = 'Chicago' country_code = 'US' phone_number = '+1-253-665685'
    email_address = 'theresia.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000072' first_name = 'Theresia' last_name = 'Neubasler' title = 'Mrs.' street = 'Voodoo Avenue 83' postal_code = '60657' city = 'Chicago' country_code = 'US' phone_number = '+1-535-296054'
    email_address = 'theresia.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000073' first_name = 'Florian' last_name = 'Neubasler' title = 'Mr.' street = 'Golden Gate Drive 70' postal_code = '09765' city = 'Boulder' country_code = 'US' phone_number = '+1-335-171043'
    email_address = 'florian.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000074' first_name = 'Anna' last_name = 'Neubasler' title = 'Mrs.' street = 'Hasnerstrasse 13' postal_code = '4020' city = 'Linz' country_code = 'AT' phone_number = '+43-439-079672'
    email_address = 'anna.neubasler@flight.example.at' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000075' first_name = 'Irmtraut' last_name = 'Neubasler' title = 'Mrs.' street = 'Karl-Marx-Allee 32' postal_code = '79104' city = 'Freiburg' country_code = 'DE' phone_number = '+49-535-920873'
    email_address = 'irmtraut.neubasler@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000076' first_name = 'Christine' last_name = 'Neubasler' title = 'Mrs.' street = 'Caspar-David-Friedrich-Str. 77' postal_code = '75305' city = 'Neuenburg' country_code = 'DE' phone_number = '+49-840-161517'
    email_address = 'christine.neubasler@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000077' first_name = 'Hendrik' last_name = 'Neubasler' title = 'Mr.' street = 'Sagamore St. 96' postal_code = '63728' city = 'New Orleans' country_code = 'US' phone_number = '+1-208-624417'
    email_address = 'hendrik.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000078' first_name = 'Jean' last_name = 'Neubasler' title = 'Mr.' street = 'Sagamore St. 50' postal_code = '76018' city = 'Arlington' country_code = 'US' phone_number = '+1-966-548822'
    email_address = 'jean.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000079' first_name = 'Volker' last_name = 'Neubasler' title = 'Mr.' street = 'Zwischergasse 4' postal_code = '86343' city = 'Koenigsbrunn' country_code = 'DE' phone_number = '+49-963-864212'
    email_address = 'volker.neubasler@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000080' first_name = 'Lee' last_name = 'Neubasler' title = 'Mr.' street = 'Voodoo Avenue 67' postal_code = '17758' city = 'N. Massapequa' country_code = 'US' phone_number = '+1-703-543129'
    email_address = 'lee.neubasler@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000081' first_name = 'Sophie' last_name = 'Neubasler' title = 'Mrs.' street = 'Rue Balzac 44' postal_code = '78140' city = 'Vélizy' country_code = 'FR' phone_number = '+33-757-179298'
    email_address = 'sophie.neubasler@flight.example.fr' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000082' first_name = 'Anna' last_name = 'Neubasler' title = 'Mrs.' street = 'Hasnerstrasse 13' postal_code = '4020' city = 'Linz' country_code = 'AT' phone_number = '+43-314-016658'
    email_address = 'anna.neubasler@flight.example.at' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000083' first_name = 'Horst' last_name = 'Neubasler' title = 'Mr.' street = 'Karl-Schwaner-Str. 39' postal_code = '68163' city = 'Mannheim' country_code = 'DE' phone_number = '+49-793-230198'
    email_address = 'horst.neubasler@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000084' first_name = 'Mathilde' last_name = 'Martin' title = 'Mrs.' street = 'Stiftsbogen 22' postal_code = '58332' city = 'Schwelm' country_code = 'DE' phone_number = '+49-538-792547'
    email_address = 'mathilde.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000085' first_name = 'Christine' last_name = 'Martin' title = 'Mrs.' street = 'Elzstrasse 77' postal_code = '75305' city = 'Neuenburg' country_code = 'DE' phone_number = '+49-817-725651'
    email_address = 'christine.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000086' first_name = 'Jasmin' last_name = 'Martin' title = 'Mrs.' street = 'Gruenlingweg 6' postal_code = '86343' city = 'Koenigsbrunn' country_code = 'DE' phone_number = '+49-289-644110'
    email_address = 'jasmin.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000087' first_name = 'Astrid' last_name = 'Martin' title = 'Mrs.' street = 'N7, 80' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-350-851827'
    email_address = 'astrid.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000088' first_name = 'Volker' last_name = 'Martin' title = 'Mr.' street = 'Zwischergasse 4' postal_code = '86343' city = 'Koenigsbrunn' country_code = 'DE' phone_number = '+49-226-572643'
    email_address = 'volker.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000089' first_name = 'Andreas' last_name = 'Martin' title = 'Mr.' street = 'Carl-Metz Strasse 19' postal_code = '69190' city = 'Walldorf' country_code = 'DE' phone_number = '+49-526-056032'
    email_address = 'andreas.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000090' first_name = 'Amelie' last_name = 'Martin' title = 'Mrs.' street = 'Caspar-David-Friedrich-Str. 41' postal_code = '68163' city = 'Mannheim-Lindenhof' country_code = 'DE' phone_number = '+49-730-786042'
    email_address = 'amelie.martin@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000091' first_name = 'Jean' last_name = 'Detemple' title = 'Mr.' street = 'Federal Avenue 49' postal_code = '76018' city = 'Arlington' country_code = 'US' phone_number = '+1-149-196991'
    email_address = 'jean.detemple@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000092' first_name = 'Claire' last_name = 'Detemple' title = 'Mrs.' street = 'rue de Moillebeau 46' postal_code = '1211' city = 'Genève' country_code = 'CH' phone_number = '+41-197-711125'
    email_address = 'claire.detemple@flight.example.ch' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000093' first_name = 'Sophie' last_name = 'Detemple' title = 'Mrs.' street = 'route de Pégomas 45' postal_code = '78140' city = 'Vélizy' country_code = 'FR' phone_number = '+33-413-794457'
    email_address = 'sophie.detemple@flight.example.fr' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000094' first_name = 'Jean' last_name = 'Detemple' title = 'Mr.' street = 'Windstone Drive 49' postal_code = '76018' city = 'Arlington' country_code = 'US' phone_number = '+1-898-378215'
    email_address = 'jean.detemple@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000095' first_name = 'Allen' last_name = 'Detemple' title = 'Mr.' street = '17th St. 65' postal_code = '07666' city = 'Teaneck' country_code = 'US' phone_number = '+1-632-320607'
    email_address = 'allen.detemple@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000096' first_name = 'Astrid' last_name = 'Detemple' title = 'Mrs.' street = 'Alte Reichsstr. 80' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-448-790277'
    email_address = 'astrid.detemple@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000097' first_name = 'Ulla' last_name = 'Detemple' title = 'Mrs.' street = 'Pza. Pablo Ruiz Picasso 71' postal_code = '28020' city = 'Madrid' country_code = 'ES' phone_number = '+34-438-265507'
    email_address = 'ulla.detemple@flight.example.es' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000098' first_name = 'Jean-Luc' last_name = 'Detemple' title = 'Mr.' street = '17th St. 93' postal_code = '22334' city = 'San Francisco' country_code = 'US' phone_number = '+1-756-085031'
    email_address = 'jean-luc.detemple@flight.example.us' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000099' first_name = 'Christine' last_name = 'Detemple' title = 'Mrs.' street = 'Pza. Pablo Ruiz Picasso 76' postal_code = '41006' city = 'Sevilla' country_code = 'ES' phone_number = '+34-262-297947'
    email_address = 'christine.detemple@flight.example.es' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
    ( client = '100' customer_id = '000100' first_name = 'Ruth' last_name = 'Detemple' title = 'Mrs.' street = 'Lerchenstr. 81' postal_code = '71116' city = 'Gaertringen' country_code = 'DE' phone_number = '+49-959-584393'
    email_address = 'ruth.detemple@flight.example.de' local_created_by = '' local_created_at = '0.0000000 ' local_last_changed_by = '' local_last_changed_at = '0.0000000 ' last_changed_at = '0.0000000 '  )
     ).

    DELETE FROM /dmo/oall_stat.
    DELETE FROM /dmo/oall_stat_t.
    DELETE FROM /dmo/book_stat.
    DELETE FROM /dmo/book_stat_t.
    DELETE FROM /dmo/agency.
    DELETE FROM /dmo/customer.
    COMMIT WORK.

    INSERT /dmo/oall_stat   FROM TABLE @( oall_stat ).
    INSERT /dmo/oall_stat_t   FROM TABLE @( oall_stat_t ).
    INSERT /dmo/book_stat   FROM TABLE @( book_stat ).
    INSERT /dmo/book_stat_t   FROM TABLE @( book_stat_t ).
    INSERT /dmo/agency FROM TABLE @( agencies ).
    INSERT /dmo/customer FROM TABLE @( customers ).
    COMMIT WORK.

  ENDMETHOD.
ENDCLASS.
