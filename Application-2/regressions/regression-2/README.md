# Dataset Webapp-2 Regression-2

| Documentation for the regression |
| ------------ | 
| **Branch where introduced regression** |
| The name of the branch where introduced regression is *changes-admin-page* |
| **Link to branch** |
| https://github.com/e2e-tests-database/webapp-2/tree/changes-admin-page |
| **Test failed** |
| com.example.demo.e2e.TestE2EFront.java (TestE2EFront.java:35) |
| **Link to test** |
| https://github.com/e2e-tests-database/webapp-2/blob/master/AMICOServer/src/test/java/com/example/demo/e2e/TestE2EFront.java#L35 |
| **File modified** |
| com.example.demo.security.RestSecurityConfig.java |
| **Link to changes** |
| https://github.com/e2e-tests-database/webapp-2/commit/3366a5450401ea656b38bb3f251065d0f883da86#diff-b2026ef1d30ddb56a9020ffc15ca1379R40 |
| **Bug description** |
| The problem in this bug is that it can’t delete any course in admin mode. This problem is in the class of control role users, and in the class that contains the restcontroller of remove courses. |

##### Move to tags

We move to the commit where we can see exist a regression and we can also move to the commit where regression fixed using the command `git checkout tag`. 

The tags that we can use: 

| Type tag | Tag | 
| -------- | --- |
| **Regression:** | regression-2
| **Regression Fixed:** | regression-fixed-2 |

##### Run test

To run the test, follow these steps:

1. Move to the backend folder.
* `cd webapp-2/AMICOServer`
2. Run the test
* `mvn -Dtest=TestE2EFront#checkCreateCourse test`

##### Dataset 

In this repository we can see the logs of the regression:

1. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression.
2. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression fixed.
3. The folder `comparative` contains a comparative between regression and regression fixed.