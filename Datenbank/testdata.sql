-- Tester:innen testing test daten zum testen der tester:innen tabelle
insert into tester values (null,"Abdu", 'karakan', 'pass', '51103', 'Steinmetzstraße 25', 'abdu.karakan@googlemail.com','0221 123123' ,'https://i.pravatar.cc/400?img=68', '{"Needs": [""]}','{"Asys": ["Hoher Kontrast"]}','OnSite', ST_GeomFromText('POINT(50.94284477264888 7.007675625622846)'));
insert into tester values (null,"Abdu", 'karakan', 'pass', '51103', 'Steinmetzstraße 25', 'abdu.karakan2@googlemail.com','0221 123124' ,'https://i.pravatar.cc/400?img=68', '{"Needs": [""]}','{"Asys": ["Hoher Kontrast", "Brailezeile", "Screen Reader"]}','Hybrid', ST_GeomFromText('POINT(50.94284477264888 7.007675625622846)'));
insert into tester values (null,"Yasha", 'mueller', 'pass', '50679', 'gebrüder-coblenz-straße 10', 'yasham@googlemail.com','0221 999999' ,'https://i.pravatar.cc/400?img=61', '{"Needs": ["Brailezeile"]}','{"Asys": ["Brailezeile","Screen Reader", "Color Inverter", "Zoom"]}','Hybrid', ST_GeomFromText('POINT(50.93139329961169 6.983392396786266)'));
insert into tester values (null,"Sabine", 'Kuxdorf', 'pass', '50679', 'gebrüder-coblenz-straße 10', 'Sabine@googlemail.com','0221 000000' ,'https://i.pravatar.cc/400?img=49', '{"Needs": ["Brailezeile", "Abholung"]}','{"Asys": ["Brailezeile"]}','Remote', ST_GeomFromText('POINT(50.93139329961169 6.983392396786266)'));
insert into tester values (null,"Sabine2222", 'Kuxdorf', 'pass', '50679', 'gebrüder-coblenz-straße 10', 'Sabine2@googlemail.com','0221 000001' ,'https://i.pravatar.cc/400?img=49', '{"Needs": ["Brailezeile", "Abholung"]}','{"Asys": ["Brailezeile","Screen Reader"]}','OnSite', ST_GeomFromText('POINT(50.93139329961169 6.983392396786266)'));
insert into tester values (null,"Sabine3", 'Kuxdorf', 'pass', '50679', 'gebrüder-coblenz-straße 10', 'Sabine3@googlemail.com','0221 000002' ,'https://i.pravatar.cc/400?img=49', '{"Needs": ["Brailezeile", "Abholung"]}','{"Asys": ["Brailezeile"]}','Remote', ST_GeomFromText('POINT(50.93139329961169 6.983392396786266)'));
insert into tester values (null,"Sabine4", 'Kuxdorf', 'pass', '13055', 'Genslerstraße 18', 'Sabine4@googlemail.com','0321 000002' ,'https://i.pravatar.cc/400?img=49', '{"Needs": ["Brailezeile", "Abholung"]}','{"Asys": ["Brailezeile","Zoom"]}','OnSite', ST_GeomFromText('POINT(52.53954100624794 13.498221824778714)'));

insert into client values (null, 'rails love', 'client pass', 'eine firma welches rails liebt', 'https://i.pravatar.cc/400?img=1', 'rails@love.com');
insert into client values (null, 'Mercedes Benz', 'client pass', 'Mercedes Benz halt', 'https://i.pravatar.cc/400?img=2', 'Mercedes@Benz.com');
insert into client values (null, 'Abdus Geile Firma', 'client pass', 'eine firma Von Abdurrahman Karakan', 'https://i.pravatar.cc/400?img=3', 'abdu@Karakan.com');

insert into assignment values(null,        '1',        'Arcaden Test titel',        'Ein Test bei in den Kölner Arcaden.',   
     'Remote',        '51103',        'Kalker Hauptstraße 55',        '55.55',        '10',        '{"Asys":["Brailezeile"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(50.93926871149934 6.9978738652859995)'));

insert into assignment values(null,        '2',        'TH Köln Campus Deutz Test titel',        'Ein Test zum in der TH in Deutz',   
     'Hybrid',        '50679',        'Betzdorfer Straße 2',        '55.55',        '10',        '{"Asys":["Special Keyboard"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(50.93378788278587 6.988655659214306)'));

insert into assignment values(null,        '3',        'Dom Test titel',        'Ein Test im Dom',   
     'OnSite',        '50667',        'Domkloster 4',        '55.55',        '10',        '{"Asys":["Screen Reader","Hoher Kontrast"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(50.94152594317213 6.9584503739639265)'));
-----
insert into assignment values(null,        '1',        'Brandenburger Tor Test titel',        'Ein Test im Brandenburger Tor.',   
     'OnSite',        '10117',        'Pariser Platz',        '55.55',        '10',        '{"Asys":["Color Inverter","Zoom"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(52.51741259514561 13.377783128824055)'));

insert into assignment values(null,        '2',        'Berliner Mauer Test titel',        'Ein Test an der Berliner Mauer.',   
     'Remote',        '10243',        'Mühlenstraße',        '55.55',        '10',        '{"Asys":["Brailezeile"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(52.50532751520173 13.440342205908983)'));

insert into assignment values(null,        '3',        'Berliner Zoo Test titel',        'Ein Test im Berliner Zoo.',   
     'Hybrid',        '10787',        'Hardenbergpl. 8',        '55.55',        '10',        '{"Asys":["Special Keyboard"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(52.509123022048406 13.339799270433337)'));
-------
insert into assignment values(null,        '1',        'Little Tokyo Düsseldorf Test titel',        'Ein Test in Little Tokyo in Düsseldorf',   
     'Hybrid',        '40210',        'Immermannstraße',        '55.55',        '10',        '{"Asys":["Screen Reader","Hoher Kontrast"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(51.22380320123876 6.788030174112146)'));
        
insert into assignment values(null,        '1',        'EKO-Haus der Japanischen Kultur eV Test titel',        'Ein Test im EKO-Haus der Japanischen Kultur eV',   
     'OnSite',        '40547',        'Brüggener Weg 6',        '55.55',        '10',        '{"Asys":["Color Inverter","Zoom"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(51.240200506045376 6.7455599726873565)'));
------
insert into assignment values(null,        '1',        'GÖthe-Museum Düsseldorf Test titel',        'Ein Test im GÖthe-Museum in Düsseldorf',   
     'Remote',        '40211',        'Jacobistraße 2',        '55.55',        '10',        '{"Asys":["Brailezeile"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(51.231300750614075 6.7878087311004185)'));

insert into assignment values(null,        '2',        'Forum Gummersbach Test titel',        'Ein Test im Forum Gummersbach',   
     'Hybrid',        '51643',        'Steinmüllerallee 5',        '55.55',        '10',        '{"Asys":["Special Keyboard"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(51.024950798437814 7.565546299823153)'));

insert into assignment values(null,        '3',        'TH Köln Campus Gummersbach Test titel',        'Ein Test in der Th am Campus Gummersbach.',   
     'OnSite',        '51643',        'Steinmüllerallee 1',        '55.55',        '10',        '{"Asys":["Screen Reader","Hoher Kontrast"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(51.02329720656926 7.562929923644446)'));
        
insert into assignment values(null,        '1',        'HAO China Restaurant Test titel',        'Ein Test im HAO China Restaurant',   
     'Remote',        '51643',        'Robertstraße 2',        '55.55',        '10',        '{"Asys":["Color Inverter","Zoom"]}',   
        '{"ReqNeeds":["Elevator"]}',        'Active',        NOW(),        ADDDATE(NOW(),7),        ADDDATE(NOW(),30),        ADDDATE(NOW(),35), ST_GeomFromText('POINT(51.02960919824218 7.556965395404999)'));