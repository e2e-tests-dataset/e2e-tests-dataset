# Dataset Webapp-2 Regression-3

| Documentation for the regression |
| ------------ |
| **Branch where introduced regression** |
| The name of the branch where introduced regression is *fixed-moodle* |
| **Link to branch** |
| https://github.com/e2e-tests-database/webapp-2/tree/fixed-moodle |
| **Test failed** |
| com.example.demo.e2e.TestE2EFront.java (TestE2EFront.java:130) |
| **File modified** | 
| src/app/moodle/moodleContents.component.html |
| **Link to changes** |
| https://github.com/e2e-tests-database/webapp-2/commit/fe75b4a256b64b74de316f85c6b099a94bb1bfb1#diff-3003678b380b45b18c6ae98f1e460c3aR10 <br> https://https://github.com/e2e-tests-database/webapp-2/commit/fe75b4a256b64b74de316f85c6b099a94bb1bfb1#diff-3003678b380b45b18c6ae98f1e460c3aR211 |
| **Bug description** |
| The problem in this bug is that any user can’t download the contents of the courses. This problem is due to the method of download the pdf is misspelled and the browser launch an exception. |

##### Move to tags 

We move to the commit where we can see exist a regression and we can also move to the commit where regression fixed using the command `git checkout tag`. 

The tags that we can use: 

| Type tag | Tag | 
| -------- | --- |
| **Regression:** | regression-3
| **Regression Fixed:** | regression-fixed-3 |

##### Run test

To run the test, follow these steps:

1. Move to the backend folder.
* `cd webapp-2/AMICOServer`
2. Run the test
* `mvn -Dtest=TestE2EFront#checkDownload test`

##### Dataset 

In this repository we can see the logs of the regression:

1. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression.
2. The folder `logs-regression` contains the logs back-end, front-end, junit and video of the regression fixed.
3. The folder `comparative` contains a comparative between regression and regression fixed.