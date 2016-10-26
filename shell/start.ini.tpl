#===========================================================
# Jetty start.jar arguments
# Each line of this file is prepended to the command line 
# arguments # of a call to:
#    java -jar start.jar [arg...]
#===========================================================



#===========================================================
# If the arguements in this file include JVM arguments 
# (eg -Xmx512m) or JVM System properties (eg com.sun.???),
# then these will not take affect unless the --exec 
# parameter is included or if the output from --dry-run
# is executed like:
#   eval $(java -jar start.jar --dry-run)
#
# Below are some recommended options for Sun's JRE
#-----------------------------------------------------------
# --exec
# -Dcom.sun.management.jmxremote
# -Dorg.eclipse.jetty.util.log.IGNORED=true
# -Dorg.eclipse.jetty.util.log.stderr.DEBUG=true
# -Dorg.eclipse.jetty.util.log.stderr.SOURCE=true
# -Xmx2000m
# -Xmn512m
# -verbose:gc
# -XX:+PrintGCDateStamps
# -XX:+PrintGCTimeStamps
# -XX:+PrintGCDetails
# -XX:+PrintTenuringDistribution
# -XX:+PrintCommandLineFlags
# -XX:+DisableExplicitGC
# -XX:+UseConcMarkSweepGC
# -XX:ParallelCMSThreads=2
# -XX:+CMSClassUnloadingEnabled  
# -XX:+UseCMSCompactAtFullCollection
# -XX:CMSInitiatingOccupancyFraction=80
#-----------------------------------------------------------


#===========================================================
# Start classpath OPTIONS.
# These control what classes are on the classpath
# for a full listing do
#   java -jar start.jar --list-options
#-----------------------------------------------------------
OPTIONS=Server,jsp,jmx,resources,websocket,ext,plus,annotations,jta,jdbc
#-----------------------------------------------------------


#===========================================================
# Configuration files.
# For a full list of available configuration files do
#   java -jar start.jar --help
#-----------------------------------------------------------
${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-jmx.xml
${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty.xml
${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-hightide.xml
# ${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-ssl.xml
# ${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-requestlog.xml
${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-deploy.xml
# ${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-overlay.xml
# ${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-webapps.xml
${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-testrealm.xml
${{JETTY_HOME}}${{file.separator}}etc${{file.separator}}jetty-jaas.xml

${{project.dir}}${{file.separator}}jetty${{file.separator}}etc${{file.separator}}jetty-contexts.xml

#===========================================================