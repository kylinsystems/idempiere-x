set JAVA_HOME=C:\Program Files\Java\jdk-17
set PATH=%JAVA_HOME%\bin;%PATH%

mvn --offline -DforceContextQualifier=latest -Didempiere-karaf.version=13.0.0.latest clean verify

pause
