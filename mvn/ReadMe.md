# Install a jar file to local repository

Run the following command to install the ./lib/my_lib.jar file locally on your computer via maven:

```bash 
mvn install:install-file -Dfile="libs\my_lib.jar" -DgroupId="com.github.chen0040" -DartifactId=my_lib -Dversion="1.0.1" -Dpackaging=jar
```

Now add the following dependency to your POM file:

```xml
<dependency>
    <artifactId>my_lib</artifactId>
    <groupId>com.github.chen0040</groupId>
    <version>1.0.1</version>
</dependency>
```

# Deploy a jar file to remote repository 

Step 1: Set up your remote nexus server, let's suppose the server is at http://13.92.250.75:8081. 

Step 2: Configure the $HOME/.m2/settings.xml as follows:

```xml
<settings>
  <servers>
    <server>
       <id>chen0040-releases</id>
       <username>deployment</username>
       <password>deployment@chen0040</password>
     </server>
	 
	 <server>
       <id>chen0040-snapshots</id>
       <username>deployment</username>
       <password>deployment@chen0040</password>
     </server>
  </servers>

  
  <profiles>
    <profile>
      <id>nexus</id>
      <repositories>
		<repository>
		   <id>chen0040-releases</id>
		   <name>chen0040 releases repository</name>
		   <url>http://13.92.250.75:8081/nexus/content/repositories/releases</url>
		   <snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		
		<repository>
		   <id>chen0040-snapshots</id>
		   <name>chen0040 snapshots repository</name>
		   <url>http://13.92.250.75:8081/nexus/content/repositories/snapshots</url>
		   <snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		
		<repository>
			<id>maven-default</id>
			<name>maven repository</name>
			<url>http://repo1.maven.org/maven2</url>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		
		<repository>
			<id>maven-snapshot</id>
			<name>maven snapshot repository</name>
			<url>http://people.apache.org/repo/m2-snapshot-repository</url>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		
      </repositories>
	  
     <pluginRepositories>
	    <pluginRepository>
		  <id>maven-plugin-central</id>
		  <name>maven plugin repository</name>
		  <url>http://repo1.maven.org/maven2</url>
		  <layout>default</layout>
		  <snapshots>
			<enabled>false</enabled>
		  </snapshots>
		  <releases>
			<updatePolicy>never</updatePolicy>
		  </releases>
		</pluginRepository>
	
        <pluginRepository>
          <id>central</id>
          <url>http://central</url>
          <releases><enabled>true</enabled></releases>
          <snapshots><enabled>true</enabled></snapshots>
        </pluginRepository>
      </pluginRepositories>
	  
    </profile>
  </profiles>
  
  <activeProfiles>
    <!--make the profile active all the time -->
    <activeProfile>nexus</activeProfile>
  </activeProfiles>
</settings>
```

Now to deploy your ./lib/my_lib.jar to releases repository at the nexus server, run the following command:

```bash 
mvn deploy:deploy-file -DgroupId="com.github.chen0040" \
  -DartifactId=my_lib \
  -Dversion="1.0.1" \
  -Dpackaging=jar \
  -Dfile="libs\my_lib.jar" \
  -DrepositoryId="chen0040-releases" \
  -Durl="http://13.92.250.75:8081/nexus/"
```

Once the library is deployed to the nexus server, you can add the following dependencies to your POM file to start using the jar file:

```xml 
<distributionManagement>
	<repository>
		<id>chen0040-releases</id>
		<name>chen0040 releases repository</name>
		<url>http://13.92.250.75:8081/nexus/content/repositories/releases</url>
	</repository>
	<snapshotRepository>
		<id>chen0040-snapshots</id>
		<name>chen0040 snapshots repository</name>
		<url>http://13.92.250.75:8081/nexus/content/repositories/snapshots</url>
	</snapshotRepository>
</distributionManagement>

<dependencies>
	<dependency>
		<artifactId>my_lib</artifactId>
		<groupId>com.github.chen0040</groupId>
		<version>1.0.1</version>
	</dependency>
</dependencies>
```
