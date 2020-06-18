col name for a30 
	show parameter db_recovery
	show parameter db_flashback_retention_target
	

SELECT name, round(space_limit/1024/1024/1024,2) AS quota, 
	 round(space_used/1024/1024/1024,2) AS used, 
	 round(space_reclaimable/1024/1024/1024,2) AS reclaimable, 
	 number_of_files AS files 
	 FROM v$recovery_file_dest ; 

select * from v$recovery_area_usage; 	 
	select flashback_on from v$database; 


