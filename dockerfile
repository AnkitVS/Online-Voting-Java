FROM openjdk:11-alpine

# Copy the project files to the container
COPY target/Online-Voting-Java.war /usr/local/tomcat/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Set the environment variable for Tomcat
ENV CATALINA_HOME /usr/local/tomcat

# Run Tomcat
CMD ["catalina.sh", "run"]
