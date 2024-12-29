-- Update ad_system
UPDATE ad_system SET lastbuildinfo = '0.0.0', name = 'MyApp', supportemail = 'support@local.corp', isautoerrorreport = 'N' WHERE ad_system_id = 0;

-- Setup Application Info
---- APPLICATION_MAIN_VERSION
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999999, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'APPLICATION_MAIN_VERSION', '0.0.0', 'Application Main Version', 'D', 'S', 'c44e2ee5-68b5-46cb-adef-98fb3511269c');
---- APPLICATION_IMPLEMENTATION_VENDOR
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999998, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'APPLICATION_IMPLEMENTATION_VENDOR', 'MyApp', 'MyApp Implementation', 'D', 'S', '811c8b1f-544a-483f-a4bf-b281490e1b72');
---- Default PDF_FONT_DIR
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999997, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'PDF_FONT_DIR', '/opt/appserver/data/fonts', 'Fonts folder for embedded in PDF', 'D', 'S', '15397028-7cdb-4e82-be8c-56360e2513cf');
---- Default ZK_LOGO_LARGE
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999996, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'ZK_LOGO_LARGE', '~./theme/iceblue_c/images/myapp-large-logo.png', '', 'D', 'S', '3ec52b05-7eba-43b8-82af-0e7ccb74a9f0');
---- Default ZK_LOGO_SMALL
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999995, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'ZK_LOGO_SMALL', '~./theme/iceblue_c/images/myapp-small-logo.png', '', 'D', 'S', 'ded50c14-f918-4b18-9726-dc01f71800c1');
---- Default ZK_BROWSER_ICON
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999994, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'ZK_BROWSER_ICON', '~./theme/iceblue_c/images/myapp-icon.png', '', 'D', 'S', '9d2fc4f3-d7d4-418c-b4f6-7c6a0b2afe78');
---- Default ZK_BROWSER_TITLE
INSERT INTO ad_sysconfig(
	ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu)
	VALUES (999993, 0, 0, '2020-01-01', '2020-01-01', 100, 100, 'Y', 'ZK_BROWSER_TITLE', 'My App ...', '', 'D', 'S', '1382a711-2e5a-4c85-8ca7-20ac67c42abc');

-- Setup User
---- Reset for System Level User
UPDATE ad_user SET password = uuid_generate_v4() WHERE ad_user_id = 10; 
UPDATE ad_user SET email = 'superuser@local.corp', notificationtype = 'N' WHERE ad_user_id = 100;
---- Reset for GardenWorld User
UPDATE ad_user SET password = uuid_generate_v4() WHERE ad_client_id IN (11);

-- Setup AD_SYSCONFIG
---- USE_EMAIL_FOR_LOGIN to Y
UPDATE ad_sysconfig SET value = 'Y' WHERE name = 'USE_EMAIL_FOR_LOGIN';
---- ALogin_ShowDate to N
UPDATE ad_sysconfig SET value = 'N' WHERE name = 'ALogin_ShowDate';
---- ZK_PAGING_SIZE to 100
UPDATE ad_sysconfig SET value = 100 WHERE name = 'ZK_PAGING_SIZE';
---- ZK_PAGING_DETAIL_SIZE to 100
UPDATE ad_sysconfig SET value = 100 WHERE name = 'ZK_PAGING_DETAIL_SIZE';
---- ZK_THEME_USE_FONT_ICON_FOR_IMAGE (Y - Use css font icon instead of image for button, toolbar button and menu)
UPDATE ad_sysconfig SET Value = 'Y' WHERE name = 'ZK_THEME_USE_FONT_ICON_FOR_IMAGE';
---- ZK_MAX_UPLOAD_SIZE to 20m
UPDATE ad_sysconfig SET value = 20480 WHERE name = 'ZK_MAX_UPLOAD_SIZE';
---- ZK_GRID_AFTER_FIND
UPDATE ad_sysconfig SET value = 'Y' WHERE name = 'ZK_GRID_AFTER_FIND';
---- LOGIN_SHOW_RESETPASSWORD
UPDATE ad_sysconfig SET value = 'N' WHERE name = 'LOGIN_SHOW_RESETPASSWORD';
---- START_VALUE_BPLOCATION_NAME
UPDATE ad_sysconfig SET value = '3' WHERE name = 'START_VALUE_BPLOCATION_NAME';

-- Desktop/Window/Toolbar Customization
---- Window - Help
UPDATE ad_toolbarbutton SET seqno = 999 WHERE ad_toolbarbutton_id = 200030;
---- Disable Dashboard Content : Donate
UPDATE PA_DashboardContent SET IsActive = 'N' WHERE PA_DashboardContent_ID=200005;

-- Setup Processor
---- UPDATE c_acctprocessor SET isactive = 'N';
---- UPDATE r_requestprocessor SET isactive = 'N';
---- UPDATE ad_alertprocessor SET isactive = 'N';
---- UPDATE ad_workflowprocessor SET isactive = 'N';

-- Setup Alert Job / Scheduler Job
---- UPDATE ad_alert SET isactive = 'N';
---- UPDATE ad_scheduler SET isactive = 'N';
---- UPDATE ad_schedule SET isactive = 'N';

-- Setup Country/Language/Currency
UPDATE c_country SET isactive = 'N' WHERE countrycode NOT IN ('CN', 'US');
UPDATE c_currency SET isactive = 'N';
UPDATE c_currency SET isactive = 'Y' WHERE iso_code='CNY' OR iso_code='USD' OR iso_code='EUR';
UPDATE ad_language SET isactive = 'N', issystemlanguage = 'N' WHERE ad_language NOT IN ('zh_CN', 'en_US');
UPDATE ad_language SET issystemlanguage = 'Y', isloginlocale = 'Y' WHERE ad_language IN ('zh_CN');
-- Add new base-language xx_XX
INSERT INTO ad_language(
	ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, languageiso, countrycode, isbaselanguage, issystemlanguage, processing, ad_language_id, isdecimalpoint, datepattern, timepattern, ad_language_uu, isloginlocale, ad_printpaper_id, printname)
	VALUES ('xx_XX', 0, 0, 'Y', now(), 0, now(), 0, 'xx_XX', 'xx', 'XX', 'N', 'N', null, 999, null, null, null, '04fff461-7ef4-4fc2-8aa9-521011870caf', 'N', null, 'xx_XX');

-- Others
---- Sets the size of the SQL Statement field to 20.000 characters. It allows to apply big view statements with a 2Pack file.
ALTER TABLE ad_package_exp_detail ALTER COLUMN sqlstatement TYPE varchar(20000);
UPDATE ad_column SET fieldlength = 20000 WHERE  AD_Column_UU='7491d9c1-7e9e-4f87-897c-b8792a3c48e8';

-- Register SQL
SELECT register_migration_script('209901010000_Z000_Init.sql') FROM dual;
