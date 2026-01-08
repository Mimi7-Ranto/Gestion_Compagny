#!/bin/bash
# Script pour compiler et exécuter le projet Spring Boot sur Linux

# Vérifier Maven
if ! command -v mvn &> /dev/null
then
    echo "Maven n'est pas installé. Installez-le avec : sudo apt install maven"
    exit
fi

# Compiler le projet
echo "Compilation du projet..."
mvn clean package -DskipTests

# Vérifier si le JAR existe
JAR_FILE=$(ls target/*.jar | grep -v 'original' | head -n 1)
if [ ! -f "$JAR_FILE" ]; then
    echo "JAR non trouvé dans target/"
    exit
fi

# Exécuter le JAR
echo "Lancement du projet..."
java -jar "$JAR_FILE"
