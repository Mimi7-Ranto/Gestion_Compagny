@echo off
REM Script pour compiler et exécuter le projet Spring Boot sur Windows

REM Vérifier Maven
where mvn >nul 2>nul
IF ERRORLEVEL 1 (
    echo Maven n'est pas installé. Installez-le depuis https://maven.apache.org/download.html
    exit /b
)

REM Compiler le projet
echo Compilation du projet...
mvn clean package -DskipTests

REM Vérifier si le JAR existe
set JAR_FILE=
for %%f in (target\*.jar) do (
    if NOT "%%f"=="%JAR_FILE%" set JAR_FILE=%%f
)

if "%JAR_FILE%"=="" (
    echo JAR non trouvé dans target\
    exit /b
)

REM Lancer le JAR
echo Lancement du projet...
java -jar "%JAR_FILE%"
pause
