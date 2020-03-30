# Webapp-1 Regression-1

| Documentation for the regression |
| ------------ | 
| **Branch where introduced regression** |
| The name of the branch where introduced regression is *fixed-footer* |
| **Link to branch** |
| https://github.com/e2e-tests-dataset/webapp-1/tree/fixed-footer |
| **Test failed** |
| com.trackorjargh.e2e.TestE2EFront.java (TestE2EFront.java:27)
| **Link to test** |
| https://github.com/e2e-tests-dataset/webapp-1/blob/master/TrackOrJargh/src/test/java/com/trackorjargh/e2e/TestE2EFront.java#L27 |
| **File modified** |
| src/app/profile/profile.html | 
| **Link to changes** |
| https://github.com/e2e-tests-dataset/webapp-1/commit/f29161ce86418e7c23f1d9a26d3327980c21d88f#diff-40ad886a9beb70f673ce1d05d73d7978R100 |
| **Regression description**
| The problem in this bug is the method called when click the button add new list, this method activate variable for collapse and uncollapse the div. The method change the variable “showAddList” but the event collapse listen the variable “isCollapsed”. |

##### Move to tags

We move to the commit where we can see exist a regression and we can also move to the commit where regression fixed using the command `git checkout <tag>`. 

The tags that we can use: 

| Type tag | Tag |
| -------- | --- |
| **Regression:** | regression-1
| **Regression Fixed:** | regression-fixed-1 |


##### Run test

To run the test, follow these steps:

1. Move to the backend folder.
* `cd webapp-1/TrackOrJargh`
2. Run the test
* `mvn -Dtest=TestE2EFront test`

##### Dataset 

In this repository we can see the logs of the regression:

1. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression.
2. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression fixed.
3. The folder `comparative` contains a comparative between regression and regression fixed.