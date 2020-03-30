# Dataset Webapp-1 Regression-2

| Documentation for the regression |
| ------------ | 
| **Branch where introduced regression** |
| The name of the branch where introduced regression is *refactor-index-charts* |
| **Link to branch** |
| https://github.com/e2e-tests-dataset/webapp-1/tree/refactor-index-charts |
| **Test failed** |
| com.trackorjargh.e2e.api.TestGraphics.java (TestGraphics.java:56) |
| **Link to test** |
| https://github.com/e2e-tests-dataset/webapp-1/blob/master/TrackOrJargh/src/test/java/com/trackorjargh/e2e/api/TestGraphics.java#L56 |
| **File modified** |
| com.trackorjargh.apirestcontrolers.ApiGenderController.java |
| **Link to changes** |
| https://github.com/e2e-tests-dataset/webapp-1/commit/5d21489430545fe4d6e3201876b6ada556e59431#diff-54e63438903cb13be10bf4f44213d2fbR48 |
| **Regression description** |
| The problem in this bug is the method of the api that return the num of genres (shows, films, books). The method failed counting the genres (the variable of count accumulated all). |  

##### Move to tags

We move to the commit where we can see exist a regression and we can also move to the commit where regression fixed using the command `git checkout <tag>`. 

The tags that we can use: 

| Type tag | Tag | 
| -------- | --- |
| **Regression:** | regression-2
| **Regression Fixed:** | regression-fixed-2 |

##### Run test

To run the test, follow these steps:

1. Move to the backend folder.
* `cd webapp-1/TrackOrJargh`
2. Run the test
* `mvn -Dtest=TestAPIRestTemplate test`

##### Dataset 

In this repository we can see the logs of the regression:

1. The folder `logs-regression` contains the logs back-end and junit of the regression.
2. The folder `logs-regression` contains the logs back-end and junit of the regression fixed.
3. The folder `comparative` contains a comparative between regression and regression fixed.