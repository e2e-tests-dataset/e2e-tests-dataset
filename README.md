# E2E-Test-Dataset

E2E Tests Database is a collection of reproducible regressions in real applications and end to end tests.

## The Projects

We have used projects developed in Spring and Angular, the projects simulate real applications.

| Project  | URL | Number of Regressions |
| -------- | --- | :-------------------: |
| Webapp-1 | https://github.com/e2e-tests-database/webapp-1 | 2 |
| Webapp-2 | https://github.com/e2e-tests-database/webapp-2 | 3 |
| Webapp-3 | https://github.com/e2e-tests-database/webapp-3 | 1 |


### Requirements

If you use the database in local you will need the following tools:

* Maven (All projects)
* Git (All projects)
* Java 1.8 (All projects)
* Node 8.x (Webapp-1 and Webapp-2)

The applications Webapp-1 and Webapp-2 using a back-end in Spring and front-end in Angular. The application Webapp-1 use a back-end Spring, and front-end with moustache.

### Docker enviroment

If you don't want to use the local database you can use the docker's image with the all enviroment. The image and explications for running the image are in `docker/` folder.