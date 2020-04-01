# E2E-Test-Dataset

E2E Tests Dataset is a collection of reproducible regressions in real applications and end to end tests.

## The Projects

We have used projects developed in Spring and Angular, the projects simulate real applications.

| Project  | URL | Number of Regressions |
| -------- | --- | :-------------------: |
| Webapp-1 | https://github.com/e2e-tests-dataset/webapp-1 | 2 |
| Webapp-2 | https://github.com/e2e-tests-dataset/webapp-2 | 3 |
| Webapp-3 | https://github.com/e2e-tests-dataset/webapp-3 | 1 |


### Requirements

If you use the dataset in local you will need the following tools:

* Maven (All projects)
* Git (All projects)
* Java 1.8 (All projects)
* Node 8.x (Webapp-1 and Webapp-2)

The applications Webapp-1 and Webapp-2 using a back-end in Spring and front-end in Angular. The application Webapp-1 use a back-end Spring, and front-end with moustache.

### Docker enviroment

If you don't want to use the local dataset you can use the docker's image with the all enviroment. The image and explications for running the image are in `docker/` folder.

### Regressions

You can see the different regressions in detail in the 'regressions' folder within each application.

### Example of use 

* Application: `Webapp-2`
* Regression:  `Regression-1`

If we want to run the tests, both in its fixed version and in its buggy version:

#### Without Docker

1. Move to application folder:
* `cd Application-2/webapp-2/AMICOServe`
2. Change project version to de buggy version:
* `git checkout regression-1`
3. Run the test which reveal the bug (Should not pass):
* `mvn -Dtest=TestE2EFront#checkShowProfile test`
4. Check output logs. You can also check the logs we got:
* `Application-2/regressions/regression-1/logs-regression`
5. Change project version to de fixed version:
* `git checkout regression-fixed-1`
6. Run the test which reveal the bug (Should pass):
* `mvn -Dtest=TestE2EFront#checkShowProfile test`
7. Check output logs. You can also check the logs we got:
* `Application-2/regressions/regression-1/logs-fixed-regression`
8. You can also see a comparison of the logs in their two versions (Open in browser)
* `Application-2/regressions/regression-1/comparative`

#### With Docker

1. Move to Docker folder
* `cd docker/dataset-env/`
2. Run test on buggy version
* `./e2e-dataset.sh webapp-2 regression-1`
3. Check logs at `logs/webapp-2/regression-1/`
4. Run test on fixed version
* `./e2e-dataset.sh webapp-2 regression-fixed-1`
5. Check logs at `logs/webapp-2/regression-fixed-1/` and compare with buggy version


