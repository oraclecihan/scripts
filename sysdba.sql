sqlplus / as sysdba
set lines 1000
set pages 200
set colsep |
set underline on
set heading on
set time on
set timing on
col host_name for a40
col value for a80
col FORCE_LOGGING for a20
alter session set nls_date_format = 'dd.mm.yyyy hh24:mi:ss';
select inst_id,instance_name,host_name,to_char(sysdate,'dd.mm.yyyy hh24:mi') tarih,to_char(startup_time,'dd.mm.yyyy hh24:mi') startup,database_status,instance_role,active_state,blocked from gv$instance order by inst_id asc;
select name,open_mode, flashback_on,FORCE_LOGGING,DATABASE_ROLE,PROTECTION_MODE,PROTECTION_LEVEL from v$database;
select value from v$diag_info where name = 'Diag Trace';

