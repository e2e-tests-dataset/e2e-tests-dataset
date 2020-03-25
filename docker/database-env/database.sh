#!/bin/bash

if [ $# == 0 ] || [ $1 == "help" ]; then
    echo "Mode of use"
    echo "database.sh start [webapp-1 | webapp-2 | webapp-3]"
    echo "database.sh stop [webapp-1 | webapp-2 | webapp-3]"
    exit
else
    if [ $1 == 'start' ]; then
        case "$2" in 
            webapp-1) 
                echo "Running Webapp-1 in background spring and angular... Logs is saved in /home/database/logs" 
                cd /home/database/webapp-1/TrackOrJargh
                mvn spring-boot:run > /home/database/logs/backend-webapp-1 &
                echo $! > /var/log/backend-webapp-1-pid
                cd /home/database/webapp-1/Angular
                npx ng serve --host 0.0.0.0 > /home/database/logs/frontend-webapp-1 &
                echo $! > /var/log/frontend-webapp-1-pid
                ;;

            webapp-2)
                echo "Running Webapp-2 in background spring and angular... Logs is saved in /home/database/logs" 
                cd /home/database/webapp-2/AMICOServer
                mvn spring-boot:run > /home/database/logs/backend-webapp-2 &
                echo $! > /var/log/backend-webapp-2-pid
                cd /home/database/webapp-2/Angular
                npx ng serve --host 0.0.0.0 > /home/database/logs/frontend-webapp-2 &
                echo $! > /var/log/backend-webapp-2-pid
                ;;

            webapp-3)
                echo "Running Webapp-3 in background spring... Logs is saved in /home/database/logs" 
                cd /home/database/webapp-3/AMICOServer
                mvn spring-boot:run > /home/database/logs/backend-webapp-3 &
                echo $! > /var/log/backend-webapp-3-pid
                ;;
        esac
    elif [ $1 == 'stop' ]; then
                case "$2" in 
            webapp-1) 
                echo "Stopping webapp-1..."
                kill -9 `cat /var/log/backend-webapp-1-pid`
                kill -9 `cat /var/log/frontend-webapp-1-pid`
                ;;

            webapp-2)
                echo "Stopping webapp-1..."
                kill -9 `cat /var/log/backend-webapp-2-pid`
                kill -9 `cat /var/log/frontend-webapp-2-pid`
                ;;

            webapp-3)
                echo "Stopping webapp-1..."
                kill -9 `cat /var/log/backend-webapp-3-pid`
                ;;
        esac
    fi
fi





