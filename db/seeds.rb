instructortest = User.create(username: "instructortest",
            email: "instructortest@iocc.staff.edu",
            password: "password",
            usertype: "instructor")

studenttest = User.create(username: "studenttest",
            email: "studenttest@gmail.com",
            password: "password",
            usertype: "student")

markevans = User.create(username: "MarkEvans",
            email: "markevans@iocc.staff.edu",
            password: "password",
            usertype: "instructor")

wendywashington = User.create(username: "WendyWashington",
            email: "wendywashington@iocc.staff.edu",
            password: "password",
            usertype: "instructor")

danielkehoe = User.create(username: "DanielKehoe",
            email: "danielkehoe@iocc.staff.edu",
            password: "password",
            usertype: "instructor")



Course.create(course_name: "Intro to Computer Science",
              course_instructor: "DanielKehoe",
              course_description: "Computer uses in modern society. Emphasis on uses in non-scientific disciplines. Includes word processing, spreadsheets, web-page creation, elementary programming, basic computer organization, the Internet, the uses of computers and their influence on society. Course not intended for CS or CSE majors.",
              course_credits: "3",
              user_id: danielkehoe.id)

Course.create(course_name: "Programming and Problem Solving",
              course_instructor: "DanielKehoe",
              course_description: "Introduction to computers and computer programming, algorithm design, and debugging. Elements of good programming style. Programming in the C language. Use of basic UNIX tools.",
              course_credits: "2",
              user_id: danielkehoe.id)

Course.create(course_name: "Cryptography",
              course_instructor: "MarkEvans",
              course_description: "Introduction to the theory and practice of cryptographic techniques used in computer security. Encryption (secret-key and public-key), message authentication, digital signatures, entity authentication, key distribution, and other cryptographic protocols. The social context of cryptography.",
              course_credits: "1",
              user_id: markevans.id)

Course.create(course_name: "Artifical Intelligence",
              course_instructor: "WendyWashington",
              course_description: "Design and implementation of intelligent computer systems. Intelligent search, adversarial search in games, reasoning with graphical models, reinforcement learning and connectionist machines",
              course_credits: "3",
              user_id: wendywashington.id)