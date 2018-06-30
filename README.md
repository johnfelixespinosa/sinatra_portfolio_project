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
  This Sinatra App serves as a semester planner for students. Its main purpose is for students to be able to create an account and then add classes to a schedule. The schedule is then created listing all of their chosen classes for that semester with the ability to edit and/or delete classes. Students should have the ability to create multiple schedules planning for future semesters.  

### Features
  * User create with signup/signout using name, email, and password allowing for sessions
  * CRUD for user created objects (schedules, also classes?) 

  | Students          | Instructor    |
  | -------------     |:-------------:| 
  | CRUD schedules    | CRUD courses  |

  ##### Courses
    * Courses can be created by Instructors
    * Attributes include course_name, course_instuctor(user[:username]), course_day, course_credits
    * Courses can be edited by instructors

  ##### Schedules
    * Schedules can be created by Students
    * Attributes include semester, courses, user_id
  

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


### License
  This project is being created open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


