# Dataset Webapp-2 Regression-1

| Documentation for the regression |
| ------------ |
| **Branch where introduced regression** |
| The name of the branch where introduced regression is *fixed-profile* |
| **Link to branch** |
| https://github.com/e2e-tests-database/webapp-2/tree/fixed-profile |
| **Test failed** |
| com.example.demo.integration.TestAPI.java (TestAPI.java:44) |
| **Link to test** |
| https://github.com/e2e-tests-database/webapp-2/blob/master/AMICOServer/src/test/java/com/example/demo/e2e/TestE2EFront.java#L155 |
| **File modified** |
| com.example.demo.security.RestSecurityConfig.java |
| **Link to changes** |
| https://github.com/e2e-tests-database/webapp-2/commit/fef94f4f82819a4e1d2267421a0065866f8cf8a0#diff-b2026ef1d30ddb56a9020ffc15ca1379R32 |
| **Bug description** |
| The problem in this bug is that any person can see the profile of any other person. This problem is in the class at control of the role of users.

##### Move to tags

We move to the commit where we can see exist a regression and we can also move to the commit where regression fixed using the command `git checkout tag`. 

The tags that we can use: 

| Type tag | Tag | 
| -------- | --- |
| **Regression:** | regression-1
| **Regression Fixed:** | regression-fixed-1 |

##### Run test

To run the test, follow these steps:

1. Move to the backend folder.
* `cd webapp-2/AMICOServer`
2. Run the test
* `mvn -Dtest=TestE2EFront#checkShowProfile test`

##### Dataset

In this repository we can see the logs of the regression:

1. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression.
2. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression fixed.
3. The folder `comparative` contains a comparative between regression and regression fixed.