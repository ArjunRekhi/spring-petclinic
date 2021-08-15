FROM openjdk:8
RUN mkdir spring-petclinic
COPY .  spring-petclinic/
WORKDIR spring-petclinic
RUN ./mvnw package
RUN ["sh","script.sh"]
CMD java -jar /spring-petclinic/target/*.jar
