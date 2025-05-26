
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
