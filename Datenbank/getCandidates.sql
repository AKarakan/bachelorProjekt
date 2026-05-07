drop procedure if exists getCandidates;

Delimiter ;;
Create procedure getCandidates(in inAssignmentID int, in inRadiusKM int)
Begin
	Declare workingSite Varchar(7);
    declare asys JSON;
    declare assPosX float;
    declare assPosY float;
    
    select 	Site, 	Json_extract(AssistenceSystems,'$.Asys'), ST_X(GeoPos), ST_Y(GeoPos)
    into 	workingSite, 		asys,									  assPosX,			assPosY
    from assignment where assignmentID = inAssignmentID;
    
    if (workingSite like 'Remote')
    then
        select distinct t.firstname as vorname, t.SurName as nachname, t.AssistenceSystems as tAsys, ZipCode from tester t
		where (t.WorkingSite = 'Remote' or t.WorkingSite = 'Hybrid')
		and json_overlaps(	asys,    Json_extract(t.AssistenceSystems,'$.Asys'));
        
    elseif (workingSite like 'OnSite')
    then
		select distinct t.firstname as vorname, t.SurName as nachname, t.AssistenceSystems as tAsys, ZipCode from tester t
		where (t.WorkingSite = 'OnSite' or t.WorkingSite = 'Hybrid')
		and json_overlaps(	asys,    Json_extract(t.AssistenceSystems,'$.Asys'))
		and (ST_Distance_Sphere( 
			Point(ST_X(t.GeoPos), ST_Y(t.GeoPos)),
			Point(assPosX, assPosY)
			) < (inRadiusKM * 1000));
            
	else -- Wenn workingSite = 'Hybrid' ist dann alle abrufen die zu dem assignment passen
		select distinct t.firstname as vorname, t.SurName as nachname, t.AssistenceSystems as tAsys, ZipCode from tester t
		where json_overlaps(	asys,    Json_extract(t.AssistenceSystems,'$.Asys'));
            
	end if;
		
end ;;