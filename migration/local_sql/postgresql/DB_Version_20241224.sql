---- Update lastbuildinfo
UPDATE ad_system SET lastbuildinfo = '13.0.0.latest' WHERE ad_system_id = 0;

---- Update APPLICATION_MAIN_VERSION in ad_sysconfig
UPDATE ad_sysconfig SET value = '13.0.0.latest', updated = '2024-12-24' WHERE ad_sysconfig_id = 999999;

---- Register SQL
SELECT register_migration_script('DB_Version_20241224.sql') FROM dual;
