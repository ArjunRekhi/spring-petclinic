FROM openjdk:8
RUN mkdir spring-petclinic
COPY .  spring-petclinic/
WORKDIR spring-petclinic
RUN ./mvnw package
CMD java -jar /spring-petclinic/target/*.jar
