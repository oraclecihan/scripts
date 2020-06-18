col name for a40
col value for a40
col isdefault for a8
col ismodified for a10
col isset for a10
col hidden for a6
select name, value, isdefault, ismodified, isset,decode(flag,2,'YES','NO') HIDDEN
	from
	(
	select flag,name,value,isdefault,ismodified,
	case when ismodified = 'TRUEFALSE' then 'FALSE' else 'TRUE' end isset 
	from
	   (
	       select 
	            decode(substr(i.ksppinm,1,1),'_',2,1) flag
	            , i.ksppinm name
	            , sv.ksppstvl value
	            , sv.ksppstdf  isdefault
	--            , decode(bitand(sv.ksppstvf,7),1,'MODIFIED',4,'SYSTEM_MOD','FALSE') ismodified
	            , decode(bitand(sv.ksppstvf,7),1,'TRUE',4,'TRUE','FALSE') ismodified
	         from sys.x$ksppi  i
	            , sys.x$ksppsv sv
	        where i.indx = sv.indx
	   )
	)
	where name like lower(nvl('%&parameter%',name))
	order by flag;


