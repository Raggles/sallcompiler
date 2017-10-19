call setenv.bat
cd au\com\invensys\scada\syscfg
"%jd%\javac" *.java
cd ..\..\..\..\..\
"%jd%\jar" cvfe SallDLL.jar au.com.invensys.scada.syscfg.SallDLL au\com\invensys\scada\syscfg\SallDLL.class
