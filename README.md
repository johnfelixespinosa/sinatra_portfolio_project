# sinatra_portfolio_project
## Imagine Online Community College

  John Espinosa for Learn.co Fullstack Web Development Course


### Install Instructions
  To begin using this application
  - clone into local repository
  - run `bundle install`
  - `rake db:migrate`
  - `rake db:seed`
  - `shotgun` to start local server
  - in browser visit http://127.0.0.1:9393/
  - signup can be achieved or use these accounts to test user functions

    STUDENT ACCOUNT

    INSTRUCTOR ACCOUNT


### Purpose
  This Sinatra App serves as a homepage for a make-believe online community college. The college allows users to create accounts for whether they are a student or an instructor. Students and instructors have various features they can both do. You can read more about this project on my blog at [Sinatra Portfolio Projet](http://johnfelixespinosa.github.io/).

### Features
  * User create with signup/signout using username, name, email, and password allowing for sessions
  * CRUD for user created objects  

  | Students          | Instructor    |
  | -------------     |:-------------:| 
  | Can search available courses    | CRUD courses  |
  | Can Enroll and withdraw from courses |

  ##### Courses
    * Courses can be created by Instructors
    * Attributes include course_name, course_instuctor(user[:username]), course_credits
    * Courses can be edited by instructors

  ##### Enrollments
    * Students can enroll in a course which creates a new Enrollment object
    * An Enrollment object contains user_id and course_id
    * An Enrollment object can be deleted, effectively withdrawing the student from the course
    * An enrollment object cannot be duplicated due to the already_enrolled? method
  

### Development Timeline
  ##### June 21
    * Started with user model creation with routes and views
  ##### June 25  
    * User account creation completed
    * Users can create classes that get added to their schedule
    * Classes can be deleted
  ##### June 29
    * All current pages have bootstrap styling
    * Account types implemented, users can either be student, or instructor
      - students should be able to see all classes added by instructors
  ##### July 4
    * All features working
    * Student Enrollment works properly
    * Finished up app for submittal

### License
  This project is being created open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


