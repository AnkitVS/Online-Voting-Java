FROM tomcat:latest

# Copy the compiled classes from the build directory
COPY build/classes/org/Voting /usr/local/tomcat/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]