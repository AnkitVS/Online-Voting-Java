# Use the official Tomcat base image
FROM tomcat:9.0-jdk11

# Copy the WAR file to Tomcat's webapps directory
COPY target/OnlineVotingApp.war /usr/local/tomcat/webapps/

# Expose the port Tomcat is running on
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]