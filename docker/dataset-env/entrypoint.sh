#!/bin/bash

declare -A tests

APP=$1
BRANCH=$2
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
        # RUN APP
        echo "Running ${APP} in background spring... Logs will save at /home/dataset/logs"  
        # cd /home/dataset/webapp-1/TrackOrJargh
        # mvn spring-boot:run > /home/dataset/logs/backend-webapp-1 &
        # echo $! > /var/log/backend-webapp-1-pid
        # cd /home/dataset/webapp-1/Angular
        # npm install --unsafe
        # npx ng serve --host 0.0.0.0 > /home/dataset/logs/frontend-webapp-1 &
        # echo $! > /var/log/frontend-webapp-1-pid
        # RUN E2E TEST

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

        # SET UP LOG FOLDER
        CURRENT_LOG_FOLDER=$LOGS_PATH/$APP/$BRANCH
        RELATIVE_LOG_FOLDER=logs/$APP/$BRANCH
        echo "[STEP 1] Creating folder for logs ${RELATIVE_LOG_FOLDER}/"
        mkdir -p $CURRENT_LOG_FOLDER

        # CHECKOUT COMMIT
        echo "[STEP 2] Checking out to branch '${BRANCH}' in project ${APP}"
        echo "         -> git checkout ${BRANCH} [LOG -> ${RELATIVE_LOG_FOLDER}/git.log]"
        cd /home/dataset/webapp-2/
        git checkout $BRANCH > $CURRENT_LOG_FOLDER/git.log 2>&1

        # BUILD APP
        echo "[STEP 3] Building ${APP}"
        echo "         -> mvn clean package -Dskip.test [LOG -> ${RELATIVE_LOG_FOLDER}/backend-build.log]"
        cd /home/dataset/webapp-2/AMICOServer
        mvn clean package -B -Dskip.test > $CURRENT_LOG_FOLDER/backend-build.log

        echo "         -> npm install --unsafe [LOG -> ${RELATIVE_LOG_FOLDER}/frontend-build.log]"
        cd /home/dataset/webapp-2/Angular
        npm install --unsafe > $CURRENT_LOG_FOLDER/frontend-build.log 2>&1

        # RUN APP
        echo "[STEP 4] Running ${APP} in background"
        echo "         -> java -jar target/AMICOServer-0.0.1-SNAPSHOT.jar [LOG -> ${RELATIVE_LOG_FOLDER}/backend.log]"
        cd /home/dataset/webapp-2/AMICOServer
        java -jar target/AMICOServer-0.0.1-SNAPSHOT.jar > $CURRENT_LOG_FOLDER/backend.log 2>&1 &
        echo $! > /var/log/backend-webapp-2-pid
        echo "         -> npx ng serve --host 0.0.0.0 [LOG -> ${RELATIVE_LOG_FOLDER}/frontend.log]"
        cd /home/dataset/webapp-2/Angular
        npx ng serve --host 0.0.0.0 > $CURRENT_LOG_FOLDER/frontend.log 2>&1 &
        echo $! > /var/log/backend-webapp-2-pid
        sleep 20 # Wait app up

        # RUN E2E TEST
        TEST=${tests[$BRANCH]}
        echo "[STEP 5] Running test ${TEST}"
        echo "         -> mvn -Dtest=${TEST} test > ${CURRENT_LOG_FOLDER} [LOG -> ${RELATIVE_LOG_FOLDER}/test.log]"
        cd /home/dataset/webapp-2/AMICOServer
        mvn -Dtest=$TEST -B test > $CURRENT_LOG_FOLDER/test.log 2>&1
        ;;

    webapp-3)
        tests=(
            ["regression-1"]="TestE2EFront#checkShowAdminPage"
            ["regression-fixed-1"]="TestE2EFront#checkShowAdminPage"
        ) 
        # RUN APP
        echo "Running ${APP} in background spring... Logs will save at /home/dataset/logs" 
        # cd /home/dataset/webapp-3/AMICOServer
        # mvn spring-boot:run > /home/dataset/logs/backend-webapp-3 &
        # echo $! > /var/log/backend-webapp-3-pid
        # RUN E2E TEST

        ;;
esac





