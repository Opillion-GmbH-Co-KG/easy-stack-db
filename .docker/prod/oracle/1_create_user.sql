ALTER SESSION SET CONTAINER=FREEPDB1;

GRANT CONNECT, DBA, RESOURCE TO admin;

SELECT username, account_status FROM dba_users WHERE username = 'ADMIN';
SELECT NAME, OPEN_MODE FROM V$PDBS;
