http://potluck-env.eba-ginfq379.us-east-1.elasticbeanstalk.com/

# potluckCentral
Potluck Central is a Java Spring MVC Web Application that allows users to plan potlucks with other users.

# Features
User Registration and Login: users can register a new account. User input is validated by regex classes. Registered users are able to login.
Potluck Creation and Management: registered users can create new potluck events. Events include an invite code. The owner can add or remove participants, update potluck details, and delete the event. Participants can add new items to the potluck or leave.
Potluck Joining: registered users can join other potlucks if given the invite code. Users can manage their own items in a joined potluck by adding, updating, or deleting them. A user can also leave a potluck.

This project makes use of Spring MVC, Spring Security, Hibernate, and AWS RDS and is deployed to AWS Elastic Beanstalk.

# Login and Main Page
![Login](https://beachtrade.s3.amazonaws.com/chrome_2019-10-18_23-37-19.jpg)
![Main](https://beachtrade.s3.amazonaws.com/chrome_2019-10-18_23-40-39.jpg)

# Potlucks
![Potlucks](https://beachtrade.s3.amazonaws.com/chrome_2019-10-18_23-42-33.jpg)
