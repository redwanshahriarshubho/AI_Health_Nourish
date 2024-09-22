 
### System requirements

Dart SDK Version 3.3.2 or greater.
Flutter SDK Version 3.19.4 or greater.


### Application structure
After successful build, application structure should look like this:
                    
```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```


<p> screen one- sign in page <br>
screen two- sign up page<br>
screen three- user registered page<br>
screen six- user profile<br>
screen four- chat with health assistant<br>
screen five- saved diet chart</p>
