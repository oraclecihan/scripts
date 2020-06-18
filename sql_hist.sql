col begin_interval for a18
col plan_hash format 99999999999

select * from (SELECT   a.snap_id,
     to_char(b.begin_interval_time,'dd.mm.yyyy hh24:mi') begin_interval,
	 a.plan_hash_value plan_hash,
	 BUFFER_GETS_DELTA buf_gets_delta,
	 EXECUTIONS_DELTA execs_delta,
	 TRUNC (buffer_gets_delta / decode(nvl(executions_delta,0),0,1,nvl(executions_delta,1))) gets_per_exec,
	 round (ELAPSED_TIME_DELTA / decode(nvl(executions_delta,0),0,1,nvl(executions_delta,1))/1000000,2) elaps_per_exec,
	 TRUNC (ROWS_PROCESSED_DELTA / decode(nvl(executions_delta,0),0,1,nvl(executions_delta,1))) ROWS_PROC_DELTA
	 FROM   dba_hist_sqlstat a, dba_hist_snapshot b
	 WHERE       a.instance_number = b.instance_number and a.sql_id = '&sql_id'
	     AND a.snap_id = b.snap_id
		 AND EXECUTIONS_DELTA >= 0
		 ORDER BY   a.snap_id desc);

