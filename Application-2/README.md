# Application-2

### Steps to set up Webapp-2 (Only if not use the Docker image)

* `cd webapp-2/Angular`
* `npm install`

### Components of the application

The application is compose of an back-end in Spring and front-end in angular.

| Part | Folder |
| ---- | ------ |
| back-end | webapp-2/AMICOServer |
| front-end | webapp-2/Angular |

The application contains a script for create a Docker image of the application. The script is in the folder `webapp-2/Docker`. To run the script use `create-image.sh name-image`