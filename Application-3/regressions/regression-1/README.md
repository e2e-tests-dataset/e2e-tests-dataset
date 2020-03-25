# Dataset Webapp-3 Regression-1
| Documentation for the regression |
| ------------ | 
| **Branch where introduced regression** |
| The name of the branch where introduced regression is *improvement-to-profile* |
| **Link to branch** |
| https://github.com/e2e-tests-database/webapp-3/tree/improvement-to-profile |
| **Test failed** |
| com.brems.e2e.TestE2EFront.java (TestE2EFront.java:27) |
| **Link to test** |
| https://github.com/e2e-tests-database/webapp-3/blob/improvement-to-profile/BREMS/src/test/java/com/brems/e2e/TestE2EFront.java#L27 |
| **File modified** |
| appSpring.security.SecurityConfiguration.java | 
| **Link to changes** |
| https://github.com/e2e-tests-database/webapp-3/commit/218c5bf20d3a58df2119338b64b54b79809d46e6#diff-736e54c81e6fb4e39639a611b132b965R33 |
| **Regression description**
| The problem in this bug is that any user of the application can see administration panel and realize changes in the platform. |

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
* `cd webapp-2/BREMS`
2. Run the test
* `mvn -Dtest=TestE2EFront#checkShowAdminPage test`

##### Dataset 

In this repository we can see the logs of the regression:

1. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression.
2. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression fixed.
3. The folder `comparative` contains a comparative between regression and regression fixed.