
CREATE TABLE lessons (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(255),
  content varchar(255),
  video_link varchar(255),
  order int,
  created_at timestamp,
  updated_at timestamp,
  course_link varchar(255)
);

CREATE TABLE courses (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(255),
  content varchar(255),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE modules (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(255),
  content varchar(255),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE programs (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(255),
  price int,
  type varchar(255),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE course_lessons (
   id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   course_id REFERENCES courses(id) NOT NULL,
   lesson_id REFERENCES lessons(id) NOT NULL
);

CREATE TABLE module_courses (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  course_id REFERENCES courses(id) NOT NULL,
  module_id REFERENCES modules(id) NOT NULL
);

CREATE TABLE program_modules (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  module_id REFERENCES modules(id) NOT NULL,
  program_id REFERENCES programs(id) NOT NULL
);

CREATE TYPE user_type AS ENUM ('student', 'teacher', 'admin');

CREATE TABLE users (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(255),
  email varchar(255),
  password varchar(255),
  group_link varchar(255),
  created_at timestamp,
  updated_at timestamp,
  type user_type
);

CREATE TABLE teaching_groups (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slug varchar(255),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE user_groups (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id REFERENCES users(id) NOT NULL,
  teaching_group_id REFERENCES teaching_groups(id) NOT NULL
);

CREATE TYPE subscription_status AS ENUM ('active', 'pending', 'cancelled', 'completed');

CREATE TYPE payment_status AS ENUM ('pending', 'paid', 'failed', 'refunded');
CREATE TYPE program_status AS ENUM ('active', 'completed', 'pending', 'cancelled');

CREATE TABLE enrollments (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id REFERENCES users(id) NOT NULL,
  program_id REFERENCES programs(id) NOT NULL,
  status subscription_status,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE payments (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  enrollment_id REFERENCES enrollments(id) NOT NULL,
  payment_sum int,
  status payment_status,
  payment_date date,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE program_completions (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id REFERENCES users(id) NOT NULL,
  program_id REFERENCES programs(id) NOT NULL,
  status program_status,
  start_date date,
  end_date date,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE certificates (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id REFERENCES users(id) NOT NULL,
  program_id REFERENCES programs(id) NOT NULL,
  url varchar(255),
  certification_date date,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE questions(
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  quiz_id REFERENCES quizzes(id) NOT NULL,
  content varchar(255) 
)

CREATE TABLE answers(
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  question_id REFERENCES questions(id) NOT NULL,
  content varchar(255),
  is_correct boolean
);

CREATE TABLE quizzes (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  lesson_id REFERENCES lessons(id) NOT NULL,
  name varchar(255),
  question_id REFERENCES questions(id) NOT NULL,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE exercises (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  lesson_id REFERENCES lessons(id) NOT NULL,
  name varchar(255),
  url varchar(255),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE discussions(
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  lesson_id REFERENCES lessons(id) NOT NULL,
  content varchar(255),
  parent_id int NOT NULL,
  created_at timestamp,
  updated_at timestamp
);

CREATE TYPE blog_status AS ENUM ('created', 'in moderation', 'published', 'archived');

CREATE TABLE enrollments (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id REFERENCES users(id) NOT NULL,
  title varchar(255),
  content varchar(255),
  status blog_status,
  created_at timestamp,
  updated_at timestamp
);



