# Build and run a simple Java Hello World program inside a container.
# Java 21 is a long-term release, and the "jdk" image includes the compiler.
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy only the source folder. The compiled classes are created inside the image.
COPY src ./src

# Compile every .java file under src into /app/out
RUN mkdir -p out && javac -d out $(find src -name "*.java")

# Run the program. The last argument is the package name plus the class name.
CMD ["java", "-cp", "out", "helloworld.HelloWorld"]
