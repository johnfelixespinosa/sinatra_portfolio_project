Hi John,

Nice job on your portfolio project review! I'm excited to meet again and discuss your app further. To recap, before the next time we meet:

- Comb over your routes to make sure you are using RESTful conventions where appropriate. A good reference for this lives here: https://learn.co/tracks/full-stack-web-development-v5/sinatra/activerecord/sinatra-restful-routes

I believe my routes are ok with the setup of the application. I know that it is good practice to have the views doing as little of the logic as possible, but currently my views such as the user/show page will show only the content based on the current_user usertype. Students can only see student content and instructors can only see instructor content. If I was to have to controllers and split the user model into two models then I could take the logic out of the view and split them into separate views per user model. 

Dependant on the usertype the view will dictate whether a user can access the enroll or CRUD course features. 

- Review has_secure_password. Focus on the methods it provides and what they do for us and our apps.

has_secure_password requires the password_digest attribute for the user. Which entail adds the following validations
  -Password must be present on creation
  -Password length should be less than or equal to 72 bytes
  -Confirmation of password (using a password_confirmation attribute)

class User < ActiveRecord::Base
  has_secure_password validations: false
end

user = User.new
user.password = nil
user.password_digest # => nil
user.password = 'mUc3m00RsqyRe'
user.password_digest # => "$2a$10$4LEA7r4YmNHtvlAvHhsYAeZmk/xeUVtMTYqwIvYY76EW5GUqDiP4."

Upon user creation has_secure_password sets the password attribute to read only, and creates a confirms a password_digest attribute. When the password is set by a new user it must be confirmed (entered twice?, this could be disabled, btw confirmation = false I think). password= then encrypts and saves the password to the password_digest attribute.

This makes it so passwords will be saved in the database as the encrypted password. Hackers will have to use brute force to gain access. 

- Review sessions. Why do we set session[:user_id]?

- Look into using Enrollments as a join table. Remember that you can specify the class you'll be referencing: http://edgeguides.rubyonrails.org/association_basics.html#options-for-belongs-to-class-name
- If you're having trouble, don't hesitate to schedule a 1:1 with Howard! https://theflatironschool.typeform.com/to/Xva2Br
When you've finished, you can use this link to schedule another appointment: https://meetme.so/SinatraLearnAssessment
Please reach out if you have any questions or concerns.

Regards,

Luisa Scavo 
luisa@flatironschool.com

User can be either Instructor or student

Instructors can have courses

Students can have enrollments 

Enrollments can have on student and one course

Courses belong to instructors and enrollments

