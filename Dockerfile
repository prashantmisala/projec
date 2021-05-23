FROM tomcat
RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/conf/tomcat-users.xml
RUN rm -rf /usr/local/tomcat//webapps/manager/META-INF/context.xml
ADD ./tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD ./context.xml /usr/local/tomcat//webapps/manager/META-INF/context.xml
ADD ./*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
