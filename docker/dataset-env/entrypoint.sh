#!/bin/bash

declare -A tests

APP=$1
TAG=$2
LOGS_PATH=/home/dataset/logs

/usr/bin/Xvfb :99 -screen 0 1024x768x16 > /var/log/xvfb 2>&1 &
x11vnc -forever -usepw -create > /var/log/x11vnc 2>&1 &

case "$APP" in 
    webapp-1)
        tests=(
            ["regression-1"]="TestE2EFront"
            ["regression-fixed-1"]="TestE2EFront"
            ["regression-2"]="TestAPIRestTemplate"
            ["regression-fixed-2"]="TestAPIRestTemplate"
        )

        BACKEND_FOLDER=/home/dataset/$APP/TrackOrJargh
        FRONTEND_FOLDER=/home/dataset/$APP/Angular
        JAR=TrackOrJargh-0.0.1-SNAPSHOT.jar
        ;;

    webapp-2)
        tests=(
            ["regression-1"]="TestE2EFront#checkShowProfile"
            ["regression-fixed-1"]="TestE2EFront#checkShowProfile"
            ["regression-2"]="TestE2EFront#checkCreateCourse"
            ["regression-fixed-2"]="TestE2EFront#checkCreateCourse"
            ["regression-3"]="TestE2EFront#checkDownload"
            ["regression-fixed-3"]="TestE2EFront#checkDownload"
        )

        BACKEND_FOLDER=/home/dataset/$APP/AMICOServer
        FRONTEND_FOLDER=/home/dataset/$APP/Angular
        JAR=AMICOServer-0.0.1-SNAPSHOT.jar
        ;;

    webapp-3)
        tests=(
            ["regression-1"]="TestE2EFront#checkShowAdminPage"
            ["regression-fixed-1"]="TestE2EFront#checkShowAdminPage"
        )

        BACKEND_FOLDER=/home/dataset/$APP/BREMS
        JAR=SpringDocker.jar
        ;;
esac

# CHECK TAG EXISTS
TEST=${tests[$TAG]}
if [ -z "$TEST" ]
then
    echo "Error: Tag '${TAG}' does not exist!"
    exit 1
fi

echo ""
echo "  App: ${APP}"
echo "  Tag: ${TAG}"
echo ""

# STEP 1: SET UP LOG FOLDER
CURRENT_LOG_FOLDER=$LOGS_PATH/$APP/$TAG
RELATIVE_LOG_FOLDER=logs/$APP/$TAG
echo "[STEP 1] Creating folder for logs ${RELATIVE_LOG_FOLDER}/"
mkdir -p $CURRENT_LOG_FOLDER

# STEP 2: CHECKOUT COMMIT
echo "[STEP 2] Checking out to tag '${TAG}' in project ${APP}"
echo "         -> git checkout ${TAG} [LOG -> ${RELATIVE_LOG_FOLDER}/git.log]"
cd /home/dataset/$APP/
git checkout $TAG > $CURRENT_LOG_FOLDER/git.log 2>&1

# STEP 3: BUILD APP
echo "[STEP 3] Building ${APP}"
    
    # BUILD BACKEND
    echo "         -> mvn clean package -Dskip.test [LOG -> ${RELATIVE_LOG_FOLDER}/backend-build.log]"
    cd $BACKEND_FOLDER
    mvn clean package -B -Dskip.test > $CURRENT_LOG_FOLDER/backend-build.log

    # BUILD FRONT END (IF EXIST)
    if [ ! -z "$FRONTEND_FOLDER" ]
    then
        echo "         -> npm install --unsafe [LOG -> ${RELATIVE_LOG_FOLDER}/frontend-build.log]"
        cd $FRONTEND_FOLDER
        npm install --unsafe > $CURRENT_LOG_FOLDER/frontend-build.log 2>&1
    fi

# STEP 4: RUN APP
echo "[STEP 4] Running ${APP} in background"

    # RUN BACKEND
    echo "         -> java -jar target/$JAR [LOG -> ${RELATIVE_LOG_FOLDER}/backend.log]"
    cd $BACKEND_FOLDER
    java -jar target/$JAR > $CURRENT_LOG_FOLDER/backend.log 2>&1 &

    # RUN FRONTEND (IF EXIST)
    if [ ! -z "$FRONTEND_FOLDER" ]
    then
        echo "         -> npx ng serve --host 0.0.0.0 [LOG -> ${RELATIVE_LOG_FOLDER}/frontend.log]"
        cd $FRONTEND_FOLDER
        npx ng serve --host 0.0.0.0 > $CURRENT_LOG_FOLDER/frontend.log 2>&1 &
    fi
    
    # WAIT APP UP
    sleep 20 

# STEP 5: RUN E2E TEST
echo "[STEP 5] Running test ${TEST}"
echo "         -> mvn -Dtest=${TEST} test [LOG -> ${RELATIVE_LOG_FOLDER}/junit.log]"
cd $BACKEND_FOLDER
mvn -Dtest=$TEST -B test > $CURRENT_LOG_FOLDER/junit.log 2>&1





