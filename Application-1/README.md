# Application-1

### Steps to set up Webapp-1 (Only if not use the Docker image)

* `cd webapp-1/Angular`
* `npm install`

### Components of the application

The application is compose of a back-end in Spring and front-end in angular.

| Part | Folder |
| ---- | ------ |
| back-end | webapp-1/TrackOrJargh |
| front-end | webapp-1/Angular |

The application contains a script for create a Docker image of the application. The script is in the folder `webapp-1/Docker`. To run the script use `create-image.sh name-image`