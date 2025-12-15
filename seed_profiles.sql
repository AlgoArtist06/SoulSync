-- SoulSync Database Seed Data
-- Generated: 2025-11-28 20:50:23
-- Total Profiles: 1000

-- Note: All profiles use password 'password123'

-- Insert Users and Profiles
DO $$
DECLARE
    v_user_id BIGINT;
    v_free_subscription_id BIGINT;
BEGIN
    -- Get FREE subscription ID
    SELECT sid INTO v_free_subscription_id FROM subscriptions WHERE s_name = 'FREE' LIMIT 1;

    -- User 1: Natasha Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.verma.1@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Verma', 'Master's', 125701.33, 159.2, 'Female', '1984-05-17', 'https://randomuser.me/api/portraits/women/81.jpg', 'Content Writer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 2: Kavya Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.sen.2@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Sen', 'PhD', 133122.55, 154.16, 'Female', '1994-08-16', 'https://randomuser.me/api/portraits/women/97.jpg', 'Government Officer', 'Muslim', 'Pathan', v_user_id);

    -- User 3: Pooja Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.bhattacharya.3@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Bhattacharya', 'PhD', 82463.36, 165.17, 'Female', '1997-07-06', 'https://randomuser.me/api/portraits/women/100.jpg', 'Professor', 'Buddhist', 'Chamar', v_user_id);

    -- User 4: Zara Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.kapoor.4@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Kapoor', 'Master's', 191850.33, 160.17, 'Female', '1981-12-17', 'https://randomuser.me/api/portraits/women/36.jpg', 'Chartered Accountant', 'Jain', 'Porwal', v_user_id);

    -- User 5: Divya Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.sen.5@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Sen', 'Bachelor's', 75005.73, 167.04, 'Female', '2003-12-06', 'https://randomuser.me/api/portraits/women/36.jpg', 'Professor', 'Sikh', 'Arora', v_user_id);

    -- User 6: Aarav Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.reddy.6@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Reddy', 'PhD', 68159.91, 187.75, 'Male', '1993-07-26', 'https://randomuser.me/api/portraits/men/17.jpg', 'Civil Engineer', 'Hindu', 'Rajput', v_user_id);

    -- User 7: Aaradhya Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.das.7@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Das', 'Master's', 93959.71, 162.91, 'Female', '2000-10-18', 'https://randomuser.me/api/portraits/women/84.jpg', 'Product Manager', 'Jain', 'Porwal', v_user_id);

    -- User 8: Advik Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.kaur.8@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Kaur', 'PhD', 135620.29, 166.73, 'Male', '1987-09-28', 'https://randomuser.me/api/portraits/men/39.jpg', 'Fashion Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 9: Laksh Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.bhattacharya.9@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Bhattacharya', 'Bachelor's', 98881.55, 167.81, 'Male', '1994-03-12', 'https://randomuser.me/api/portraits/men/43.jpg', 'Chartered Accountant', 'Muslim', 'Syed', v_user_id);

    -- User 10: Arnav Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.verma.10@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Verma', 'Master's', 53293.52, 171.9, 'Male', '2000-10-01', 'https://randomuser.me/api/portraits/men/5.jpg', 'Banker', 'Sikh', 'Arora', v_user_id);

    -- User 11: Arjun Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.garg.11@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Garg', 'PhD', 146168.91, 162.03, 'Male', '1985-10-08', 'https://randomuser.me/api/portraits/men/19.jpg', 'Content Writer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 12: Ananya Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.das.12@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Das', 'Master's', 165873.56, 159.0, 'Female', '1984-05-23', 'https://randomuser.me/api/portraits/women/72.jpg', 'Data Analyst', 'Sikh', 'Kamboj', v_user_id);

    -- User 13: Shaurya Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.sinha.13@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Sinha', 'PhD', 134143.07, 173.18, 'Male', '1995-11-26', 'https://randomuser.me/api/portraits/men/50.jpg', 'Photographer', 'Buddhist', 'Chamar', v_user_id);

    -- User 14: Shaurya Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.jain.14@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Jain', 'Bachelor's', 77627.19, 172.84, 'Male', '1986-11-18', 'https://randomuser.me/api/portraits/men/26.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 15: Shlok Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.rathore.15@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Rathore', 'Master's', 189357.74, 184.4, 'Male', '1992-09-01', 'https://randomuser.me/api/portraits/men/96.jpg', 'Teacher', 'Sikh', 'Jat', v_user_id);

    -- User 16: Ila Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.thakur.16@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Thakur', 'Bachelor's', 77397.6, 166.16, 'Female', '1991-01-13', 'https://randomuser.me/api/portraits/women/88.jpg', 'HR Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 17: Prisha Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.mukherjee.17@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Mukherjee', 'Bachelor's', 57842.73, 170.42, 'Female', '1987-02-23', 'https://randomuser.me/api/portraits/women/91.jpg', 'Banker', 'Buddhist', 'Chamar', v_user_id);

    -- User 18: Pranav Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.kapoor.18@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Kapoor', 'Master's', 198590.9, 171.71, 'Male', '1995-07-25', 'https://randomuser.me/api/portraits/men/80.jpg', 'Mechanical Engineer', 'Buddhist', 'Chamar', v_user_id);

    -- User 19: Aayansh Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.iyer.19@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Iyer', 'Bachelor's', 130482.85, 183.52, 'Male', '1993-04-17', 'https://randomuser.me/api/portraits/men/37.jpg', 'Marketing Manager', 'Muslim', 'Ansari', v_user_id);

    -- User 20: Aarush Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.gupta.20@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Gupta', 'Bachelor's', 170005.88, 165.25, 'Male', '1998-12-05', 'https://randomuser.me/api/portraits/men/50.jpg', 'Financial Analyst', 'Jain', 'Oswal', v_user_id);

    -- User 21: Ila Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.roy.21@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Roy', 'Master's', 125241.65, 170.57, 'Female', '2002-04-10', 'https://randomuser.me/api/portraits/women/53.jpg', 'Sales Executive', 'Jain', 'Oswal', v_user_id);

    -- User 22: Karan Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.rathore.22@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Rathore', 'PhD', 121945.13, 187.83, 'Male', '1995-02-17', 'https://randomuser.me/api/portraits/men/13.jpg', 'Civil Engineer', 'Muslim', 'Pathan', v_user_id);

    -- User 23: Dhruv Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.verma.23@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Verma', 'High School', 54652.98, 166.13, 'Male', '1982-02-09', 'https://randomuser.me/api/portraits/men/12.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 24: Harsh Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.tiwari.24@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Tiwari', 'PhD', 81499.91, 164.38, 'Male', '1988-01-27', 'https://randomuser.me/api/portraits/men/77.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    -- User 25: Ananya Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.agarwal.25@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Agarwal', 'High School', 113331.23, 152.66, 'Female', '1986-08-20', 'https://randomuser.me/api/portraits/women/3.jpg', 'Chartered Accountant', 'Muslim', 'Ansari', v_user_id);

    -- User 26: Advait Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.menon.26@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Menon', 'PhD', 198138.38, 170.5, 'Male', '2004-12-22', 'https://randomuser.me/api/portraits/men/58.jpg', 'Designer', 'Hindu', 'Jat', v_user_id);

    -- User 27: Sai Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.roy.27@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Roy', 'Master's', 85794.46, 163.12, 'Male', '2001-03-06', 'https://randomuser.me/api/portraits/men/100.jpg', 'Electrical Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 28: Rohan Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.garg.28@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Garg', 'Master's', 186084.74, 167.42, 'Male', '1990-04-03', 'https://randomuser.me/api/portraits/men/86.jpg', 'Electrical Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 29: Chirag Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.reddy.29@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Reddy', 'Bachelor's', 131339.7, 172.57, 'Male', '1985-07-27', 'https://randomuser.me/api/portraits/men/31.jpg', 'Accountant', 'Buddhist', 'Mahar', v_user_id);

    -- User 30: Tanish Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.mishra.30@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Mishra', 'High School', 30832.02, 189.21, 'Male', '1988-10-13', 'https://randomuser.me/api/portraits/men/18.jpg', 'Dentist', 'Buddhist', 'Chamar', v_user_id);

    -- User 31: Riya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.singh.31@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Singh', 'PhD', 142199.01, 153.79, 'Female', '1987-02-13', 'https://randomuser.me/api/portraits/women/53.jpg', 'Data Analyst', 'Muslim', 'Syed', v_user_id);

    -- User 32: Sakshi Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.srivastava.32@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Srivastava', 'High School', 119726.16, 153.44, 'Female', '1980-10-01', 'https://randomuser.me/api/portraits/women/17.jpg', 'Civil Servant', 'Sikh', 'Arora', v_user_id);

    -- User 33: Ila Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.iyer.33@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Iyer', 'Master's', 39061.43, 158.62, 'Female', '1994-01-09', 'https://randomuser.me/api/portraits/women/93.jpg', 'Chartered Accountant', 'Sikh', 'Arora', v_user_id);

    -- User 34: Sai Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.malhotra.34@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Malhotra', 'PhD', 105300.42, 172.08, 'Male', '1992-06-24', 'https://randomuser.me/api/portraits/men/94.jpg', 'Designer', 'Sikh', 'Arora', v_user_id);

    -- User 35: Shaurya Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.iyer.35@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Iyer', 'PhD', 164522.54, 162.26, 'Male', '2002-02-23', 'https://randomuser.me/api/portraits/men/56.jpg', 'Interior Designer', 'Jain', 'Shrimal', v_user_id);

    -- User 36: Kabir Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.chatterjee.36@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Chatterjee', 'Master's', 80868.02, 174.37, 'Male', '2000-10-21', 'https://randomuser.me/api/portraits/men/100.jpg', 'Nurse', 'Hindu', 'Jat', v_user_id);

    -- User 37: Aryan Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.agarwal.37@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Agarwal', 'High School', 198730.83, 171.66, 'Male', '2001-12-18', 'https://randomuser.me/api/portraits/men/60.jpg', 'Project Manager', 'Muslim', 'Pathan', v_user_id);

    -- User 38: Sara Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.bhattacharya.38@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Bhattacharya', 'Bachelor's', 47364.54, 170.59, 'Female', '1994-06-20', 'https://randomuser.me/api/portraits/women/66.jpg', 'Sales Executive', 'Muslim', 'Syed', v_user_id);

    -- User 39: Darsh Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.bhat.39@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Bhat', 'Master's', 60525.27, 185.69, 'Male', '2002-05-26', 'https://randomuser.me/api/portraits/men/69.jpg', 'Entrepreneur', 'Jain', 'Porwal', v_user_id);

    -- User 40: Krishna Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.pandey.40@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Pandey', 'Bachelor's', 50644.74, 189.34, 'Male', '1985-03-22', 'https://randomuser.me/api/portraits/men/44.jpg', 'Accountant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 41: Advait Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.singh.41@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Singh', 'Master's', 156123.87, 189.43, 'Male', '1985-11-05', 'https://randomuser.me/api/portraits/men/8.jpg', 'Consultant', 'Hindu', 'Baniya', v_user_id);

    -- User 42: Aarav Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.chaudhary.42@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Chaudhary', 'PhD', 165081.71, 186.57, 'Male', '1984-08-12', 'https://randomuser.me/api/portraits/men/63.jpg', 'Chartered Accountant', 'Sikh', 'Jat', v_user_id);

    -- User 43: Rudra Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.ghosh.43@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Ghosh', 'Bachelor's', 90474.45, 163.06, 'Male', '1989-04-13', 'https://randomuser.me/api/portraits/men/91.jpg', 'Professor', 'Muslim', 'Pathan', v_user_id);

    -- User 44: Aditya Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.mishra.44@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Mishra', 'High School', 189025.43, 183.41, 'Male', '1987-08-18', 'https://randomuser.me/api/portraits/men/17.jpg', 'Banker', 'Muslim', 'Pathan', v_user_id);

    -- User 45: Kiara Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.srivastava.45@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Srivastava', 'High School', 54019.3, 173.2, 'Female', '1987-02-19', 'https://randomuser.me/api/portraits/women/90.jpg', 'Banker', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 46: Atharv Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.pandey.46@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Pandey', 'Bachelor's', 49497.35, 170.04, 'Male', '1984-08-09', 'https://randomuser.me/api/portraits/men/70.jpg', 'Teacher', 'Jain', 'Oswal', v_user_id);

    -- User 47: Shaurya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.mehta.47@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Mehta', 'High School', 31540.31, 169.62, 'Male', '1988-09-13', 'https://randomuser.me/api/portraits/men/26.jpg', 'Lawyer', 'Muslim', 'Ansari', v_user_id);

    -- User 48: Arman Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.garg.48@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Garg', 'High School', 34299.06, 172.21, 'Male', '1998-09-18', 'https://randomuser.me/api/portraits/men/36.jpg', 'Nurse', 'Muslim', 'Sheikh', v_user_id);

    -- User 49: Rahul Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.kapoor.49@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Kapoor', 'Bachelor's', 144228.16, 176.89, 'Male', '2003-01-26', 'https://randomuser.me/api/portraits/men/90.jpg', 'Project Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 50: Varun Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('varun.chauhan.50@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Varun', 'Chauhan', 'High School', 135407.76, 171.17, 'Male', '1984-01-21', 'https://randomuser.me/api/portraits/men/20.jpg', 'Interior Designer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 51: Lavanya Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.shah.51@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Shah', 'High School', 92776.73, 159.46, 'Female', '1984-03-01', 'https://randomuser.me/api/portraits/women/74.jpg', 'Data Analyst', 'Jain', 'Porwal', v_user_id);

    -- User 52: Riya Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.chaudhary.52@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Chaudhary', 'High School', 198886.49, 153.43, 'Female', '1991-11-03', 'https://randomuser.me/api/portraits/women/89.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 53: Atharv Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.das.53@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Das', 'Master's', 150515.47, 165.55, 'Male', '2000-01-22', 'https://randomuser.me/api/portraits/men/30.jpg', 'Data Analyst', 'Christian', 'Syrian Christian', v_user_id);

    -- User 54: Arjun Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.rao.54@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Rao', 'Bachelor's', 161838.1, 172.18, 'Male', '1994-01-03', 'https://randomuser.me/api/portraits/men/65.jpg', 'Accountant', 'Hindu', 'Vaishya', v_user_id);

    -- User 55: Ansh Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.shukla.55@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Shukla', 'Master's', 67275.76, 175.95, 'Male', '1998-05-02', 'https://randomuser.me/api/portraits/men/53.jpg', 'Nurse', 'Hindu', 'Shudra', v_user_id);

    -- User 56: Tara Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.nair.56@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Nair', 'PhD', 58162.28, 153.05, 'Female', '1985-04-16', 'https://randomuser.me/api/portraits/women/60.jpg', 'Product Manager', 'Sikh', 'Jat', v_user_id);

    -- User 57: Shreya Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.joshi.57@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Joshi', 'PhD', 74932.98, 173.77, 'Female', '2004-01-24', 'https://randomuser.me/api/portraits/women/28.jpg', 'Civil Servant', 'Buddhist', 'Chamar', v_user_id);

    -- User 58: Naksh Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.mukherjee.58@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Mukherjee', 'PhD', 43231.45, 189.44, 'Male', '1995-02-23', 'https://randomuser.me/api/portraits/men/44.jpg', 'Sales Executive', 'Jain', 'Shrimal', v_user_id);

    -- User 59: Yash Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.sinha.59@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Sinha', 'Bachelor's', 143422.13, 181.64, 'Male', '1991-11-13', 'https://randomuser.me/api/portraits/men/82.jpg', 'Nurse', 'Hindu', 'Vaishya', v_user_id);

    -- User 60: Piyush Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.srivastava.60@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Srivastava', 'PhD', 162381.49, 177.54, 'Male', '1981-11-25', 'https://randomuser.me/api/portraits/men/16.jpg', 'Entrepreneur', 'Hindu', 'Kshatriya', v_user_id);

    -- User 61: Navya Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.rathore.61@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Rathore', 'High School', 181714.46, 153.69, 'Female', '1982-05-03', 'https://randomuser.me/api/portraits/women/86.jpg', 'Interior Designer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 62: Rudra Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.bhattacharya.62@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Bhattacharya', 'High School', 169272.83, 167.41, 'Male', '1995-04-24', 'https://randomuser.me/api/portraits/men/40.jpg', 'Government Officer', 'Jain', 'Oswal', v_user_id);

    -- User 63: Zara Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.sen.63@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Sen', 'High School', 72515.69, 171.5, 'Female', '1997-10-17', 'https://randomuser.me/api/portraits/women/45.jpg', 'Operations Manager', 'Muslim', 'Pathan', v_user_id);

    -- User 64: Ishaan Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.ghosh.64@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Ghosh', 'High School', 72873.36, 176.28, 'Male', '1983-07-25', 'https://randomuser.me/api/portraits/men/11.jpg', 'Accountant', 'Buddhist', 'Chamar', v_user_id);

    -- User 65: Navya Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.chatterjee.65@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Chatterjee', 'Bachelor's', 40860.41, 173.01, 'Female', '1989-07-23', 'https://randomuser.me/api/portraits/women/56.jpg', 'Business Owner', 'Sikh', 'Arora', v_user_id);

    -- User 66: Laksh Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.sen.66@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Sen', 'Bachelor's', 117778.2, 162.5, 'Male', '2004-02-10', 'https://randomuser.me/api/portraits/men/52.jpg', 'Civil Engineer', 'Jain', 'Porwal', v_user_id);

    -- User 67: Om Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('om.agarwal.67@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Om', 'Agarwal', 'High School', 167951.97, 168.14, 'Male', '1980-04-03', 'https://randomuser.me/api/portraits/men/90.jpg', 'Consultant', 'Buddhist', 'Chamar', v_user_id);

    -- User 68: Ansh Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.shah.68@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Shah', 'Master's', 152964.8, 161.81, 'Male', '2002-08-24', 'https://randomuser.me/api/portraits/men/47.jpg', 'Pilot', 'Sikh', 'Kamboj', v_user_id);

    -- User 69: Aayansh Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.srivastava.69@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Srivastava', 'Bachelor's', 64577.43, 161.38, 'Male', '2004-01-25', 'https://randomuser.me/api/portraits/men/89.jpg', 'Product Manager', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 70: Kavya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.singh.70@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Singh', 'PhD', 144588.39, 157.35, 'Female', '1997-02-19', 'https://randomuser.me/api/portraits/women/36.jpg', 'Fashion Designer', 'Jain', 'Agarwal', v_user_id);

    -- User 71: Pooja Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.roy.71@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Roy', 'Bachelor's', 191929.14, 170.09, 'Female', '1985-02-14', 'https://randomuser.me/api/portraits/women/66.jpg', 'Chartered Accountant', 'Jain', 'Porwal', v_user_id);

    -- User 72: Dev Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.dutta.72@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Dutta', 'Bachelor's', 70354.94, 167.22, 'Male', '1988-02-11', 'https://randomuser.me/api/portraits/men/68.jpg', 'Doctor', 'Jain', 'Agarwal', v_user_id);

    -- User 73: Sai Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.verma.73@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Verma', 'High School', 195653.78, 170.8, 'Male', '1996-01-20', 'https://randomuser.me/api/portraits/men/1.jpg', 'Business Owner', 'Christian', 'Latin Catholic', v_user_id);

    -- User 74: Karan Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.joshi.74@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Joshi', 'Master's', 90883.89, 166.65, 'Male', '1997-12-28', 'https://randomuser.me/api/portraits/men/7.jpg', 'Marketing Manager', 'Sikh', 'Arora', v_user_id);

    -- User 75: Aditya Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.shah.75@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Shah', 'PhD', 189974.4, 170.8, 'Male', '1991-10-04', 'https://randomuser.me/api/portraits/men/74.jpg', 'Electrical Engineer', 'Muslim', 'Pathan', v_user_id);

    -- User 76: Piyush Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.thakur.76@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Thakur', 'PhD', 135089.65, 167.1, 'Male', '1991-09-28', 'https://randomuser.me/api/portraits/men/29.jpg', 'Product Manager', 'Muslim', 'Sheikh', v_user_id);

    -- User 77: Nisha Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nisha.dubey.77@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nisha', 'Dubey', 'PhD', 100176.07, 160.22, 'Female', '2003-10-08', 'https://randomuser.me/api/portraits/women/41.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 78: Aayansh Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.patel.78@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Patel', 'PhD', 121741.33, 171.23, 'Male', '1986-03-16', 'https://randomuser.me/api/portraits/men/97.jpg', 'Content Writer', 'Jain', 'Oswal', v_user_id);

    -- User 79: Dhruv Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.singh.79@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Singh', 'High School', 145879.65, 177.09, 'Male', '1990-10-17', 'https://randomuser.me/api/portraits/men/77.jpg', 'Civil Engineer', 'Sikh', 'Kamboj', v_user_id);

    -- User 80: Pooja Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.srivastava.80@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Srivastava', 'Master's', 130384.92, 153.27, 'Female', '1987-03-22', 'https://randomuser.me/api/portraits/women/61.jpg', 'Photographer', 'Buddhist', 'Mahar', v_user_id);

    -- User 81: Ananya Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.ghosh.81@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Ghosh', 'Bachelor's', 184453.83, 167.22, 'Female', '1984-02-21', 'https://randomuser.me/api/portraits/women/91.jpg', 'Pilot', 'Hindu', 'Shudra', v_user_id);

    -- User 82: Shreya Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.dutta.82@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Dutta', 'PhD', 157686.44, 162.97, 'Female', '1987-10-20', 'https://randomuser.me/api/portraits/women/34.jpg', 'Teacher', 'Jain', 'Porwal', v_user_id);

    -- User 83: Karan Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.agarwal.83@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Agarwal', 'Master's', 52389.24, 189.6, 'Male', '1998-07-26', 'https://randomuser.me/api/portraits/men/93.jpg', 'Financial Analyst', 'Sikh', 'Arora', v_user_id);

    -- User 84: Laksh Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.ghosh.84@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Ghosh', 'Master's', 98038.93, 170.82, 'Male', '1996-10-27', 'https://randomuser.me/api/portraits/men/16.jpg', 'Civil Servant', 'Christian', 'Syrian Christian', v_user_id);

    -- User 85: Natasha Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.ali.85@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Ali', 'PhD', 67981.07, 155.99, 'Female', '2003-07-22', 'https://randomuser.me/api/portraits/women/73.jpg', 'Entrepreneur', 'Hindu', 'Baniya', v_user_id);

    -- User 86: Pari Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.pillai.86@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Pillai', 'Bachelor's', 89620.09, 151.91, 'Female', '2003-01-21', 'https://randomuser.me/api/portraits/women/98.jpg', 'Doctor', 'Sikh', 'Kamboj', v_user_id);

    -- User 87: Reyansh Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.ghosh.87@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Ghosh', 'PhD', 73123.17, 176.64, 'Male', '1987-02-04', 'https://randomuser.me/api/portraits/men/50.jpg', 'Software Engineer', 'Sikh', 'Kamboj', v_user_id);

    -- User 88: Neha Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('neha.agarwal.88@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Neha', 'Agarwal', 'PhD', 167779.26, 164.71, 'Female', '1993-06-03', 'https://randomuser.me/api/portraits/women/42.jpg', 'Pharmacist', 'Muslim', 'Syed', v_user_id);

    -- User 89: Lavanya Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.ghosh.89@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Ghosh', 'PhD', 85864.34, 152.23, 'Female', '1991-05-05', 'https://randomuser.me/api/portraits/women/52.jpg', 'Designer', 'Jain', 'Oswal', v_user_id);

    -- User 90: Jasmine Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.bhattacharya.90@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Bhattacharya', 'Master's', 114203.12, 154.14, 'Female', '1983-11-27', 'https://randomuser.me/api/portraits/women/18.jpg', 'Designer', 'Buddhist', 'Mahar', v_user_id);

    -- User 91: Priya Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('priya.ghosh.91@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Priya', 'Ghosh', 'Master's', 64745.37, 155.91, 'Female', '1995-01-11', 'https://randomuser.me/api/portraits/women/27.jpg', 'Software Engineer', 'Sikh', 'Kamboj', v_user_id);

    -- User 92: Rohan Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.jain.92@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Jain', 'Bachelor's', 34887.47, 175.78, 'Male', '1999-03-01', 'https://randomuser.me/api/portraits/men/29.jpg', 'Nurse', 'Jain', 'Oswal', v_user_id);

    -- User 93: Aditi Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.rao.93@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Rao', 'PhD', 149499.66, 164.24, 'Female', '1985-04-11', 'https://randomuser.me/api/portraits/women/40.jpg', 'Government Officer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 94: Prisha Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.ali.94@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Ali', 'Bachelor's', 135289.03, 156.86, 'Female', '1989-07-08', 'https://randomuser.me/api/portraits/women/44.jpg', 'Teacher', 'Muslim', 'Pathan', v_user_id);

    -- User 95: Atharv Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.mehta.95@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Mehta', 'Master's', 65257.42, 162.26, 'Male', '1991-03-04', 'https://randomuser.me/api/portraits/men/95.jpg', 'Fashion Designer', 'Jain', 'Agarwal', v_user_id);

    -- User 96: Natasha Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.kaur.96@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Kaur', 'High School', 165546.8, 172.14, 'Female', '2002-07-28', 'https://randomuser.me/api/portraits/women/42.jpg', 'Fashion Designer', 'Hindu', 'Kayastha', v_user_id);

    -- User 97: Sai Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.sharma.97@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Sharma', 'Bachelor's', 79857.16, 170.61, 'Male', '1996-01-10', 'https://randomuser.me/api/portraits/men/81.jpg', 'Designer', 'Sikh', 'Arora', v_user_id);

    -- User 98: Shaurya Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.kaur.98@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Kaur', 'Bachelor's', 176490.12, 187.32, 'Male', '1983-12-17', 'https://randomuser.me/api/portraits/men/88.jpg', 'Business Owner', 'Muslim', 'Qureshi', v_user_id);

    -- User 99: Sneha Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.shah.99@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Shah', 'PhD', 45784.0, 171.72, 'Female', '1986-02-27', 'https://randomuser.me/api/portraits/women/26.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    -- User 100: Zara Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.reddy.100@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Reddy', 'High School', 172602.92, 150.94, 'Female', '1987-08-11', 'https://randomuser.me/api/portraits/women/2.jpg', 'Software Engineer', 'Muslim', 'Sheikh', v_user_id);

    -- Completed 100 profiles

    -- User 101: Chirag Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.verma.101@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Verma', 'Master's', 92903.74, 178.79, 'Male', '1995-07-02', 'https://randomuser.me/api/portraits/men/19.jpg', 'Pharmacist', 'Sikh', 'Jat', v_user_id);

    -- User 102: Vivaan Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.tiwari.102@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Tiwari', 'Bachelor's', 94395.78, 187.1, 'Male', '2000-07-05', 'https://randomuser.me/api/portraits/men/40.jpg', 'Professor', 'Christian', 'Protestant', v_user_id);

    -- User 103: Vivaan Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.iyer.103@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Iyer', 'PhD', 56631.64, 176.84, 'Male', '1991-12-07', 'https://randomuser.me/api/portraits/men/15.jpg', 'Pilot', 'Buddhist', 'Mahar', v_user_id);

    -- User 104: Pooja Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.shah.104@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Shah', 'Master's', 45084.88, 159.01, 'Female', '1998-08-27', 'https://randomuser.me/api/portraits/women/69.jpg', 'Sales Executive', 'Hindu', 'Jat', v_user_id);

    -- User 105: Kriti Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.das.105@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Das', 'High School', 139518.96, 170.56, 'Female', '1993-11-13', 'https://randomuser.me/api/portraits/women/10.jpg', 'Pilot', 'Jain', 'Shrimal', v_user_id);

    -- User 106: Kiara Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.patel.106@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Patel', 'Master's', 119195.35, 162.29, 'Female', '1983-01-10', 'https://randomuser.me/api/portraits/women/76.jpg', 'Researcher', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 107: Vivaan Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.sharma.107@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Sharma', 'PhD', 88506.22, 170.23, 'Male', '1999-09-24', 'https://randomuser.me/api/portraits/men/33.jpg', 'Photographer', 'Jain', 'Porwal', v_user_id);

    -- User 108: Karthik Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.nair.108@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Nair', 'Master's', 120340.75, 181.01, 'Male', '1988-01-19', 'https://randomuser.me/api/portraits/men/31.jpg', 'Banker', 'Jain', 'Oswal', v_user_id);

    -- User 109: Diya Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.thakur.109@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Thakur', 'Bachelor's', 108694.58, 169.04, 'Female', '1999-07-07', 'https://randomuser.me/api/portraits/women/3.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    -- User 110: Nikhil Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.ali.110@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Ali', 'High School', 172662.6, 182.68, 'Male', '1989-10-22', 'https://randomuser.me/api/portraits/men/50.jpg', 'Professor', 'Christian', 'Protestant', v_user_id);

    -- User 111: Ansh Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.kumar.111@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Kumar', 'Bachelor's', 142377.23, 162.41, 'Male', '1988-04-02', 'https://randomuser.me/api/portraits/men/31.jpg', 'Interior Designer', 'Hindu', 'Kayastha', v_user_id);

    -- User 112: Meera Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.sen.112@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Sen', 'Bachelor's', 121430.65, 172.97, 'Female', '1993-02-05', 'https://randomuser.me/api/portraits/women/20.jpg', 'Designer', 'Jain', 'Porwal', v_user_id);

    -- User 113: Param Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.mukherjee.113@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Mukherjee', 'PhD', 94510.38, 183.2, 'Male', '1996-01-25', 'https://randomuser.me/api/portraits/men/86.jpg', 'Entrepreneur', 'Hindu', 'Brahmin', v_user_id);

    -- User 114: Karan Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.ghosh.114@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Ghosh', 'High School', 153289.47, 162.25, 'Male', '1993-12-09', 'https://randomuser.me/api/portraits/men/6.jpg', 'Civil Servant', 'Muslim', 'Sheikh', v_user_id);

    -- User 115: Aadhya Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.kumar.115@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Kumar', 'Master's', 115484.43, 155.5, 'Female', '2002-10-26', 'https://randomuser.me/api/portraits/women/19.jpg', 'Chef', 'Christian', 'Latin Catholic', v_user_id);

    -- User 116: Vivaan Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.joshi.116@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Joshi', 'High School', 145866.22, 171.92, 'Male', '1993-07-11', 'https://randomuser.me/api/portraits/men/44.jpg', 'Photographer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 117: Anjali Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.bhat.117@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Bhat', 'PhD', 94205.25, 157.33, 'Female', '1985-04-28', 'https://randomuser.me/api/portraits/women/36.jpg', 'Sales Executive', 'Hindu', 'Jat', v_user_id);

    -- User 118: Param Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.desai.118@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Desai', 'Bachelor's', 161333.83, 164.55, 'Male', '1997-02-16', 'https://randomuser.me/api/portraits/men/80.jpg', 'Doctor', 'Jain', 'Agarwal', v_user_id);

    -- User 119: Sai Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.malhotra.119@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Malhotra', 'Bachelor's', 70992.97, 186.16, 'Male', '1985-11-03', 'https://randomuser.me/api/portraits/men/73.jpg', 'Architect', 'Christian', 'Roman Catholic', v_user_id);

    -- User 120: Vihaan Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.dutta.120@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Dutta', 'Master's', 97876.39, 162.15, 'Male', '2000-02-20', 'https://randomuser.me/api/portraits/men/75.jpg', 'Researcher', 'Christian', 'Latin Catholic', v_user_id);

    -- User 121: Jiya Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.chauhan.121@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Chauhan', 'High School', 36446.69, 174.94, 'Female', '1982-10-17', 'https://randomuser.me/api/portraits/women/86.jpg', 'Operations Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 122: Ananya Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.verma.122@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Verma', 'High School', 73289.94, 156.23, 'Female', '1989-08-02', 'https://randomuser.me/api/portraits/women/92.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    -- User 123: Akash Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.bansal.123@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Bansal', 'High School', 160609.13, 168.16, 'Male', '1990-01-25', 'https://randomuser.me/api/portraits/men/40.jpg', 'Nurse', 'Buddhist', 'Mahar', v_user_id);

    -- User 124: Anushka Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.shukla.124@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Shukla', 'Master's', 30884.06, 158.55, 'Female', '1998-07-25', 'https://randomuser.me/api/portraits/women/45.jpg', 'Product Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 125: Tara Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.dutta.125@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Dutta', 'High School', 71205.84, 156.52, 'Female', '1984-02-25', 'https://randomuser.me/api/portraits/women/35.jpg', 'Content Writer', 'Jain', 'Porwal', v_user_id);

    -- User 126: Myra Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('myra.nair.126@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Myra', 'Nair', 'PhD', 179989.32, 166.18, 'Female', '1983-11-13', 'https://randomuser.me/api/portraits/women/99.jpg', 'Designer', 'Muslim', 'Pathan', v_user_id);

    -- User 127: Sara Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.shah.127@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Shah', 'High School', 70902.28, 151.2, 'Female', '1997-09-10', 'https://randomuser.me/api/portraits/women/40.jpg', 'Pharmacist', 'Buddhist', 'Mahar', v_user_id);

    -- User 128: Shreya Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.chatterjee.128@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Chatterjee', 'PhD', 73730.2, 161.22, 'Female', '1986-08-10', 'https://randomuser.me/api/portraits/women/88.jpg', 'Doctor', 'Sikh', 'Arora', v_user_id);

    -- User 129: Kiara Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.reddy.129@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Reddy', 'Bachelor's', 191981.85, 159.26, 'Female', '1981-03-21', 'https://randomuser.me/api/portraits/women/56.jpg', 'Government Officer', 'Sikh', 'Kamboj', v_user_id);

    -- User 130: Rahul Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.rao.130@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Rao', 'High School', 142176.19, 164.28, 'Male', '1981-08-10', 'https://randomuser.me/api/portraits/men/2.jpg', 'Chef', 'Hindu', 'Baniya', v_user_id);

    -- User 131: Yash Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.nair.131@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Nair', 'Bachelor's', 155977.45, 165.23, 'Male', '1991-03-15', 'https://randomuser.me/api/portraits/men/19.jpg', 'Lawyer', 'Sikh', 'Arora', v_user_id);

    -- User 132: Siya Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.tiwari.132@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Tiwari', 'PhD', 81781.42, 156.63, 'Female', '1991-07-21', 'https://randomuser.me/api/portraits/women/80.jpg', 'Teacher', 'Muslim', 'Syed', v_user_id);

    -- User 133: Mira Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('mira.bhattacharya.133@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Mira', 'Bhattacharya', 'High School', 60965.47, 170.43, 'Female', '1991-09-15', 'https://randomuser.me/api/portraits/women/81.jpg', 'Mechanical Engineer', 'Muslim', 'Sheikh', v_user_id);

    -- User 134: Disha Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.bhattacharya.134@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Bhattacharya', 'PhD', 53009.43, 160.58, 'Female', '1993-12-19', 'https://randomuser.me/api/portraits/women/81.jpg', 'Dentist', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 135: Rohan Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.singh.135@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Singh', 'PhD', 142111.64, 177.71, 'Male', '1991-01-05', 'https://randomuser.me/api/portraits/men/75.jpg', 'Business Owner', 'Sikh', 'Arora', v_user_id);

    -- User 136: Aayansh Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.ali.136@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Ali', 'Master's', 87320.5, 187.9, 'Male', '2004-03-01', 'https://randomuser.me/api/portraits/men/32.jpg', 'Teacher', 'Muslim', 'Syed', v_user_id);

    -- User 137: Tara Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.bansal.137@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Bansal', 'High School', 57575.21, 173.36, 'Female', '1985-11-22', 'https://randomuser.me/api/portraits/women/5.jpg', 'Data Analyst', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 138: Gauri Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.verma.138@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Verma', 'Master's', 33584.53, 171.49, 'Female', '1995-06-05', 'https://randomuser.me/api/portraits/women/52.jpg', 'Electrical Engineer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 139: Saanvi Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.desai.139@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Desai', 'Master's', 77902.3, 165.89, 'Female', '1986-08-24', 'https://randomuser.me/api/portraits/women/62.jpg', 'Chef', 'Jain', 'Porwal', v_user_id);

    -- User 140: Yash Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.dutta.140@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Dutta', 'High School', 86918.83, 176.48, 'Male', '1993-06-02', 'https://randomuser.me/api/portraits/men/36.jpg', 'Photographer', 'Buddhist', 'Chamar', v_user_id);

    -- User 141: Tara Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.menon.141@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Menon', 'Master's', 59086.95, 172.12, 'Female', '1996-06-20', 'https://randomuser.me/api/portraits/women/61.jpg', 'Project Manager', 'Muslim', 'Syed', v_user_id);

    -- User 142: Ila Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.yadav.142@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Yadav', 'PhD', 44415.97, 163.12, 'Female', '1983-02-15', 'https://randomuser.me/api/portraits/women/56.jpg', 'Banker', 'Hindu', 'Rajput', v_user_id);

    -- User 143: Riya Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.sharma.143@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Sharma', 'Bachelor's', 140795.18, 164.16, 'Female', '1988-02-16', 'https://randomuser.me/api/portraits/women/96.jpg', 'Banker', 'Hindu', 'Baniya', v_user_id);

    -- User 144: Isha Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.dutta.144@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Dutta', 'High School', 36747.12, 158.42, 'Female', '2001-06-20', 'https://randomuser.me/api/portraits/women/82.jpg', 'Chartered Accountant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 145: Aryan Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.saxena.145@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Saxena', 'Master's', 47812.92, 187.01, 'Male', '1989-03-15', 'https://randomuser.me/api/portraits/men/10.jpg', 'Accountant', 'Jain', 'Agarwal', v_user_id);

    -- User 146: Aaradhya Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.garg.146@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Garg', 'Master's', 64817.33, 158.97, 'Female', '1996-10-07', 'https://randomuser.me/api/portraits/women/100.jpg', 'Software Engineer', 'Jain', 'Shrimal', v_user_id);

    -- User 147: Advait Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.shah.147@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Shah', 'Bachelor's', 100751.34, 173.85, 'Male', '1992-01-03', 'https://randomuser.me/api/portraits/men/84.jpg', 'Photographer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 148: Aryan Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.kaur.148@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Kaur', 'High School', 195525.08, 162.61, 'Male', '2004-01-07', 'https://randomuser.me/api/portraits/men/15.jpg', 'Accountant', 'Hindu', 'Kayastha', v_user_id);

    -- User 149: Piyush Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.kapoor.149@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Kapoor', 'PhD', 167025.87, 164.11, 'Male', '1987-04-15', 'https://randomuser.me/api/portraits/men/4.jpg', 'Fashion Designer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 150: Arjun Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.yadav.150@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Yadav', 'High School', 68225.22, 173.78, 'Male', '1981-03-06', 'https://randomuser.me/api/portraits/men/66.jpg', 'Mechanical Engineer', 'Christian', 'Protestant', v_user_id);

    -- User 151: Sara Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.sharma.151@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Sharma', 'Bachelor's', 68537.77, 154.77, 'Female', '1996-10-21', 'https://randomuser.me/api/portraits/women/29.jpg', 'Data Analyst', 'Christian', 'Latin Catholic', v_user_id);

    -- User 152: Zara Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.pandey.152@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Pandey', 'PhD', 162132.62, 160.26, 'Female', '2001-08-26', 'https://randomuser.me/api/portraits/women/82.jpg', 'Business Owner', 'Sikh', 'Kamboj', v_user_id);

    -- User 153: Arjun Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.gupta.153@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Gupta', 'High School', 198159.12, 169.04, 'Male', '2000-06-04', 'https://randomuser.me/api/portraits/men/38.jpg', 'Entrepreneur', 'Hindu', 'Shudra', v_user_id);

    -- User 154: Kritika Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.jain.154@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Jain', 'PhD', 90953.63, 153.1, 'Female', '2002-09-09', 'https://randomuser.me/api/portraits/women/86.jpg', 'Interior Designer', 'Muslim', 'Sheikh', v_user_id);

    -- User 155: Aditi Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.shukla.155@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Shukla', 'Master's', 96873.7, 151.64, 'Female', '2004-05-24', 'https://randomuser.me/api/portraits/women/37.jpg', 'Lawyer', 'Muslim', 'Syed', v_user_id);

    -- User 156: Shaurya Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.tiwari.156@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Tiwari', 'High School', 66467.8, 176.68, 'Male', '1981-06-11', 'https://randomuser.me/api/portraits/men/58.jpg', 'Professor', 'Buddhist', 'Mahar', v_user_id);

    -- User 157: Param Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.das.157@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Das', 'PhD', 140440.09, 163.67, 'Male', '1983-03-25', 'https://randomuser.me/api/portraits/men/95.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 158: Darsh Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.rathore.158@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Rathore', 'High School', 30733.53, 174.5, 'Male', '1985-05-02', 'https://randomuser.me/api/portraits/men/15.jpg', 'Banker', 'Christian', 'Syrian Christian', v_user_id);

    -- User 159: Om Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('om.tiwari.159@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Om', 'Tiwari', 'PhD', 44694.79, 176.18, 'Male', '1997-05-17', 'https://randomuser.me/api/portraits/men/87.jpg', 'Doctor', 'Sikh', 'Arora', v_user_id);

    -- User 160: Lavanya Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.chopra.160@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Chopra', 'Bachelor's', 178537.9, 174.03, 'Female', '1988-06-18', 'https://randomuser.me/api/portraits/women/9.jpg', 'Banker', 'Buddhist', 'Mahar', v_user_id);

    -- User 161: Aarush Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.iyer.161@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Iyer', 'Master's', 81414.62, 165.71, 'Male', '1983-04-22', 'https://randomuser.me/api/portraits/men/38.jpg', 'Architect', 'Sikh', 'Jat', v_user_id);

    -- User 162: Pihu Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.joshi.162@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Joshi', 'PhD', 154528.42, 173.71, 'Female', '1994-08-18', 'https://randomuser.me/api/portraits/women/88.jpg', 'Pharmacist', 'Jain', 'Oswal', v_user_id);

    -- User 163: Navya Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.agarwal.163@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Agarwal', 'High School', 169131.58, 175.0, 'Female', '1990-02-20', 'https://randomuser.me/api/portraits/women/4.jpg', 'Operations Manager', 'Muslim', 'Ansari', v_user_id);

    -- User 164: Aditya Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.sinha.164@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Sinha', 'High School', 112118.92, 172.3, 'Male', '1980-03-23', 'https://randomuser.me/api/portraits/men/3.jpg', 'Fashion Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 165: Advik Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.kumar.165@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Kumar', 'Master's', 169458.69, 160.51, 'Male', '1992-10-05', 'https://randomuser.me/api/portraits/men/57.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    -- User 166: Rahul Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.bhattacharya.166@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Bhattacharya', 'High School', 105431.25, 182.77, 'Male', '1990-07-09', 'https://randomuser.me/api/portraits/men/80.jpg', 'Pharmacist', 'Christian', 'Syrian Christian', v_user_id);

    -- User 167: Aryan Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.garg.167@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Garg', 'PhD', 33204.67, 167.73, 'Male', '1990-11-22', 'https://randomuser.me/api/portraits/men/36.jpg', 'Project Manager', 'Muslim', 'Sheikh', v_user_id);

    -- User 168: Manav Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.pandey.168@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Pandey', 'Bachelor's', 112336.94, 183.98, 'Male', '1980-04-13', 'https://randomuser.me/api/portraits/men/81.jpg', 'Banker', 'Muslim', 'Sheikh', v_user_id);

    -- User 169: Madhav Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.mishra.169@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Mishra', 'PhD', 144382.94, 184.84, 'Male', '1987-05-11', 'https://randomuser.me/api/portraits/men/30.jpg', 'Business Owner', 'Christian', 'Protestant', v_user_id);

    -- User 170: Sneha Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.ali.170@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Ali', 'Master's', 167191.64, 163.82, 'Female', '2003-02-19', 'https://randomuser.me/api/portraits/women/96.jpg', 'Lawyer', 'Jain', 'Agarwal', v_user_id);

    -- User 171: Arjun Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.chaudhary.171@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Chaudhary', 'High School', 34024.23, 164.4, 'Male', '2002-11-03', 'https://randomuser.me/api/portraits/men/69.jpg', 'Financial Analyst', 'Jain', 'Shrimal', v_user_id);

    -- User 172: Kiara Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.bhattacharya.172@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Bhattacharya', 'Bachelor's', 32810.57, 171.72, 'Female', '1988-11-09', 'https://randomuser.me/api/portraits/women/32.jpg', 'Pharmacist', 'Christian', 'Protestant', v_user_id);

    -- User 173: Avni Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('avni.iyer.173@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Avni', 'Iyer', 'Bachelor's', 179206.24, 164.82, 'Female', '1983-02-19', 'https://randomuser.me/api/portraits/women/38.jpg', 'Fashion Designer', 'Christian', 'Protestant', v_user_id);

    -- User 174: Pooja Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.malhotra.174@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Malhotra', 'Bachelor's', 123270.26, 173.21, 'Female', '2000-12-02', 'https://randomuser.me/api/portraits/women/9.jpg', 'Professor', 'Hindu', 'Rajput', v_user_id);

    -- User 175: Karthik Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.dubey.175@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Dubey', 'PhD', 132144.3, 187.57, 'Male', '1980-07-14', 'https://randomuser.me/api/portraits/men/6.jpg', 'Dentist', 'Christian', 'Latin Catholic', v_user_id);

    -- User 176: Riddhi Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.kaur.176@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Kaur', 'Bachelor's', 165693.6, 173.44, 'Female', '1998-07-15', 'https://randomuser.me/api/portraits/women/52.jpg', 'Lawyer', 'Hindu', 'Kayastha', v_user_id);

    -- User 177: Anika Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.kaur.177@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Kaur', 'Master's', 65360.12, 158.21, 'Female', '1987-10-11', 'https://randomuser.me/api/portraits/women/96.jpg', 'Marketing Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 178: Pari Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.mehta.178@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Mehta', 'Master's', 128405.24, 152.14, 'Female', '1986-01-25', 'https://randomuser.me/api/portraits/women/91.jpg', 'Professor', 'Jain', 'Oswal', v_user_id);

    -- User 179: Chirag Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.sinha.179@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Sinha', 'Bachelor's', 110898.47, 167.48, 'Male', '2001-07-05', 'https://randomuser.me/api/portraits/men/1.jpg', 'Mechanical Engineer', 'Muslim', 'Pathan', v_user_id);

    -- User 180: Sai Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.menon.180@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Menon', 'Bachelor's', 159472.8, 162.25, 'Male', '1983-10-17', 'https://randomuser.me/api/portraits/men/17.jpg', 'Mechanical Engineer', 'Muslim', 'Sheikh', v_user_id);

    -- User 181: Aditi Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.saxena.181@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Saxena', 'High School', 108133.91, 165.08, 'Female', '2004-05-12', 'https://randomuser.me/api/portraits/women/90.jpg', 'Photographer', 'Buddhist', 'Mahar', v_user_id);

    -- User 182: Piyush Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.pandey.182@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Pandey', 'PhD', 187698.76, 189.45, 'Male', '1994-03-28', 'https://randomuser.me/api/portraits/men/21.jpg', 'Financial Analyst', 'Christian', 'Roman Catholic', v_user_id);

    -- User 183: Daksh Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.reddy.183@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Reddy', 'PhD', 46700.4, 180.01, 'Male', '1998-02-28', 'https://randomuser.me/api/portraits/men/32.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    -- User 184: Aarav Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.kapoor.184@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Kapoor', 'Bachelor's', 174095.3, 171.95, 'Male', '2000-02-07', 'https://randomuser.me/api/portraits/men/32.jpg', 'Mechanical Engineer', 'Muslim', 'Syed', v_user_id);

    -- User 185: Jiya Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.rathore.185@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Rathore', 'Bachelor's', 149052.67, 154.8, 'Female', '1997-11-21', 'https://randomuser.me/api/portraits/women/83.jpg', 'Nurse', 'Christian', 'Protestant', v_user_id);

    -- User 186: Advik Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.sharma.186@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Sharma', 'High School', 56676.71, 184.62, 'Male', '2004-10-07', 'https://randomuser.me/api/portraits/men/82.jpg', 'Professor', 'Hindu', 'Baniya', v_user_id);

    -- User 187: Angel Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.joshi.187@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Joshi', 'Master's', 193916.79, 172.98, 'Female', '2001-05-12', 'https://randomuser.me/api/portraits/women/53.jpg', 'Civil Servant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 188: Dev Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.bhat.188@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Bhat', 'Bachelor's', 143432.6, 176.77, 'Male', '1998-08-10', 'https://randomuser.me/api/portraits/men/35.jpg', 'Researcher', 'Hindu', 'Kshatriya', v_user_id);

    -- User 189: Pari Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.dutta.189@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Dutta', 'Master's', 85207.65, 155.73, 'Female', '1990-05-27', 'https://randomuser.me/api/portraits/women/64.jpg', 'Doctor', 'Hindu', 'Vaishya', v_user_id);

    -- User 190: Prisha Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.rao.190@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Rao', 'Bachelor's', 84436.76, 173.18, 'Female', '1991-03-11', 'https://randomuser.me/api/portraits/women/46.jpg', 'Lawyer', 'Muslim', 'Qureshi', v_user_id);

    -- User 191: Harsh Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.gupta.191@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Gupta', 'Bachelor's', 96494.56, 174.18, 'Male', '1991-07-02', 'https://randomuser.me/api/portraits/men/12.jpg', 'Operations Manager', 'Hindu', 'Kshatriya', v_user_id);

    -- User 192: Dhruv Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.rao.192@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Rao', 'PhD', 172395.13, 173.0, 'Male', '1990-11-26', 'https://randomuser.me/api/portraits/men/36.jpg', 'Interior Designer', 'Muslim', 'Pathan', v_user_id);

    -- User 193: Vivaan Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.pandey.193@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Pandey', 'High School', 100525.92, 170.64, 'Male', '1987-01-08', 'https://randomuser.me/api/portraits/men/47.jpg', 'Dentist', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 194: Aayansh Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.yadav.194@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Yadav', 'Bachelor's', 92945.02, 172.9, 'Male', '1985-06-10', 'https://randomuser.me/api/portraits/men/67.jpg', 'Civil Servant', 'Jain', 'Agarwal', v_user_id);

    -- User 195: Khushi Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('khushi.mehta.195@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Khushi', 'Mehta', 'PhD', 50929.28, 155.29, 'Female', '1998-12-24', 'https://randomuser.me/api/portraits/women/46.jpg', 'Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 196: Rohan Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.rao.196@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Rao', 'Master's', 150763.17, 182.18, 'Male', '1985-04-17', 'https://randomuser.me/api/portraits/men/44.jpg', 'Business Owner', 'Sikh', 'Kamboj', v_user_id);

    -- User 197: Anushka Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.garg.197@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Garg', 'Master's', 59624.8, 150.09, 'Female', '1989-05-05', 'https://randomuser.me/api/portraits/women/34.jpg', 'Interior Designer', 'Jain', 'Agarwal', v_user_id);

    -- User 198: Natasha Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.kaur.198@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Kaur', 'High School', 90152.46, 156.4, 'Female', '2002-07-05', 'https://randomuser.me/api/portraits/women/60.jpg', 'HR Manager', 'Jain', 'Agarwal', v_user_id);

    -- User 199: Anushka Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.sen.199@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Sen', 'Bachelor's', 63291.38, 155.92, 'Female', '2004-05-16', 'https://randomuser.me/api/portraits/women/79.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    -- User 200: Angel Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.verma.200@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Verma', 'Bachelor's', 169374.61, 155.32, 'Female', '1987-04-21', 'https://randomuser.me/api/portraits/women/48.jpg', 'Product Manager', 'Buddhist', 'Chamar', v_user_id);

    -- Completed 200 profiles

    -- User 201: Gauri Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.chakraborty.201@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Chakraborty', 'Master's', 121296.33, 160.23, 'Female', '1988-04-13', 'https://randomuser.me/api/portraits/women/13.jpg', 'Architect', 'Jain', 'Shrimal', v_user_id);

    -- User 202: Reyansh Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.roy.202@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Roy', 'Master's', 91895.26, 184.63, 'Male', '1988-12-20', 'https://randomuser.me/api/portraits/men/27.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    -- User 203: Kriti Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.shah.203@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Shah', 'Master's', 109272.94, 165.06, 'Female', '1991-05-24', 'https://randomuser.me/api/portraits/women/95.jpg', 'Nurse', 'Christian', 'Latin Catholic', v_user_id);

    -- User 204: Rahul Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.sen.204@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Sen', 'Bachelor's', 170636.75, 161.47, 'Male', '2002-03-19', 'https://randomuser.me/api/portraits/men/71.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    -- User 205: Lavanya Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.garg.205@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Garg', 'PhD', 146707.39, 170.49, 'Female', '1991-03-10', 'https://randomuser.me/api/portraits/women/74.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    -- User 206: Aaradhya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.nair.206@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Nair', 'Master's', 35270.34, 161.44, 'Female', '1992-03-16', 'https://randomuser.me/api/portraits/women/69.jpg', 'Project Manager', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 207: Kritika Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.reddy.207@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Reddy', 'High School', 86794.43, 168.52, 'Female', '1987-02-22', 'https://randomuser.me/api/portraits/women/9.jpg', 'Product Manager', 'Buddhist', 'Chamar', v_user_id);

    -- User 208: Tanvi Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanvi.nair.208@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanvi', 'Nair', 'Bachelor's', 168681.12, 162.01, 'Female', '1993-11-06', 'https://randomuser.me/api/portraits/women/69.jpg', 'HR Manager', 'Muslim', 'Syed', v_user_id);

    -- User 209: Sai Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.srivastava.209@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Srivastava', 'Bachelor's', 174962.03, 189.96, 'Male', '1992-11-12', 'https://randomuser.me/api/portraits/men/69.jpg', 'Pilot', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 210: Ishaan Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.malhotra.210@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Malhotra', 'Bachelor's', 142995.37, 166.5, 'Male', '1982-12-18', 'https://randomuser.me/api/portraits/men/29.jpg', 'Photographer', 'Jain', 'Porwal', v_user_id);

    -- User 211: Aarush Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.pillai.211@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Pillai', 'PhD', 157665.5, 169.0, 'Male', '1994-12-27', 'https://randomuser.me/api/portraits/men/30.jpg', 'Chef', 'Christian', 'Protestant', v_user_id);

    -- User 212: Shreya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.nair.212@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Nair', 'High School', 98760.09, 162.07, 'Female', '1997-10-19', 'https://randomuser.me/api/portraits/women/91.jpg', 'Pilot', 'Sikh', 'Jat', v_user_id);

    -- User 213: Dhruv Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.pillai.213@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Pillai', 'High School', 194043.09, 176.55, 'Male', '1990-03-08', 'https://randomuser.me/api/portraits/men/29.jpg', 'Civil Servant', 'Jain', 'Shrimal', v_user_id);

    -- User 214: Shaurya Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.ghosh.214@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Ghosh', 'High School', 92860.0, 187.78, 'Male', '1991-10-21', 'https://randomuser.me/api/portraits/men/52.jpg', 'Accountant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 215: Reyansh Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.nair.215@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Nair', 'PhD', 180074.02, 172.06, 'Male', '2000-02-11', 'https://randomuser.me/api/portraits/men/26.jpg', 'Dentist', 'Sikh', 'Kamboj', v_user_id);

    -- User 216: Karan Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.mukherjee.216@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Mukherjee', 'Master's', 142395.65, 184.39, 'Male', '1997-09-06', 'https://randomuser.me/api/portraits/men/15.jpg', 'Researcher', 'Buddhist', 'Chamar', v_user_id);

    -- User 217: Tara Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.das.217@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Das', 'Bachelor's', 151690.25, 167.3, 'Female', '1990-02-17', 'https://randomuser.me/api/portraits/women/51.jpg', 'Professor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 218: Harsh Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.thakur.218@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Thakur', 'High School', 33700.33, 165.96, 'Male', '1987-05-25', 'https://randomuser.me/api/portraits/men/46.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    -- User 219: Aditya Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.agarwal.219@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Agarwal', 'Bachelor's', 196906.49, 162.97, 'Male', '1995-06-22', 'https://randomuser.me/api/portraits/men/20.jpg', 'Doctor', 'Jain', 'Porwal', v_user_id);

    -- User 220: Anjali Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.malhotra.220@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Malhotra', 'PhD', 123169.05, 157.29, 'Female', '1991-07-27', 'https://randomuser.me/api/portraits/women/85.jpg', 'Chef', 'Christian', 'Syrian Christian', v_user_id);

    -- User 221: Maya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.singh.221@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Singh', 'PhD', 44092.62, 160.07, 'Female', '1992-06-01', 'https://randomuser.me/api/portraits/women/29.jpg', 'Pharmacist', 'Christian', 'Protestant', v_user_id);

    -- User 222: Isha Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.bansal.222@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Bansal', 'Master's', 35602.7, 165.44, 'Female', '2000-06-13', 'https://randomuser.me/api/portraits/women/11.jpg', 'Civil Servant', 'Hindu', 'Brahmin', v_user_id);

    -- User 223: Riddhi Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.mukherjee.223@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Mukherjee', 'High School', 168657.64, 163.92, 'Female', '1983-07-11', 'https://randomuser.me/api/portraits/women/23.jpg', 'Software Engineer', 'Muslim', 'Sheikh', v_user_id);

    -- User 224: Prisha Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.tiwari.224@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Tiwari', 'Master's', 125061.98, 174.7, 'Female', '1990-01-16', 'https://randomuser.me/api/portraits/women/11.jpg', 'Lawyer', 'Muslim', 'Syed', v_user_id);

    -- User 225: Saanvi Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.bhat.225@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Bhat', 'Master's', 36411.63, 169.92, 'Female', '1983-02-05', 'https://randomuser.me/api/portraits/women/71.jpg', 'Product Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 226: Param Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.desai.226@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Desai', 'Master's', 127965.66, 167.02, 'Male', '1995-04-11', 'https://randomuser.me/api/portraits/men/74.jpg', 'Product Manager', 'Muslim', 'Sheikh', v_user_id);

    -- User 227: Karthik Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.desai.227@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Desai', 'High School', 193164.59, 167.45, 'Male', '2002-11-02', 'https://randomuser.me/api/portraits/men/47.jpg', 'Civil Engineer', 'Muslim', 'Ansari', v_user_id);

    -- User 228: Arnav Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.roy.228@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Roy', 'Bachelor's', 189584.11, 187.97, 'Male', '1996-07-14', 'https://randomuser.me/api/portraits/men/95.jpg', 'Fashion Designer', 'Sikh', 'Arora', v_user_id);

    -- User 229: Siya Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.ghosh.229@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Ghosh', 'High School', 112626.41, 160.27, 'Female', '2000-10-21', 'https://randomuser.me/api/portraits/women/65.jpg', 'Consultant', 'Hindu', 'Baniya', v_user_id);

    -- User 230: Angel Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.ghosh.230@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Ghosh', 'Master's', 91290.27, 159.37, 'Female', '1998-07-15', 'https://randomuser.me/api/portraits/women/99.jpg', 'Government Officer', 'Muslim', 'Qureshi', v_user_id);

    -- User 231: Rudra Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.sharma.231@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Sharma', 'PhD', 48790.69, 181.27, 'Male', '2002-01-27', 'https://randomuser.me/api/portraits/men/29.jpg', 'Doctor', 'Buddhist', 'Mahar', v_user_id);

    -- User 232: Akash Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.rao.232@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Rao', 'Master's', 69464.02, 179.32, 'Male', '1995-03-12', 'https://randomuser.me/api/portraits/men/76.jpg', 'Interior Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 233: Dhruv Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.chaudhary.233@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Chaudhary', 'Bachelor's', 155187.42, 166.62, 'Male', '2000-01-24', 'https://randomuser.me/api/portraits/men/34.jpg', 'Consultant', 'Jain', 'Shrimal', v_user_id);

    -- User 234: Advait Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.bhat.234@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Bhat', 'High School', 60184.59, 168.46, 'Male', '1986-11-11', 'https://randomuser.me/api/portraits/men/95.jpg', 'Civil Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 235: Harsh Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.bhat.235@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Bhat', 'Master's', 170964.28, 161.34, 'Male', '1980-03-26', 'https://randomuser.me/api/portraits/men/5.jpg', 'Architect', 'Muslim', 'Ansari', v_user_id);

    -- User 236: Ananya Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.ali.236@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Ali', 'Master's', 191128.97, 159.2, 'Female', '1992-07-12', 'https://randomuser.me/api/portraits/women/32.jpg', 'Dentist', 'Sikh', 'Jat', v_user_id);

    -- User 237: Om Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('om.thakur.237@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Om', 'Thakur', 'High School', 73682.33, 189.74, 'Male', '1999-04-06', 'https://randomuser.me/api/portraits/men/91.jpg', 'Entrepreneur', 'Sikh', 'Kamboj', v_user_id);

    -- User 238: Laksh Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.mehta.238@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Mehta', 'Bachelor's', 71902.72, 179.63, 'Male', '1984-01-13', 'https://randomuser.me/api/portraits/men/80.jpg', 'Product Manager', 'Jain', 'Oswal', v_user_id);

    -- User 239: Akash Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.kapoor.239@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Kapoor', 'PhD', 90814.77, 174.44, 'Male', '2004-05-09', 'https://randomuser.me/api/portraits/men/82.jpg', 'Accountant', 'Muslim', 'Qureshi', v_user_id);

    -- User 240: Ishita Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.garg.240@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Garg', 'PhD', 43958.82, 166.26, 'Female', '1995-03-02', 'https://randomuser.me/api/portraits/women/15.jpg', 'Photographer', 'Buddhist', 'Chamar', v_user_id);

    -- User 241: Diya Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.dutta.241@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Dutta', 'High School', 95447.61, 172.99, 'Female', '1995-10-06', 'https://randomuser.me/api/portraits/women/39.jpg', 'Architect', 'Muslim', 'Qureshi', v_user_id);

    -- User 242: Manav Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.chakraborty.242@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Chakraborty', 'High School', 112848.79, 177.75, 'Male', '2003-11-28', 'https://randomuser.me/api/portraits/men/89.jpg', 'Project Manager', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 243: Arnav Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.ali.243@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Ali', 'Master's', 66759.23, 180.85, 'Male', '2002-08-02', 'https://randomuser.me/api/portraits/men/97.jpg', 'Lawyer', 'Muslim', 'Ansari', v_user_id);

    -- User 244: Laksh Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.shah.244@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Shah', 'High School', 143718.46, 173.59, 'Male', '1984-12-20', 'https://randomuser.me/api/portraits/men/89.jpg', 'Chef', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 245: Vihaan Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.mukherjee.245@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Mukherjee', 'Bachelor's', 66740.29, 172.91, 'Male', '1982-04-13', 'https://randomuser.me/api/portraits/men/64.jpg', 'Electrical Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 246: Chirag Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.tiwari.246@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Tiwari', 'Master's', 105996.17, 163.12, 'Male', '1987-05-08', 'https://randomuser.me/api/portraits/men/79.jpg', 'Marketing Manager', 'Jain', 'Shrimal', v_user_id);

    -- User 247: Disha Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.chaudhary.247@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Chaudhary', 'High School', 154778.1, 150.22, 'Female', '1985-06-16', 'https://randomuser.me/api/portraits/women/66.jpg', 'Operations Manager', 'Muslim', 'Pathan', v_user_id);

    -- User 248: Ayaan Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ayaan.mukherjee.248@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ayaan', 'Mukherjee', 'PhD', 144557.41, 167.07, 'Male', '2001-03-26', 'https://randomuser.me/api/portraits/men/26.jpg', 'Teacher', 'Christian', 'Protestant', v_user_id);

    -- User 249: Saanvi Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.mishra.249@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Mishra', 'PhD', 69046.2, 171.08, 'Female', '1984-10-25', 'https://randomuser.me/api/portraits/women/43.jpg', 'Accountant', 'Hindu', 'Vaishya', v_user_id);

    -- User 250: Kiara Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.saxena.250@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Saxena', 'PhD', 167050.46, 155.4, 'Female', '1981-06-22', 'https://randomuser.me/api/portraits/women/64.jpg', 'Interior Designer', 'Hindu', 'Brahmin', v_user_id);

    -- User 251: Saanvi Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.pillai.251@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Pillai', 'PhD', 189690.21, 171.81, 'Female', '1993-11-23', 'https://randomuser.me/api/portraits/women/98.jpg', 'Researcher', 'Christian', 'Latin Catholic', v_user_id);

    -- User 252: Natasha Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.bansal.252@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Bansal', 'High School', 134604.98, 167.45, 'Female', '1993-01-25', 'https://randomuser.me/api/portraits/women/60.jpg', 'Consultant', 'Muslim', 'Sheikh', v_user_id);

    -- User 253: Disha Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.dubey.253@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Dubey', 'PhD', 112216.57, 156.62, 'Female', '1997-08-23', 'https://randomuser.me/api/portraits/women/13.jpg', 'Photographer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 254: Navya Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.roy.254@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Roy', 'High School', 78240.92, 156.48, 'Female', '1993-12-12', 'https://randomuser.me/api/portraits/women/27.jpg', 'Pilot', 'Hindu', 'Baniya', v_user_id);

    -- User 255: Krishna Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.roy.255@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Roy', 'Bachelor's', 170553.96, 188.04, 'Male', '1991-05-14', 'https://randomuser.me/api/portraits/men/48.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    -- User 256: Mira Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('mira.saxena.256@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Mira', 'Saxena', 'PhD', 84917.5, 172.77, 'Female', '1983-05-10', 'https://randomuser.me/api/portraits/women/70.jpg', 'Dentist', 'Sikh', 'Arora', v_user_id);

    -- User 257: Piyush Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.bose.257@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Bose', 'Master's', 131489.69, 186.19, 'Male', '2000-01-06', 'https://randomuser.me/api/portraits/men/95.jpg', 'Chef', 'Jain', 'Oswal', v_user_id);

    -- User 258: Jiya Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.thakur.258@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Thakur', 'Bachelor's', 153522.64, 159.5, 'Female', '2000-03-09', 'https://randomuser.me/api/portraits/women/97.jpg', 'Financial Analyst', 'Hindu', 'Shudra', v_user_id);

    -- User 259: Shlok Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.chatterjee.259@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Chatterjee', 'Master's', 140348.93, 188.61, 'Male', '1996-10-25', 'https://randomuser.me/api/portraits/men/34.jpg', 'Interior Designer', 'Buddhist', 'Mahar', v_user_id);

    -- User 260: Sai Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.gupta.260@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Gupta', 'PhD', 52792.24, 178.48, 'Male', '1981-08-20', 'https://randomuser.me/api/portraits/men/93.jpg', 'Researcher', 'Sikh', 'Jat', v_user_id);

    -- User 261: Atharv Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.saxena.261@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Saxena', 'Master's', 152040.63, 173.12, 'Male', '2004-08-17', 'https://randomuser.me/api/portraits/men/67.jpg', 'Content Writer', 'Hindu', 'Vaishya', v_user_id);

    -- User 262: Daksh Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.roy.262@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Roy', 'High School', 196575.56, 179.49, 'Male', '1988-08-06', 'https://randomuser.me/api/portraits/men/86.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    -- User 263: Ananya Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.dutta.263@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Dutta', 'PhD', 100169.67, 151.41, 'Female', '1989-02-08', 'https://randomuser.me/api/portraits/women/5.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    -- User 264: Aadhya Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.pillai.264@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Pillai', 'Bachelor's', 46456.55, 154.59, 'Female', '1999-03-21', 'https://randomuser.me/api/portraits/women/85.jpg', 'Operations Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 265: Laksh Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.sinha.265@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Sinha', 'PhD', 185879.77, 170.25, 'Male', '1985-06-14', 'https://randomuser.me/api/portraits/men/92.jpg', 'Government Officer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 266: Yash Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.pillai.266@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Pillai', 'Master's', 61843.68, 169.96, 'Male', '1982-08-11', 'https://randomuser.me/api/portraits/men/2.jpg', 'Chartered Accountant', 'Jain', 'Agarwal', v_user_id);

    -- User 267: Siya Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.sen.267@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Sen', 'PhD', 92187.68, 174.37, 'Female', '1992-06-16', 'https://randomuser.me/api/portraits/women/42.jpg', 'Doctor', 'Christian', 'Syrian Christian', v_user_id);

    -- User 268: Advik Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.sinha.268@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Sinha', 'Bachelor's', 116262.23, 162.85, 'Male', '1980-12-08', 'https://randomuser.me/api/portraits/men/82.jpg', 'Interior Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 269: Pari Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.thakur.269@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Thakur', 'High School', 92850.73, 161.68, 'Female', '1995-01-02', 'https://randomuser.me/api/portraits/women/74.jpg', 'Professor', 'Muslim', 'Ansari', v_user_id);

    -- User 270: Angel Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.srivastava.270@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Srivastava', 'PhD', 119648.54, 167.37, 'Female', '1998-09-14', 'https://randomuser.me/api/portraits/women/91.jpg', 'Business Owner', 'Jain', 'Oswal', v_user_id);

    -- User 271: Ila Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.patel.271@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Patel', 'Master's', 150076.23, 150.53, 'Female', '1985-04-13', 'https://randomuser.me/api/portraits/women/16.jpg', 'Teacher', 'Hindu', 'Baniya', v_user_id);

    -- User 272: Darsh Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.pandey.272@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Pandey', 'PhD', 189146.24, 188.47, 'Male', '1985-05-14', 'https://randomuser.me/api/portraits/men/3.jpg', 'Pilot', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 273: Aarush Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.malhotra.273@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Malhotra', 'PhD', 43407.8, 173.12, 'Male', '1998-12-27', 'https://randomuser.me/api/portraits/men/34.jpg', 'Marketing Manager', 'Sikh', 'Jat', v_user_id);

    -- User 274: Tara Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.iyer.274@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Iyer', 'Bachelor's', 167089.99, 167.91, 'Female', '2000-08-28', 'https://randomuser.me/api/portraits/women/64.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 275: Advik Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.reddy.275@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Reddy', 'PhD', 122855.37, 183.98, 'Male', '1989-04-24', 'https://randomuser.me/api/portraits/men/83.jpg', 'Architect', 'Christian', 'Protestant', v_user_id);

    -- User 276: Aarush Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.rathore.276@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Rathore', 'PhD', 126987.57, 184.03, 'Male', '1985-03-04', 'https://randomuser.me/api/portraits/men/64.jpg', 'Mechanical Engineer', 'Sikh', 'Kamboj', v_user_id);

    -- User 277: Arnav Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.malhotra.277@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Malhotra', 'Bachelor's', 83863.7, 187.69, 'Male', '1989-01-09', 'https://randomuser.me/api/portraits/men/43.jpg', 'Pharmacist', 'Buddhist', 'Mahar', v_user_id);

    -- User 278: Om Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('om.ghosh.278@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Om', 'Ghosh', 'Master's', 86013.76, 173.45, 'Male', '1980-06-21', 'https://randomuser.me/api/portraits/men/50.jpg', 'Data Analyst', 'Christian', 'Syrian Christian', v_user_id);

    -- User 279: Tanish Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.patel.279@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Patel', 'High School', 107092.37, 161.0, 'Male', '1995-12-20', 'https://randomuser.me/api/portraits/men/31.jpg', 'Chef', 'Hindu', 'Rajput', v_user_id);

    -- User 280: Karthik Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.mukherjee.280@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Mukherjee', 'High School', 60042.09, 179.96, 'Male', '2002-12-06', 'https://randomuser.me/api/portraits/men/38.jpg', 'Pharmacist', 'Jain', 'Porwal', v_user_id);

    -- User 281: Tanvi Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanvi.kumar.281@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanvi', 'Kumar', 'High School', 34621.39, 164.7, 'Female', '1994-01-06', 'https://randomuser.me/api/portraits/women/78.jpg', 'Operations Manager', 'Christian', 'Syrian Christian', v_user_id);

    -- User 282: Zara Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.gupta.282@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Gupta', 'PhD', 63983.34, 160.51, 'Female', '1993-02-24', 'https://randomuser.me/api/portraits/women/99.jpg', 'Mechanical Engineer', 'Hindu', 'Rajput', v_user_id);

    -- User 283: Kavya Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.ghosh.283@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Ghosh', 'Master's', 113109.72, 152.66, 'Female', '1987-03-07', 'https://randomuser.me/api/portraits/women/55.jpg', 'Entrepreneur', 'Christian', 'Latin Catholic', v_user_id);

    -- User 284: Priya Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('priya.malhotra.284@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Priya', 'Malhotra', 'High School', 191004.2, 167.98, 'Female', '1996-05-24', 'https://randomuser.me/api/portraits/women/90.jpg', 'Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 285: Vivaan Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.gupta.285@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Gupta', 'PhD', 76789.93, 167.49, 'Male', '1990-09-21', 'https://randomuser.me/api/portraits/men/75.jpg', 'HR Manager', 'Hindu', 'Shudra', v_user_id);

    -- User 286: Khushi Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('khushi.pillai.286@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Khushi', 'Pillai', 'High School', 31448.81, 152.7, 'Female', '2001-03-28', 'https://randomuser.me/api/portraits/women/86.jpg', 'Chef', 'Jain', 'Agarwal', v_user_id);

    -- User 287: Karthik Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.garg.287@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Garg', 'High School', 54655.61, 163.11, 'Male', '1988-05-16', 'https://randomuser.me/api/portraits/men/54.jpg', 'Photographer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 288: Aryan Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.dubey.288@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Dubey', 'Bachelor's', 40744.81, 164.6, 'Male', '1989-05-07', 'https://randomuser.me/api/portraits/men/28.jpg', 'Pharmacist', 'Muslim', 'Qureshi', v_user_id);

    -- User 289: Yash Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.sen.289@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Sen', 'Master's', 32433.76, 169.83, 'Male', '1981-02-27', 'https://randomuser.me/api/portraits/men/37.jpg', 'Civil Servant', 'Hindu', 'Kshatriya', v_user_id);

    -- User 290: Chirag Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.bhattacharya.290@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Bhattacharya', 'High School', 171789.06, 174.0, 'Male', '2003-03-27', 'https://randomuser.me/api/portraits/men/79.jpg', 'Civil Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 291: Akash Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.dutta.291@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Dutta', 'Bachelor's', 174687.15, 182.26, 'Male', '2000-08-03', 'https://randomuser.me/api/portraits/men/33.jpg', 'Project Manager', 'Buddhist', 'Chamar', v_user_id);

    -- User 292: Isha Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.joshi.292@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Joshi', 'Master's', 131680.07, 172.32, 'Female', '1991-04-24', 'https://randomuser.me/api/portraits/women/58.jpg', 'Pilot', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 293: Aarav Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.joshi.293@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Joshi', 'Bachelor's', 62988.14, 160.43, 'Male', '1981-12-14', 'https://randomuser.me/api/portraits/men/92.jpg', 'Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 294: Meera Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.shah.294@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Shah', 'Master's', 163813.48, 151.46, 'Female', '1984-06-13', 'https://randomuser.me/api/portraits/women/61.jpg', 'Civil Servant', 'Jain', 'Porwal', v_user_id);

    -- User 295: Aaradhya Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.reddy.295@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Reddy', 'Master's', 80992.37, 167.01, 'Female', '1982-08-21', 'https://randomuser.me/api/portraits/women/44.jpg', 'Marketing Manager', 'Buddhist', 'Mahar', v_user_id);

    -- User 296: Divya Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.rathore.296@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Rathore', 'Master's', 156017.94, 154.11, 'Female', '1986-06-17', 'https://randomuser.me/api/portraits/women/45.jpg', 'Doctor', 'Hindu', 'Kayastha', v_user_id);

    -- User 297: Diya Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.mishra.297@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Mishra', 'PhD', 129695.53, 169.55, 'Female', '1998-11-05', 'https://randomuser.me/api/portraits/women/37.jpg', 'Nurse', 'Christian', 'Protestant', v_user_id);

    -- User 298: Shanaya Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.mishra.298@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Mishra', 'PhD', 172173.73, 151.11, 'Female', '1986-11-27', 'https://randomuser.me/api/portraits/women/86.jpg', 'Accountant', 'Muslim', 'Syed', v_user_id);

    -- User 299: Pihu Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.shah.299@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Shah', 'PhD', 46429.64, 163.14, 'Female', '1986-11-11', 'https://randomuser.me/api/portraits/women/67.jpg', 'Researcher', 'Sikh', 'Kamboj', v_user_id);

    -- User 300: Tara Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.shah.300@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Shah', 'PhD', 134616.03, 160.72, 'Female', '1987-08-05', 'https://randomuser.me/api/portraits/women/65.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    -- Completed 300 profiles

    -- User 301: Kunal Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kunal.jain.301@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kunal', 'Jain', 'Master's', 154721.99, 166.9, 'Male', '1982-01-10', 'https://randomuser.me/api/portraits/men/17.jpg', 'Photographer', 'Jain', 'Agarwal', v_user_id);

    -- User 302: Sara Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.agarwal.302@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Agarwal', 'Bachelor's', 191888.53, 165.54, 'Female', '2001-05-17', 'https://randomuser.me/api/portraits/women/12.jpg', 'Pharmacist', 'Sikh', 'Arora', v_user_id);

    -- User 303: Tara Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.tiwari.303@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Tiwari', 'PhD', 191451.64, 157.8, 'Female', '1991-10-07', 'https://randomuser.me/api/portraits/women/83.jpg', 'Civil Engineer', 'Jain', 'Agarwal', v_user_id);

    -- User 304: Anjali Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.dutta.304@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Dutta', 'High School', 63458.54, 163.17, 'Female', '1993-12-24', 'https://randomuser.me/api/portraits/women/57.jpg', 'Project Manager', 'Buddhist', 'Mahar', v_user_id);

    -- User 305: Rahul Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.chopra.305@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Chopra', 'Master's', 79191.27, 168.09, 'Male', '2004-04-02', 'https://randomuser.me/api/portraits/men/63.jpg', 'Architect', 'Buddhist', 'Mahar', v_user_id);

    -- User 306: Rudra Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.dutta.306@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Dutta', 'Bachelor's', 54187.68, 187.93, 'Male', '1993-11-28', 'https://randomuser.me/api/portraits/men/70.jpg', 'Architect', 'Hindu', 'Rajput', v_user_id);

    -- User 307: Maya Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.joshi.307@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Joshi', 'PhD', 59218.48, 173.03, 'Female', '1990-01-13', 'https://randomuser.me/api/portraits/women/5.jpg', 'Designer', 'Hindu', 'Shudra', v_user_id);

    -- User 308: Kiara Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.bhat.308@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Bhat', 'Master's', 44806.42, 164.03, 'Female', '1993-05-22', 'https://randomuser.me/api/portraits/women/3.jpg', 'Financial Analyst', 'Jain', 'Porwal', v_user_id);

    -- User 309: Aayansh Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.kumar.309@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Kumar', 'Bachelor's', 179797.25, 172.19, 'Male', '1994-10-13', 'https://randomuser.me/api/portraits/men/19.jpg', 'Banker', 'Sikh', 'Arora', v_user_id);

    -- User 310: Dhruv Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.sinha.310@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Sinha', 'Bachelor's', 57016.51, 179.99, 'Male', '2001-10-02', 'https://randomuser.me/api/portraits/men/36.jpg', 'Banker', 'Hindu', 'Kayastha', v_user_id);

    -- User 311: Sai Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.ghosh.311@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Ghosh', 'Master's', 144617.57, 172.69, 'Male', '1984-10-06', 'https://randomuser.me/api/portraits/men/62.jpg', 'Marketing Manager', 'Jain', 'Oswal', v_user_id);

    -- User 312: Ansh Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.roy.312@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Roy', 'PhD', 46978.65, 165.54, 'Male', '2003-02-22', 'https://randomuser.me/api/portraits/men/7.jpg', 'Dentist', 'Jain', 'Porwal', v_user_id);

    -- User 313: Shaurya Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.mukherjee.313@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Mukherjee', 'Master's', 187381.5, 172.81, 'Male', '1990-06-08', 'https://randomuser.me/api/portraits/men/20.jpg', 'Lawyer', 'Muslim', 'Pathan', v_user_id);

    -- User 314: Disha Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.tiwari.314@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Tiwari', 'Bachelor's', 82983.6, 153.44, 'Female', '1997-03-02', 'https://randomuser.me/api/portraits/women/53.jpg', 'Entrepreneur', 'Hindu', 'Rajput', v_user_id);

    -- User 315: Kavya Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.reddy.315@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Reddy', 'Master's', 37478.49, 151.01, 'Female', '1994-11-15', 'https://randomuser.me/api/portraits/women/43.jpg', 'Chef', 'Hindu', 'Shudra', v_user_id);

    -- User 316: Ananya Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.sinha.316@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Sinha', 'PhD', 157045.44, 164.8, 'Female', '1989-09-05', 'https://randomuser.me/api/portraits/women/28.jpg', 'Mechanical Engineer', 'Jain', 'Porwal', v_user_id);

    -- User 317: Varun Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('varun.iyer.317@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Varun', 'Iyer', 'PhD', 82932.91, 165.22, 'Male', '2000-12-04', 'https://randomuser.me/api/portraits/men/50.jpg', 'Teacher', 'Buddhist', 'Chamar', v_user_id);

    -- User 318: Akash Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.shah.318@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Shah', 'Master's', 157038.31, 160.6, 'Male', '2003-02-08', 'https://randomuser.me/api/portraits/men/86.jpg', 'Civil Servant', 'Sikh', 'Jat', v_user_id);

    -- User 319: Riddhi Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.roy.319@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Roy', 'Bachelor's', 141946.17, 153.67, 'Female', '1996-05-13', 'https://randomuser.me/api/portraits/women/49.jpg', 'Business Owner', 'Jain', 'Oswal', v_user_id);

    -- User 320: Kavya Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.reddy.320@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Reddy', 'High School', 135842.08, 173.72, 'Female', '2000-06-10', 'https://randomuser.me/api/portraits/women/36.jpg', 'Chef', 'Jain', 'Porwal', v_user_id);

    -- User 321: Ila Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.kumar.321@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Kumar', 'High School', 129749.27, 171.73, 'Female', '1986-07-19', 'https://randomuser.me/api/portraits/women/5.jpg', 'Interior Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 322: Shlok Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.chatterjee.322@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Chatterjee', 'High School', 141265.63, 173.26, 'Male', '1985-07-03', 'https://randomuser.me/api/portraits/men/23.jpg', 'Chartered Accountant', 'Muslim', 'Qureshi', v_user_id);

    -- User 323: Rohan Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.shah.323@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Shah', 'PhD', 196816.68, 186.07, 'Male', '1986-09-13', 'https://randomuser.me/api/portraits/men/87.jpg', 'HR Manager', 'Hindu', 'Kshatriya', v_user_id);

    -- User 324: Jasmine Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.yadav.324@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Yadav', 'Bachelor's', 61304.04, 172.51, 'Female', '2001-03-11', 'https://randomuser.me/api/portraits/women/60.jpg', 'Electrical Engineer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 325: Pooja Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.shukla.325@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Shukla', 'Master's', 138437.53, 153.17, 'Female', '2002-06-10', 'https://randomuser.me/api/portraits/women/88.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    -- User 326: Meera Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.roy.326@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Roy', 'Master's', 31217.04, 157.67, 'Female', '1983-02-01', 'https://randomuser.me/api/portraits/women/71.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    -- User 327: Aaradhya Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.joshi.327@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Joshi', 'Master's', 43513.04, 171.25, 'Female', '1984-05-08', 'https://randomuser.me/api/portraits/women/63.jpg', 'Financial Analyst', 'Sikh', 'Arora', v_user_id);

    -- User 328: Anushka Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.ali.328@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Ali', 'PhD', 156501.7, 157.28, 'Female', '1996-01-09', 'https://randomuser.me/api/portraits/women/29.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    -- User 329: Disha Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.srivastava.329@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Srivastava', 'Bachelor's', 89548.64, 163.07, 'Female', '1981-01-28', 'https://randomuser.me/api/portraits/women/33.jpg', 'Chef', 'Jain', 'Shrimal', v_user_id);

    -- User 330: Madhav Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.sen.330@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Sen', 'PhD', 158023.66, 182.8, 'Male', '1986-03-28', 'https://randomuser.me/api/portraits/men/45.jpg', 'Nurse', 'Christian', 'Latin Catholic', v_user_id);

    -- User 331: Aryan Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.malhotra.331@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Malhotra', 'Bachelor's', 109491.96, 161.35, 'Male', '2004-09-10', 'https://randomuser.me/api/portraits/men/42.jpg', 'Consultant', 'Sikh', 'Arora', v_user_id);

    -- User 332: Nikhil Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.garg.332@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Garg', 'PhD', 95672.28, 161.72, 'Male', '1985-01-07', 'https://randomuser.me/api/portraits/men/15.jpg', 'Business Owner', 'Hindu', 'Baniya', v_user_id);

    -- User 333: Zara Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.gupta.333@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Gupta', 'High School', 159915.11, 154.84, 'Female', '1991-05-12', 'https://randomuser.me/api/portraits/women/92.jpg', 'Sales Executive', 'Hindu', 'Baniya', v_user_id);

    -- User 334: Anushka Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.pillai.334@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Pillai', 'Master's', 37725.1, 163.28, 'Female', '2001-01-05', 'https://randomuser.me/api/portraits/women/26.jpg', 'Doctor', 'Sikh', 'Kamboj', v_user_id);

    -- User 335: Sakshi Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.bansal.335@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Bansal', 'PhD', 50311.36, 151.94, 'Female', '1986-03-17', 'https://randomuser.me/api/portraits/women/2.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 336: Rishi Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rishi.thakur.336@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rishi', 'Thakur', 'High School', 49116.05, 184.84, 'Male', '1983-08-11', 'https://randomuser.me/api/portraits/men/51.jpg', 'Doctor', 'Hindu', 'Baniya', v_user_id);

    -- User 337: Karthik Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.saxena.337@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Saxena', 'High School', 51701.81, 188.61, 'Male', '2001-05-26', 'https://randomuser.me/api/portraits/men/60.jpg', 'Electrical Engineer', 'Muslim', 'Pathan', v_user_id);

    -- User 338: Chirag Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.saxena.338@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Saxena', 'High School', 45610.99, 177.56, 'Male', '1990-12-26', 'https://randomuser.me/api/portraits/men/17.jpg', 'Doctor', 'Jain', 'Porwal', v_user_id);

    -- User 339: Ayaan Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ayaan.chauhan.339@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ayaan', 'Chauhan', 'Bachelor's', 43524.74, 170.51, 'Male', '1987-08-10', 'https://randomuser.me/api/portraits/men/50.jpg', 'Data Analyst', 'Jain', 'Shrimal', v_user_id);

    -- User 340: Ishaan Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.rathore.340@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Rathore', 'High School', 158926.9, 171.76, 'Male', '1985-06-11', 'https://randomuser.me/api/portraits/men/31.jpg', 'Business Owner', 'Sikh', 'Jat', v_user_id);

    -- User 341: Karthik Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.sen.341@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Sen', 'Bachelor's', 111357.26, 176.54, 'Male', '1997-02-03', 'https://randomuser.me/api/portraits/men/33.jpg', 'Designer', 'Hindu', 'Rajput', v_user_id);

    -- User 342: Reyansh Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.pandey.342@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Pandey', 'Master's', 88815.24, 183.98, 'Male', '1991-07-08', 'https://randomuser.me/api/portraits/men/46.jpg', 'Financial Analyst', 'Sikh', 'Arora', v_user_id);

    -- User 343: Kiara Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.singh.343@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Singh', 'Bachelor's', 71140.16, 153.08, 'Female', '1995-12-01', 'https://randomuser.me/api/portraits/women/89.jpg', 'Civil Servant', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 344: Karan Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.kapoor.344@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Kapoor', 'Master's', 72160.82, 162.4, 'Male', '1983-04-27', 'https://randomuser.me/api/portraits/men/15.jpg', 'Photographer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 345: Rudra Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.rathore.345@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Rathore', 'Master's', 50023.2, 172.36, 'Male', '1988-10-06', 'https://randomuser.me/api/portraits/men/86.jpg', 'Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 346: Aarush Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.ghosh.346@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Ghosh', 'PhD', 71661.94, 163.03, 'Male', '1983-06-28', 'https://randomuser.me/api/portraits/men/8.jpg', 'Operations Manager', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 347: Ananya Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.yadav.347@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Yadav', 'Bachelor's', 32452.32, 166.25, 'Female', '2001-03-28', 'https://randomuser.me/api/portraits/women/38.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    -- User 348: Ayaan Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ayaan.mishra.348@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ayaan', 'Mishra', 'Master's', 178975.36, 185.25, 'Male', '1985-05-06', 'https://randomuser.me/api/portraits/men/12.jpg', 'Content Writer', 'Muslim', 'Qureshi', v_user_id);

    -- User 349: Nikhil Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.mukherjee.349@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Mukherjee', 'Master's', 66017.34, 183.17, 'Male', '1989-10-17', 'https://randomuser.me/api/portraits/men/21.jpg', 'Entrepreneur', 'Jain', 'Agarwal', v_user_id);

    -- User 350: Aarav Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.sinha.350@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Sinha', 'PhD', 176538.43, 187.16, 'Male', '1991-01-09', 'https://randomuser.me/api/portraits/men/83.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 351: Harsh Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.iyer.351@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Iyer', 'High School', 130162.98, 169.36, 'Male', '1980-11-22', 'https://randomuser.me/api/portraits/men/42.jpg', 'Software Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 352: Sneha Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.sinha.352@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Sinha', 'PhD', 72988.82, 158.28, 'Female', '1989-05-06', 'https://randomuser.me/api/portraits/women/60.jpg', 'Doctor', 'Christian', 'Syrian Christian', v_user_id);

    -- User 353: Maya Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.khan.353@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Khan', 'Bachelor's', 158522.84, 152.14, 'Female', '1980-12-10', 'https://randomuser.me/api/portraits/women/44.jpg', 'Civil Engineer', 'Christian', 'Protestant', v_user_id);

    -- User 354: Pooja Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.thakur.354@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Thakur', 'PhD', 67770.46, 165.73, 'Female', '1987-02-27', 'https://randomuser.me/api/portraits/women/54.jpg', 'Architect', 'Christian', 'Protestant', v_user_id);

    -- User 355: Isha Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.pandey.355@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Pandey', 'High School', 76408.67, 155.23, 'Female', '1987-07-28', 'https://randomuser.me/api/portraits/women/2.jpg', 'Banker', 'Christian', 'Syrian Christian', v_user_id);

    -- User 356: Sakshi Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.tiwari.356@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Tiwari', 'PhD', 127776.82, 164.23, 'Female', '1999-05-25', 'https://randomuser.me/api/portraits/women/92.jpg', 'Project Manager', 'Jain', 'Porwal', v_user_id);

    -- User 357: Siya Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.kapoor.357@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Kapoor', 'PhD', 195957.03, 169.79, 'Female', '1996-03-17', 'https://randomuser.me/api/portraits/women/14.jpg', 'Business Owner', 'Hindu', 'Baniya', v_user_id);

    -- User 358: Ishaan Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.verma.358@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Verma', 'PhD', 116872.95, 174.53, 'Male', '1991-03-06', 'https://randomuser.me/api/portraits/men/9.jpg', 'Banker', 'Christian', 'Latin Catholic', v_user_id);

    -- User 359: Daksh Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.yadav.359@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Yadav', 'High School', 123988.85, 175.71, 'Male', '1987-02-12', 'https://randomuser.me/api/portraits/men/8.jpg', 'Banker', 'Muslim', 'Pathan', v_user_id);

    -- User 360: Myra Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('myra.gupta.360@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Myra', 'Gupta', 'PhD', 52925.43, 173.17, 'Female', '1994-08-02', 'https://randomuser.me/api/portraits/women/4.jpg', 'Consultant', 'Sikh', 'Kamboj', v_user_id);

    -- User 361: Maya Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.menon.361@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Menon', 'PhD', 155155.12, 153.07, 'Female', '1995-12-21', 'https://randomuser.me/api/portraits/women/71.jpg', 'Pharmacist', 'Muslim', 'Syed', v_user_id);

    -- User 362: Aaradhya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.nair.362@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Nair', 'Bachelor's', 77807.57, 152.82, 'Female', '1994-02-18', 'https://randomuser.me/api/portraits/women/57.jpg', 'Business Owner', 'Sikh', 'Jat', v_user_id);

    -- User 363: Kavya Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.rathore.363@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Rathore', 'High School', 82117.55, 171.16, 'Female', '1987-02-12', 'https://randomuser.me/api/portraits/women/22.jpg', 'Interior Designer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 364: Pari Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.dutta.364@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Dutta', 'Bachelor's', 151135.53, 155.95, 'Female', '2004-09-02', 'https://randomuser.me/api/portraits/women/79.jpg', 'Sales Executive', 'Sikh', 'Kamboj', v_user_id);

    -- User 365: Harsh Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.agarwal.365@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Agarwal', 'Bachelor's', 152627.97, 174.81, 'Male', '1986-07-28', 'https://randomuser.me/api/portraits/men/58.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    -- User 366: Siya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.nair.366@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Nair', 'PhD', 70946.96, 150.66, 'Female', '1992-01-25', 'https://randomuser.me/api/portraits/women/82.jpg', 'Financial Analyst', 'Jain', 'Agarwal', v_user_id);

    -- User 367: Pranav Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.jain.367@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Jain', 'High School', 83844.28, 161.6, 'Male', '1986-08-10', 'https://randomuser.me/api/portraits/men/61.jpg', 'Nurse', 'Jain', 'Porwal', v_user_id);

    -- User 368: Kiaan Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.chaudhary.368@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Chaudhary', 'Bachelor's', 33502.39, 184.68, 'Male', '2003-05-24', 'https://randomuser.me/api/portraits/men/72.jpg', 'Data Analyst', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 369: Tanvi Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanvi.pillai.369@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanvi', 'Pillai', 'High School', 35005.24, 172.84, 'Female', '1995-01-06', 'https://randomuser.me/api/portraits/women/72.jpg', 'Interior Designer', 'Jain', 'Porwal', v_user_id);

    -- User 370: Daksh Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.agarwal.370@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Agarwal', 'Bachelor's', 116058.15, 173.56, 'Male', '1995-01-13', 'https://randomuser.me/api/portraits/men/95.jpg', 'Architect', 'Buddhist', 'Chamar', v_user_id);

    -- User 371: Krishna Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.verma.371@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Verma', 'High School', 72711.88, 180.06, 'Male', '1984-06-03', 'https://randomuser.me/api/portraits/men/34.jpg', 'Civil Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 372: Shreya Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.chauhan.372@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Chauhan', 'Bachelor's', 171033.94, 171.44, 'Female', '1992-01-03', 'https://randomuser.me/api/portraits/women/41.jpg', 'Architect', 'Hindu', 'Brahmin', v_user_id);

    -- User 373: Param Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.rathore.373@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Rathore', 'Master's', 167164.01, 185.34, 'Male', '1989-07-20', 'https://randomuser.me/api/portraits/men/53.jpg', 'Electrical Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 374: Aarush Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.rathore.374@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Rathore', 'High School', 41838.47, 180.59, 'Male', '2004-04-05', 'https://randomuser.me/api/portraits/men/39.jpg', 'Banker', 'Christian', 'Latin Catholic', v_user_id);

    -- User 375: Ansh Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.rathore.375@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Rathore', 'High School', 148035.53, 160.62, 'Male', '1980-04-09', 'https://randomuser.me/api/portraits/men/11.jpg', 'Dentist', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 376: Arjun Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.saxena.376@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Saxena', 'High School', 132025.44, 188.69, 'Male', '2001-10-15', 'https://randomuser.me/api/portraits/men/69.jpg', 'Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 377: Sakshi Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.rao.377@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Rao', 'High School', 90655.28, 152.0, 'Female', '1994-04-21', 'https://randomuser.me/api/portraits/women/97.jpg', 'Operations Manager', 'Hindu', 'Jat', v_user_id);

    -- User 378: Darsh Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.agarwal.378@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Agarwal', 'High School', 40868.24, 180.85, 'Male', '1999-07-11', 'https://randomuser.me/api/portraits/men/17.jpg', 'Chef', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 379: Advait Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.patel.379@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Patel', 'PhD', 197593.57, 162.23, 'Male', '1995-02-27', 'https://randomuser.me/api/portraits/men/97.jpg', 'Sales Executive', 'Hindu', 'Shudra', v_user_id);

    -- User 380: Kunal Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kunal.garg.380@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kunal', 'Garg', 'High School', 188769.46, 179.3, 'Male', '1990-10-04', 'https://randomuser.me/api/portraits/men/18.jpg', 'Electrical Engineer', 'Jain', 'Porwal', v_user_id);

    -- User 381: Neha Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('neha.pillai.381@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Neha', 'Pillai', 'PhD', 104056.32, 154.45, 'Female', '1990-07-24', 'https://randomuser.me/api/portraits/women/93.jpg', 'Doctor', 'Muslim', 'Pathan', v_user_id);

    -- User 382: Kiara Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.shukla.382@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Shukla', 'Master's', 35067.15, 169.53, 'Female', '2004-11-22', 'https://randomuser.me/api/portraits/women/53.jpg', 'Product Manager', 'Muslim', 'Qureshi', v_user_id);

    -- User 383: Pihu Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.mishra.383@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Mishra', 'High School', 104647.48, 166.54, 'Female', '1987-05-11', 'https://randomuser.me/api/portraits/women/85.jpg', 'Electrical Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 384: Shlok Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.ghosh.384@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Ghosh', 'High School', 171430.21, 162.4, 'Male', '1995-01-21', 'https://randomuser.me/api/portraits/men/40.jpg', 'Pharmacist', 'Sikh', 'Kamboj', v_user_id);

    -- User 385: Naksh Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.kumar.385@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Kumar', 'Master's', 157142.29, 166.92, 'Male', '1989-09-27', 'https://randomuser.me/api/portraits/men/89.jpg', 'Designer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 386: Rahul Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.chaudhary.386@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Chaudhary', 'High School', 133001.13, 170.63, 'Male', '2002-05-01', 'https://randomuser.me/api/portraits/men/78.jpg', 'Researcher', 'Hindu', 'Jat', v_user_id);

    -- User 387: Anjali Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.dubey.387@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Dubey', 'Bachelor's', 55388.25, 152.21, 'Female', '1987-01-27', 'https://randomuser.me/api/portraits/women/60.jpg', 'Researcher', 'Buddhist', 'Mahar', v_user_id);

    -- User 388: Isha Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.nair.388@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Nair', 'Master's', 183488.49, 161.32, 'Female', '1997-07-02', 'https://randomuser.me/api/portraits/women/18.jpg', 'Sales Executive', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 389: Disha Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.chakraborty.389@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Chakraborty', 'Master's', 96362.27, 152.28, 'Female', '2002-11-04', 'https://randomuser.me/api/portraits/women/5.jpg', 'Civil Servant', 'Hindu', 'Kshatriya', v_user_id);

    -- User 390: Dev Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.chopra.390@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Chopra', 'Master's', 82414.85, 172.66, 'Male', '2001-08-04', 'https://randomuser.me/api/portraits/men/93.jpg', 'Content Writer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 391: Naksh Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.kumar.391@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Kumar', 'PhD', 106508.98, 163.95, 'Male', '1989-03-02', 'https://randomuser.me/api/portraits/men/84.jpg', 'Project Manager', 'Hindu', 'Kayastha', v_user_id);

    -- User 392: Sneha Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.kumar.392@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Kumar', 'PhD', 93925.28, 170.1, 'Female', '1983-10-12', 'https://randomuser.me/api/portraits/women/15.jpg', 'Interior Designer', 'Sikh', 'Arora', v_user_id);

    -- User 393: Arman Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.srivastava.393@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Srivastava', 'Bachelor's', 30244.83, 161.15, 'Male', '1989-09-10', 'https://randomuser.me/api/portraits/men/8.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    -- User 394: Arnav Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.rathore.394@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Rathore', 'Bachelor's', 73073.85, 174.1, 'Male', '2004-08-09', 'https://randomuser.me/api/portraits/men/74.jpg', 'Operations Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 395: Madhav Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.chopra.395@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Chopra', 'High School', 49394.14, 176.41, 'Male', '1992-12-16', 'https://randomuser.me/api/portraits/men/31.jpg', 'Lawyer', 'Jain', 'Oswal', v_user_id);

    -- User 396: Arman Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.dutta.396@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Dutta', 'High School', 158362.52, 174.05, 'Male', '1985-07-02', 'https://randomuser.me/api/portraits/men/23.jpg', 'Content Writer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 397: Anjali Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.mishra.397@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Mishra', 'High School', 115717.24, 168.35, 'Female', '2000-07-13', 'https://randomuser.me/api/portraits/women/79.jpg', 'Product Manager', 'Hindu', 'Baniya', v_user_id);

    -- User 398: Tanvi Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanvi.menon.398@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanvi', 'Menon', 'Bachelor's', 148721.65, 157.23, 'Female', '2001-11-23', 'https://randomuser.me/api/portraits/women/44.jpg', 'Photographer', 'Buddhist', 'Mahar', v_user_id);

    -- User 399: Chirag Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.garg.399@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Garg', 'Master's', 134109.74, 177.73, 'Male', '1998-02-18', 'https://randomuser.me/api/portraits/men/17.jpg', 'Data Analyst', 'Sikh', 'Jat', v_user_id);

    -- User 400: Aryan Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.chatterjee.400@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Chatterjee', 'PhD', 70089.15, 176.4, 'Male', '1989-12-08', 'https://randomuser.me/api/portraits/men/82.jpg', 'Researcher', 'Sikh', 'Arora', v_user_id);

    -- Completed 400 profiles

    -- User 401: Aaradhya Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.rathore.401@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Rathore', 'PhD', 111488.73, 158.22, 'Female', '1981-01-02', 'https://randomuser.me/api/portraits/women/21.jpg', 'Financial Analyst', 'Jain', 'Agarwal', v_user_id);

    -- User 402: Ila Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.thakur.402@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Thakur', 'Bachelor's', 99414.51, 151.44, 'Female', '1989-12-08', 'https://randomuser.me/api/portraits/women/66.jpg', 'Doctor', 'Muslim', 'Pathan', v_user_id);

    -- User 403: Kriti Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.kumar.403@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Kumar', 'High School', 111122.37, 166.77, 'Female', '1988-11-20', 'https://randomuser.me/api/portraits/women/30.jpg', 'Photographer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 404: Pranav Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.jain.404@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Jain', 'High School', 145350.17, 181.25, 'Male', '1991-07-06', 'https://randomuser.me/api/portraits/men/47.jpg', 'Researcher', 'Muslim', 'Pathan', v_user_id);

    -- User 405: Tanish Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.tiwari.405@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Tiwari', 'Bachelor's', 140788.05, 167.89, 'Male', '1991-06-26', 'https://randomuser.me/api/portraits/men/22.jpg', 'Teacher', 'Hindu', 'Jat', v_user_id);

    -- User 406: Diya Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.gupta.406@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Gupta', 'High School', 153148.37, 160.68, 'Female', '1993-12-19', 'https://randomuser.me/api/portraits/women/12.jpg', 'Professor', 'Sikh', 'Kamboj', v_user_id);

    -- User 407: Sara Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.bhat.407@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Bhat', 'Bachelor's', 196528.39, 163.57, 'Female', '2000-05-12', 'https://randomuser.me/api/portraits/women/5.jpg', 'Doctor', 'Buddhist', 'Mahar', v_user_id);

    -- User 408: Natasha Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.gupta.408@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Gupta', 'High School', 151779.85, 173.33, 'Female', '2000-01-27', 'https://randomuser.me/api/portraits/women/39.jpg', 'Interior Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 409: Ila Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.chatterjee.409@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Chatterjee', 'Bachelor's', 88103.58, 151.77, 'Female', '1991-09-10', 'https://randomuser.me/api/portraits/women/28.jpg', 'Content Writer', 'Muslim', 'Qureshi', v_user_id);

    -- User 410: Divya Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.jain.410@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Jain', 'PhD', 142454.13, 174.63, 'Female', '1992-05-24', 'https://randomuser.me/api/portraits/women/43.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    -- User 411: Kiara Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.malhotra.411@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Malhotra', 'High School', 171613.27, 173.44, 'Female', '1982-07-09', 'https://randomuser.me/api/portraits/women/88.jpg', 'Content Writer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 412: Darsh Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.chakraborty.412@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Chakraborty', 'PhD', 74494.2, 188.46, 'Male', '1985-07-04', 'https://randomuser.me/api/portraits/men/29.jpg', 'Civil Servant', 'Jain', 'Shrimal', v_user_id);

    -- User 413: Gauri Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.reddy.413@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Reddy', 'High School', 119635.71, 166.23, 'Female', '1996-12-08', 'https://randomuser.me/api/portraits/women/68.jpg', 'Dentist', 'Muslim', 'Pathan', v_user_id);

    -- User 414: Maya Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.yadav.414@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Yadav', 'Bachelor's', 160547.65, 153.31, 'Female', '1989-02-19', 'https://randomuser.me/api/portraits/women/49.jpg', 'Data Analyst', 'Muslim', 'Qureshi', v_user_id);

    -- User 415: Pooja Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.shukla.415@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Shukla', 'PhD', 129183.68, 155.41, 'Female', '1997-10-10', 'https://randomuser.me/api/portraits/women/76.jpg', 'Researcher', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 416: Ishita Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.mishra.416@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Mishra', 'PhD', 192342.75, 168.18, 'Female', '1988-04-20', 'https://randomuser.me/api/portraits/women/29.jpg', 'Project Manager', 'Hindu', 'Kayastha', v_user_id);

    -- User 417: Anushka Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.reddy.417@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Reddy', 'Master's', 173080.14, 164.21, 'Female', '1993-11-28', 'https://randomuser.me/api/portraits/women/45.jpg', 'Operations Manager', 'Muslim', 'Syed', v_user_id);

    -- User 418: Shreya Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.desai.418@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Desai', 'Master's', 126169.78, 170.67, 'Female', '1989-10-06', 'https://randomuser.me/api/portraits/women/31.jpg', 'Business Owner', 'Muslim', 'Ansari', v_user_id);

    -- User 419: Bhavya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.singh.419@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Singh', 'PhD', 70123.61, 164.04, 'Female', '2003-11-23', 'https://randomuser.me/api/portraits/women/27.jpg', 'Sales Executive', 'Christian', 'Syrian Christian', v_user_id);

    -- User 420: Naksh Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.mukherjee.420@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Mukherjee', 'Master's', 113849.18, 184.91, 'Male', '2001-05-02', 'https://randomuser.me/api/portraits/men/60.jpg', 'HR Manager', 'Sikh', 'Arora', v_user_id);

    -- User 421: Advik Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.bansal.421@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Bansal', 'Master's', 63888.08, 177.18, 'Male', '1983-01-11', 'https://randomuser.me/api/portraits/men/39.jpg', 'Pharmacist', 'Hindu', 'Vaishya', v_user_id);

    -- User 422: Anjali Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.agarwal.422@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Agarwal', 'Bachelor's', 168338.4, 162.63, 'Female', '1991-10-06', 'https://randomuser.me/api/portraits/women/15.jpg', 'Dentist', 'Sikh', 'Kamboj', v_user_id);

    -- User 423: Sai Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.shah.423@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Shah', 'High School', 163954.9, 186.61, 'Male', '1981-02-20', 'https://randomuser.me/api/portraits/men/80.jpg', 'Marketing Manager', 'Muslim', 'Sheikh', v_user_id);

    -- User 424: Pari Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.mehta.424@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Mehta', 'PhD', 124673.96, 170.89, 'Female', '1999-08-01', 'https://randomuser.me/api/portraits/women/70.jpg', 'Mechanical Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 425: Manav Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.chaudhary.425@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Chaudhary', 'Master's', 82224.89, 165.08, 'Male', '1981-03-02', 'https://randomuser.me/api/portraits/men/77.jpg', 'Pharmacist', 'Christian', 'Roman Catholic', v_user_id);

    -- User 426: Piyush Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.pillai.426@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Pillai', 'Master's', 73020.57, 162.15, 'Male', '1988-05-16', 'https://randomuser.me/api/portraits/men/75.jpg', 'Doctor', 'Sikh', 'Jat', v_user_id);

    -- User 427: Sakshi Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.roy.427@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Roy', 'Master's', 56283.2, 170.65, 'Female', '1993-09-15', 'https://randomuser.me/api/portraits/women/10.jpg', 'Designer', 'Sikh', 'Arora', v_user_id);

    -- User 428: Ansh Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.chakraborty.428@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Chakraborty', 'High School', 48845.18, 169.76, 'Male', '1984-05-19', 'https://randomuser.me/api/portraits/men/98.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 429: Shreya Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.desai.429@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Desai', 'Bachelor's', 169042.5, 174.08, 'Female', '1981-04-24', 'https://randomuser.me/api/portraits/women/81.jpg', 'Banker', 'Jain', 'Porwal', v_user_id);

    -- User 430: Isha Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.chopra.430@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Chopra', 'High School', 126409.82, 170.2, 'Female', '2003-08-25', 'https://randomuser.me/api/portraits/women/84.jpg', 'Architect', 'Muslim', 'Syed', v_user_id);

    -- User 431: Gauri Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.mehta.431@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Mehta', 'Master's', 49283.82, 162.83, 'Female', '1997-09-12', 'https://randomuser.me/api/portraits/women/45.jpg', 'Photographer', 'Muslim', 'Sheikh', v_user_id);

    -- User 432: Riddhi Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.agarwal.432@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Agarwal', 'Bachelor's', 172801.67, 157.56, 'Female', '1982-07-22', 'https://randomuser.me/api/portraits/women/32.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 433: Vihaan Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.singh.433@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Singh', 'Master's', 134405.01, 183.55, 'Male', '1990-03-21', 'https://randomuser.me/api/portraits/men/51.jpg', 'Dentist', 'Buddhist', 'Chamar', v_user_id);

    -- User 434: Manav Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.gupta.434@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Gupta', 'PhD', 66685.0, 168.15, 'Male', '1995-05-23', 'https://randomuser.me/api/portraits/men/68.jpg', 'Interior Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 435: Riddhi Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.kapoor.435@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Kapoor', 'Bachelor's', 116320.94, 170.27, 'Female', '1995-01-07', 'https://randomuser.me/api/portraits/women/12.jpg', 'Entrepreneur', 'Christian', 'Roman Catholic', v_user_id);

    -- User 436: Vihaan Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.shukla.436@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Shukla', 'High School', 30322.54, 187.47, 'Male', '2004-12-08', 'https://randomuser.me/api/portraits/men/45.jpg', 'Lawyer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 437: Reyansh Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.reddy.437@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Reddy', 'Bachelor's', 175042.79, 184.73, 'Male', '1998-04-06', 'https://randomuser.me/api/portraits/men/46.jpg', 'Teacher', 'Jain', 'Oswal', v_user_id);

    -- User 438: Sara Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.joshi.438@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Joshi', 'Master's', 148233.57, 168.75, 'Female', '2001-10-18', 'https://randomuser.me/api/portraits/women/73.jpg', 'Chef', 'Hindu', 'Rajput', v_user_id);

    -- User 439: Jiya Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.dutta.439@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Dutta', 'High School', 62102.78, 151.86, 'Female', '1980-12-19', 'https://randomuser.me/api/portraits/women/4.jpg', 'Marketing Manager', 'Hindu', 'Kshatriya', v_user_id);

    -- User 440: Pranav Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.mishra.440@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Mishra', 'Master's', 173071.36, 186.81, 'Male', '1982-11-05', 'https://randomuser.me/api/portraits/men/84.jpg', 'Product Manager', 'Jain', 'Oswal', v_user_id);

    -- User 441: Arjun Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.das.441@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Das', 'Master's', 151807.63, 185.92, 'Male', '1995-06-15', 'https://randomuser.me/api/portraits/men/16.jpg', 'Researcher', 'Sikh', 'Kamboj', v_user_id);

    -- User 442: Tanvi Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanvi.sharma.442@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanvi', 'Sharma', 'Master's', 78711.02, 159.79, 'Female', '1985-03-05', 'https://randomuser.me/api/portraits/women/47.jpg', 'Fashion Designer', 'Muslim', 'Sheikh', v_user_id);

    -- User 443: Naksh Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.agarwal.443@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Agarwal', 'Master's', 30831.84, 186.51, 'Male', '1994-05-02', 'https://randomuser.me/api/portraits/men/62.jpg', 'Marketing Manager', 'Sikh', 'Jat', v_user_id);

    -- User 444: Darsh Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.pillai.444@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Pillai', 'Master's', 53589.44, 174.92, 'Male', '1998-04-18', 'https://randomuser.me/api/portraits/men/73.jpg', 'Pharmacist', 'Muslim', 'Pathan', v_user_id);

    -- User 445: Jasmine Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.chatterjee.445@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Chatterjee', 'Master's', 196618.05, 157.71, 'Female', '1996-09-12', 'https://randomuser.me/api/portraits/women/99.jpg', 'Financial Analyst', 'Christian', 'Syrian Christian', v_user_id);

    -- User 446: Dhruv Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.shukla.446@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Shukla', 'Master's', 53337.08, 177.94, 'Male', '1981-11-09', 'https://randomuser.me/api/portraits/men/66.jpg', 'Accountant', 'Jain', 'Agarwal', v_user_id);

    -- User 447: Dhruv Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.mehta.447@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Mehta', 'Bachelor's', 178134.15, 166.42, 'Male', '1990-04-06', 'https://randomuser.me/api/portraits/men/56.jpg', 'Researcher', 'Muslim', 'Sheikh', v_user_id);

    -- User 448: Saanvi Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.jain.448@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Jain', 'PhD', 84091.97, 168.62, 'Female', '1990-10-28', 'https://randomuser.me/api/portraits/women/84.jpg', 'Accountant', 'Sikh', 'Jat', v_user_id);

    -- User 449: Angel Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.menon.449@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Menon', 'High School', 179518.03, 162.9, 'Female', '1989-06-28', 'https://randomuser.me/api/portraits/women/6.jpg', 'Architect', 'Hindu', 'Rajput', v_user_id);

    -- User 450: Jasmine Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.roy.450@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Roy', 'PhD', 115328.84, 174.94, 'Female', '1982-12-15', 'https://randomuser.me/api/portraits/women/96.jpg', 'Fashion Designer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 451: Anika Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.das.451@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Das', 'PhD', 43594.9, 155.03, 'Female', '1990-12-11', 'https://randomuser.me/api/portraits/women/32.jpg', 'Marketing Manager', 'Muslim', 'Sheikh', v_user_id);

    -- User 452: Harsh Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.desai.452@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Desai', 'Master's', 38559.48, 186.44, 'Male', '1997-07-18', 'https://randomuser.me/api/portraits/men/27.jpg', 'Photographer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 453: Ishita Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.ghosh.453@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Ghosh', 'PhD', 119209.15, 156.76, 'Female', '1981-09-21', 'https://randomuser.me/api/portraits/women/32.jpg', 'Data Analyst', 'Jain', 'Oswal', v_user_id);

    -- User 454: Anushka Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.chatterjee.454@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Chatterjee', 'Master's', 199683.45, 173.75, 'Female', '2002-07-11', 'https://randomuser.me/api/portraits/women/83.jpg', 'Banker', 'Hindu', 'Kshatriya', v_user_id);

    -- User 455: Karan Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.malhotra.455@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Malhotra', 'High School', 65593.95, 171.52, 'Male', '1995-08-12', 'https://randomuser.me/api/portraits/men/50.jpg', 'Entrepreneur', 'Sikh', 'Jat', v_user_id);

    -- User 456: Tanish Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.kapoor.456@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Kapoor', 'High School', 182804.66, 178.85, 'Male', '1999-03-01', 'https://randomuser.me/api/portraits/men/35.jpg', 'Project Manager', 'Hindu', 'Rajput', v_user_id);

    -- User 457: Meera Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.rao.457@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Rao', 'Master's', 37889.81, 162.29, 'Female', '1983-06-01', 'https://randomuser.me/api/portraits/women/34.jpg', 'Project Manager', 'Christian', 'Syrian Christian', v_user_id);

    -- User 458: Meera Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.menon.458@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Menon', 'Master's', 85921.43, 173.81, 'Female', '2000-12-22', 'https://randomuser.me/api/portraits/women/95.jpg', 'Interior Designer', 'Hindu', 'Vaishya', v_user_id);

    -- User 459: Vihaan Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.kumar.459@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Kumar', 'High School', 136634.5, 172.35, 'Male', '2000-01-27', 'https://randomuser.me/api/portraits/men/50.jpg', 'Mechanical Engineer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 460: Yash Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.desai.460@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Desai', 'PhD', 64382.26, 171.1, 'Male', '1998-08-01', 'https://randomuser.me/api/portraits/men/23.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    -- User 461: Saanvi Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.kaur.461@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Kaur', 'Master's', 82874.96, 172.49, 'Female', '2002-02-21', 'https://randomuser.me/api/portraits/women/94.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    -- User 462: Ishita Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.patel.462@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Patel', 'Bachelor's', 96140.35, 170.07, 'Female', '1990-08-21', 'https://randomuser.me/api/portraits/women/97.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    -- User 463: Tanish Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.verma.463@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Verma', 'PhD', 69373.19, 181.59, 'Male', '2004-01-18', 'https://randomuser.me/api/portraits/men/68.jpg', 'Pharmacist', 'Hindu', 'Rajput', v_user_id);

    -- User 464: Aditi Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.reddy.464@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Reddy', 'PhD', 120223.36, 164.73, 'Female', '1988-02-14', 'https://randomuser.me/api/portraits/women/34.jpg', 'Operations Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 465: Arman Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.yadav.465@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Yadav', 'High School', 107716.22, 165.59, 'Male', '1988-11-05', 'https://randomuser.me/api/portraits/men/4.jpg', 'Consultant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 466: Lavanya Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.chakraborty.466@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Chakraborty', 'PhD', 120375.7, 154.74, 'Female', '1989-05-11', 'https://randomuser.me/api/portraits/women/7.jpg', 'Government Officer', 'Jain', 'Oswal', v_user_id);

    -- User 467: Avni Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('avni.mehta.467@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Avni', 'Mehta', 'High School', 110110.68, 174.32, 'Female', '2003-02-24', 'https://randomuser.me/api/portraits/women/19.jpg', 'Pilot', 'Jain', 'Porwal', v_user_id);

    -- User 468: Prisha Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.gupta.468@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Gupta', 'High School', 139918.72, 167.38, 'Female', '2004-04-24', 'https://randomuser.me/api/portraits/women/58.jpg', 'HR Manager', 'Muslim', 'Syed', v_user_id);

    -- User 469: Aditi Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.pillai.469@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Pillai', 'High School', 137144.27, 172.65, 'Female', '1997-03-05', 'https://randomuser.me/api/portraits/women/36.jpg', 'Data Analyst', 'Muslim', 'Pathan', v_user_id);

    -- User 470: Nikhil Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.sinha.470@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Sinha', 'PhD', 79318.43, 166.84, 'Male', '2004-03-06', 'https://randomuser.me/api/portraits/men/12.jpg', 'Consultant', 'Sikh', 'Kamboj', v_user_id);

    -- User 471: Vivaan Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.tiwari.471@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Tiwari', 'Master's', 196303.86, 186.3, 'Male', '2000-09-01', 'https://randomuser.me/api/portraits/men/35.jpg', 'Nurse', 'Hindu', 'Vaishya', v_user_id);

    -- User 472: Bhavya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.singh.472@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Singh', 'Master's', 122926.34, 164.68, 'Female', '1997-04-15', 'https://randomuser.me/api/portraits/women/31.jpg', 'Operations Manager', 'Buddhist', 'Chamar', v_user_id);

    -- User 473: Dhruv Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.desai.473@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Desai', 'Master's', 84047.5, 176.48, 'Male', '1996-08-28', 'https://randomuser.me/api/portraits/men/11.jpg', 'Fashion Designer', 'Muslim', 'Pathan', v_user_id);

    -- User 474: Pooja Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.saxena.474@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Saxena', 'High School', 182748.77, 156.99, 'Female', '1987-02-26', 'https://randomuser.me/api/portraits/women/12.jpg', 'Designer', 'Hindu', 'Baniya', v_user_id);

    -- User 475: Avni Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('avni.ali.475@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Avni', 'Ali', 'Master's', 178164.27, 162.13, 'Female', '1998-05-11', 'https://randomuser.me/api/portraits/women/10.jpg', 'Data Analyst', 'Muslim', 'Ansari', v_user_id);

    -- User 476: Pihu Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.chakraborty.476@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Chakraborty', 'High School', 140302.59, 169.94, 'Female', '1998-06-06', 'https://randomuser.me/api/portraits/women/2.jpg', 'HR Manager', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 477: Divya Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.thakur.477@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Thakur', 'Bachelor's', 43412.95, 173.05, 'Female', '1986-08-16', 'https://randomuser.me/api/portraits/women/83.jpg', 'Professor', 'Hindu', 'Kayastha', v_user_id);

    -- User 478: Jiya Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.sharma.478@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Sharma', 'Master's', 86825.91, 158.25, 'Female', '1985-07-21', 'https://randomuser.me/api/portraits/women/55.jpg', 'Operations Manager', 'Christian', 'Protestant', v_user_id);

    -- User 479: Jasmine Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.chakraborty.479@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Chakraborty', 'Bachelor's', 187956.36, 159.01, 'Female', '1980-09-18', 'https://randomuser.me/api/portraits/women/13.jpg', 'Pharmacist', 'Christian', 'Protestant', v_user_id);

    -- User 480: Natasha Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.menon.480@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Menon', 'Master's', 177648.91, 161.38, 'Female', '1986-12-18', 'https://randomuser.me/api/portraits/women/76.jpg', 'Designer', 'Jain', 'Shrimal', v_user_id);

    -- User 481: Laksh Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.thakur.481@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Thakur', 'High School', 192893.71, 171.72, 'Male', '2000-08-09', 'https://randomuser.me/api/portraits/men/81.jpg', 'HR Manager', 'Muslim', 'Pathan', v_user_id);

    -- User 482: Dev Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.chopra.482@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Chopra', 'Master's', 186629.82, 179.92, 'Male', '1999-06-03', 'https://randomuser.me/api/portraits/men/50.jpg', 'Teacher', 'Jain', 'Agarwal', v_user_id);

    -- User 483: Pranav Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.kumar.483@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Kumar', 'Bachelor's', 142040.92, 160.49, 'Male', '1984-05-18', 'https://randomuser.me/api/portraits/men/79.jpg', 'Dentist', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 484: Sara Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.singh.484@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Singh', 'PhD', 68983.72, 164.63, 'Female', '1982-09-18', 'https://randomuser.me/api/portraits/women/7.jpg', 'Chef', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 485: Aadhya Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.pillai.485@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Pillai', 'Bachelor's', 192230.85, 166.49, 'Female', '1993-07-28', 'https://randomuser.me/api/portraits/women/48.jpg', 'Chef', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 486: Shanaya Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.garg.486@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Garg', 'Bachelor's', 59860.81, 173.57, 'Female', '1993-04-20', 'https://randomuser.me/api/portraits/women/31.jpg', 'Interior Designer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 487: Dev Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.chopra.487@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Chopra', 'PhD', 53681.75, 175.28, 'Male', '1991-06-28', 'https://randomuser.me/api/portraits/men/80.jpg', 'Civil Servant', 'Jain', 'Agarwal', v_user_id);

    -- User 488: Shaurya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.mehta.488@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Mehta', 'Master's', 44143.4, 183.73, 'Male', '1993-11-11', 'https://randomuser.me/api/portraits/men/82.jpg', 'Doctor', 'Christian', 'Roman Catholic', v_user_id);

    -- User 489: Divya Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.kumar.489@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Kumar', 'Bachelor's', 66028.76, 156.17, 'Female', '1988-05-02', 'https://randomuser.me/api/portraits/women/16.jpg', 'Project Manager', 'Hindu', 'Brahmin', v_user_id);

    -- User 490: Meera Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.yadav.490@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Yadav', 'Master's', 95376.52, 173.72, 'Female', '1994-06-24', 'https://randomuser.me/api/portraits/women/42.jpg', 'Civil Servant', 'Muslim', 'Ansari', v_user_id);

    -- User 491: Ananya Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.dubey.491@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Dubey', 'Bachelor's', 173479.73, 153.58, 'Female', '2002-01-11', 'https://randomuser.me/api/portraits/women/24.jpg', 'Civil Engineer', 'Hindu', 'Baniya', v_user_id);

    -- User 492: Maya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.mehta.492@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Mehta', 'Bachelor's', 60388.49, 172.24, 'Female', '1999-10-26', 'https://randomuser.me/api/portraits/women/82.jpg', 'Architect', 'Jain', 'Shrimal', v_user_id);

    -- User 493: Zara Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.reddy.493@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Reddy', 'High School', 160644.68, 170.14, 'Female', '1993-02-09', 'https://randomuser.me/api/portraits/women/13.jpg', 'Teacher', 'Muslim', 'Syed', v_user_id);

    -- User 494: Kritika Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.pillai.494@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Pillai', 'Master's', 64680.18, 154.58, 'Female', '1985-05-09', 'https://randomuser.me/api/portraits/women/12.jpg', 'Fashion Designer', 'Muslim', 'Ansari', v_user_id);

    -- User 495: Dhruv Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.shah.495@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Shah', 'High School', 32944.81, 184.69, 'Male', '1985-08-28', 'https://randomuser.me/api/portraits/men/43.jpg', 'Civil Servant', 'Buddhist', 'Chamar', v_user_id);

    -- User 496: Kavya Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.sen.496@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Sen', 'Master's', 126616.87, 171.48, 'Female', '1991-04-22', 'https://randomuser.me/api/portraits/women/83.jpg', 'Civil Engineer', 'Hindu', 'Brahmin', v_user_id);

    -- User 497: Anushka Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.singh.497@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Singh', 'Master's', 135617.47, 174.64, 'Female', '1997-11-16', 'https://randomuser.me/api/portraits/women/53.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    -- User 498: Aarush Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.pillai.498@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Pillai', 'Bachelor's', 113486.04, 175.72, 'Male', '1980-02-07', 'https://randomuser.me/api/portraits/men/71.jpg', 'Fashion Designer', 'Hindu', 'Baniya', v_user_id);

    -- User 499: Angel Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.mehta.499@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Mehta', 'Bachelor's', 114091.12, 153.9, 'Female', '2002-05-11', 'https://randomuser.me/api/portraits/women/49.jpg', 'Photographer', 'Muslim', 'Pathan', v_user_id);

    -- User 500: Navya Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.joshi.500@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Joshi', 'High School', 54090.04, 156.94, 'Female', '1990-04-03', 'https://randomuser.me/api/portraits/women/13.jpg', 'Fashion Designer', 'Christian', 'Roman Catholic', v_user_id);

    -- Completed 500 profiles

    -- User 501: Dev Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.pandey.501@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Pandey', 'Master's', 187347.52, 174.66, 'Male', '2001-09-02', 'https://randomuser.me/api/portraits/men/58.jpg', 'Marketing Manager', 'Buddhist', 'Chamar', v_user_id);

    -- User 502: Kriti Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.desai.502@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Desai', 'Master's', 185562.94, 162.44, 'Female', '1984-01-19', 'https://randomuser.me/api/portraits/women/93.jpg', 'Banker', 'Hindu', 'Kayastha', v_user_id);

    -- User 503: Kritika Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.roy.503@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Roy', 'High School', 105111.02, 154.47, 'Female', '1990-08-08', 'https://randomuser.me/api/portraits/women/20.jpg', 'Civil Servant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 504: Krishna Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.rathore.504@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Rathore', 'Bachelor's', 128346.85, 180.82, 'Male', '1986-09-26', 'https://randomuser.me/api/portraits/men/48.jpg', 'Electrical Engineer', 'Christian', 'Protestant', v_user_id);

    -- User 505: Rohan Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.thakur.505@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Thakur', 'PhD', 140623.65, 164.73, 'Male', '1980-09-13', 'https://randomuser.me/api/portraits/men/61.jpg', 'Financial Analyst', 'Jain', 'Agarwal', v_user_id);

    -- User 506: Tanish Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.ghosh.506@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Ghosh', 'Bachelor's', 193982.14, 163.62, 'Male', '1982-12-17', 'https://randomuser.me/api/portraits/men/26.jpg', 'Civil Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 507: Divya Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.chauhan.507@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Chauhan', 'Bachelor's', 160680.9, 172.64, 'Female', '1993-01-19', 'https://randomuser.me/api/portraits/women/77.jpg', 'Financial Analyst', 'Sikh', 'Arora', v_user_id);

    -- User 508: Siya Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.patel.508@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Patel', 'Master's', 54797.88, 155.13, 'Female', '1985-10-01', 'https://randomuser.me/api/portraits/women/58.jpg', 'Fashion Designer', 'Sikh', 'Arora', v_user_id);

    -- User 509: Mira Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('mira.bhattacharya.509@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Mira', 'Bhattacharya', 'High School', 105989.18, 153.77, 'Female', '2004-03-05', 'https://randomuser.me/api/portraits/women/53.jpg', 'Software Engineer', 'Jain', 'Oswal', v_user_id);

    -- User 510: Diya Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.chatterjee.510@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Chatterjee', 'High School', 102098.27, 152.65, 'Female', '1980-06-20', 'https://randomuser.me/api/portraits/women/53.jpg', 'Photographer', 'Hindu', 'Shudra', v_user_id);

    -- User 511: Khushi Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('khushi.ali.511@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Khushi', 'Ali', 'High School', 73022.01, 159.81, 'Female', '1983-03-26', 'https://randomuser.me/api/portraits/women/91.jpg', 'Chartered Accountant', 'Hindu', 'Kayastha', v_user_id);

    -- User 512: Myra Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('myra.khan.512@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Myra', 'Khan', 'High School', 152413.34, 161.71, 'Female', '2003-07-05', 'https://randomuser.me/api/portraits/women/18.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    -- User 513: Gauri Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.tiwari.513@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Tiwari', 'PhD', 137288.15, 174.09, 'Female', '1994-08-01', 'https://randomuser.me/api/portraits/women/2.jpg', 'Mechanical Engineer', 'Muslim', 'Qureshi', v_user_id);

    -- User 514: Ansh Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.dubey.514@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Dubey', 'Master's', 175390.39, 188.55, 'Male', '2002-03-04', 'https://randomuser.me/api/portraits/men/68.jpg', 'Architect', 'Christian', 'Latin Catholic', v_user_id);

    -- User 515: Krishna Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.pandey.515@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Pandey', 'Bachelor's', 70393.35, 164.43, 'Male', '1990-02-06', 'https://randomuser.me/api/portraits/men/15.jpg', 'Teacher', 'Sikh', 'Arora', v_user_id);

    -- User 516: Atharv Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.tiwari.516@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Tiwari', 'High School', 39222.26, 163.4, 'Male', '1999-12-24', 'https://randomuser.me/api/portraits/men/29.jpg', 'Doctor', 'Muslim', 'Pathan', v_user_id);

    -- User 517: Kunal Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kunal.bhat.517@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kunal', 'Bhat', 'PhD', 30434.99, 169.07, 'Male', '1999-07-06', 'https://randomuser.me/api/portraits/men/12.jpg', 'Content Writer', 'Hindu', 'Brahmin', v_user_id);

    -- User 518: Arman Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.kaur.518@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Kaur', 'PhD', 112916.4, 189.22, 'Male', '1980-05-24', 'https://randomuser.me/api/portraits/men/35.jpg', 'Operations Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 519: Anjali Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.mehta.519@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Mehta', 'Master's', 134949.77, 153.54, 'Female', '2000-11-20', 'https://randomuser.me/api/portraits/women/48.jpg', 'Business Owner', 'Christian', 'Roman Catholic', v_user_id);

    -- User 520: Kiaan Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.agarwal.520@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Agarwal', 'Bachelor's', 184055.02, 172.62, 'Male', '1998-12-25', 'https://randomuser.me/api/portraits/men/26.jpg', 'Architect', 'Hindu', 'Rajput', v_user_id);

    -- User 521: Siya Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.ali.521@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Ali', 'Master's', 170977.29, 154.78, 'Female', '2001-08-20', 'https://randomuser.me/api/portraits/women/22.jpg', 'Software Engineer', 'Jain', 'Porwal', v_user_id);

    -- User 522: Kiara Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.rathore.522@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Rathore', 'PhD', 154979.08, 171.26, 'Female', '1985-01-21', 'https://randomuser.me/api/portraits/women/80.jpg', 'Pharmacist', 'Muslim', 'Pathan', v_user_id);

    -- User 523: Rahul Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.agarwal.523@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Agarwal', 'PhD', 30011.93, 168.38, 'Male', '1980-08-02', 'https://randomuser.me/api/portraits/men/23.jpg', 'Accountant', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 524: Aditi Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.menon.524@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Menon', 'High School', 176364.94, 151.85, 'Female', '2004-08-13', 'https://randomuser.me/api/portraits/women/23.jpg', 'Data Analyst', 'Jain', 'Porwal', v_user_id);

    -- User 525: Laksh Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.chopra.525@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Chopra', 'PhD', 58906.54, 186.96, 'Male', '2000-12-05', 'https://randomuser.me/api/portraits/men/59.jpg', 'Data Analyst', 'Christian', 'Roman Catholic', v_user_id);

    -- User 526: Manav Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.menon.526@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Menon', 'PhD', 59143.16, 184.61, 'Male', '1992-03-08', 'https://randomuser.me/api/portraits/men/91.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    -- User 527: Kiaan Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.chopra.527@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Chopra', 'Master's', 56566.78, 164.32, 'Male', '1989-02-03', 'https://randomuser.me/api/portraits/men/90.jpg', 'Civil Servant', 'Jain', 'Porwal', v_user_id);

    -- User 528: Harsh Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.bose.528@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Bose', 'Master's', 101101.34, 165.37, 'Male', '1985-11-07', 'https://randomuser.me/api/portraits/men/34.jpg', 'Product Manager', 'Christian', 'Syrian Christian', v_user_id);

    -- User 529: Manav Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.bose.529@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Bose', 'Bachelor's', 51760.48, 177.11, 'Male', '1992-04-25', 'https://randomuser.me/api/portraits/men/5.jpg', 'Professor', 'Christian', 'Roman Catholic', v_user_id);

    -- User 530: Kabir Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.bhattacharya.530@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Bhattacharya', 'Bachelor's', 48048.22, 166.39, 'Male', '1991-08-12', 'https://randomuser.me/api/portraits/men/55.jpg', 'Pharmacist', 'Jain', 'Agarwal', v_user_id);

    -- User 531: Daksh Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.sinha.531@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Sinha', 'PhD', 33798.81, 184.73, 'Male', '1997-10-10', 'https://randomuser.me/api/portraits/men/57.jpg', 'Accountant', 'Muslim', 'Syed', v_user_id);

    -- User 532: Jiya Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.sinha.532@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Sinha', 'Master's', 87204.4, 154.52, 'Female', '1989-02-24', 'https://randomuser.me/api/portraits/women/18.jpg', 'Business Owner', 'Muslim', 'Sheikh', v_user_id);

    -- User 533: Aadhya Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.shukla.533@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Shukla', 'Bachelor's', 129089.58, 159.6, 'Female', '1981-06-25', 'https://randomuser.me/api/portraits/women/38.jpg', 'Interior Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 534: Neha Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('neha.chakraborty.534@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Neha', 'Chakraborty', 'Master's', 55514.87, 163.21, 'Female', '1998-11-08', 'https://randomuser.me/api/portraits/women/19.jpg', 'Doctor', 'Muslim', 'Sheikh', v_user_id);

    -- User 535: Aaradhya Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.khan.535@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Khan', 'PhD', 79506.67, 152.02, 'Female', '1988-03-14', 'https://randomuser.me/api/portraits/women/9.jpg', 'Software Engineer', 'Sikh', 'Arora', v_user_id);

    -- User 536: Pari Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.thakur.536@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Thakur', 'Master's', 55469.59, 170.28, 'Female', '2004-01-13', 'https://randomuser.me/api/portraits/women/86.jpg', 'Teacher', 'Christian', 'Latin Catholic', v_user_id);

    -- User 537: Vivaan Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.sinha.537@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Sinha', 'Master's', 186365.03, 184.94, 'Male', '2002-05-08', 'https://randomuser.me/api/portraits/men/6.jpg', 'Accountant', 'Sikh', 'Arora', v_user_id);

    -- User 538: Arnav Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.malhotra.538@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Malhotra', 'PhD', 113212.22, 188.82, 'Male', '1982-07-20', 'https://randomuser.me/api/portraits/men/15.jpg', 'Banker', 'Christian', 'Syrian Christian', v_user_id);

    -- User 539: Priya Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('priya.pandey.539@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Priya', 'Pandey', 'Master's', 57893.88, 152.37, 'Female', '2003-04-28', 'https://randomuser.me/api/portraits/women/67.jpg', 'Professor', 'Hindu', 'Shudra', v_user_id);

    -- User 540: Aarav Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.saxena.540@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Saxena', 'Master's', 128906.03, 170.79, 'Male', '1991-08-09', 'https://randomuser.me/api/portraits/men/58.jpg', 'Banker', 'Hindu', 'Rajput', v_user_id);

    -- User 541: Kavya Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kavya.shah.541@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kavya', 'Shah', 'Bachelor's', 37430.04, 160.31, 'Female', '1988-01-16', 'https://randomuser.me/api/portraits/women/11.jpg', 'Civil Engineer', 'Hindu', 'Shudra', v_user_id);

    -- User 542: Manav Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.bose.542@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Bose', 'Bachelor's', 123615.65, 160.36, 'Male', '2001-07-16', 'https://randomuser.me/api/portraits/men/33.jpg', 'Consultant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 543: Kriti Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.sinha.543@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Sinha', 'Master's', 100892.34, 164.09, 'Female', '1985-08-23', 'https://randomuser.me/api/portraits/women/61.jpg', 'Project Manager', 'Buddhist', 'Mahar', v_user_id);

    -- User 544: Krishna Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.khan.544@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Khan', 'PhD', 103607.66, 173.92, 'Male', '1994-07-20', 'https://randomuser.me/api/portraits/men/96.jpg', 'Accountant', 'Jain', 'Agarwal', v_user_id);

    -- User 545: Varun Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('varun.srivastava.545@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Varun', 'Srivastava', 'PhD', 133988.36, 188.93, 'Male', '1987-05-25', 'https://randomuser.me/api/portraits/men/47.jpg', 'Government Officer', 'Hindu', 'Rajput', v_user_id);

    -- User 546: Kritika Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.chopra.546@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Chopra', 'Master's', 142882.0, 169.0, 'Female', '1995-10-08', 'https://randomuser.me/api/portraits/women/54.jpg', 'Doctor', 'Christian', 'Roman Catholic', v_user_id);

    -- User 547: Zara Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.chaudhary.547@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Chaudhary', 'High School', 105266.51, 150.98, 'Female', '1989-09-27', 'https://randomuser.me/api/portraits/women/32.jpg', 'Project Manager', 'Muslim', 'Syed', v_user_id);

    -- User 548: Saanvi Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.rathore.548@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Rathore', 'PhD', 36326.0, 171.46, 'Female', '1980-06-01', 'https://randomuser.me/api/portraits/women/16.jpg', 'Data Analyst', 'Jain', 'Porwal', v_user_id);

    -- User 549: Arnav Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.singh.549@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Singh', 'High School', 175774.81, 185.65, 'Male', '2000-09-09', 'https://randomuser.me/api/portraits/men/76.jpg', 'Civil Servant', 'Hindu', 'Kshatriya', v_user_id);

    -- User 550: Arnav Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.sen.550@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Sen', 'High School', 86833.97, 187.54, 'Male', '1983-07-04', 'https://randomuser.me/api/portraits/men/89.jpg', 'Pharmacist', 'Hindu', 'Kayastha', v_user_id);

    -- User 551: Riya Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.chopra.551@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Chopra', 'Master's', 118897.12, 173.41, 'Female', '1993-01-23', 'https://randomuser.me/api/portraits/women/67.jpg', 'Operations Manager', 'Hindu', 'Baniya', v_user_id);

    -- User 552: Disha Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.das.552@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Das', 'PhD', 128225.34, 169.65, 'Female', '2003-02-10', 'https://randomuser.me/api/portraits/women/92.jpg', 'Marketing Manager', 'Muslim', 'Syed', v_user_id);

    -- User 553: Gauri Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.rathore.553@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Rathore', 'High School', 181349.07, 174.23, 'Female', '2004-01-18', 'https://randomuser.me/api/portraits/women/83.jpg', 'Lawyer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 554: Khushi Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('khushi.rathore.554@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Khushi', 'Rathore', 'PhD', 78569.91, 167.6, 'Female', '1992-10-06', 'https://randomuser.me/api/portraits/women/87.jpg', 'Architect', 'Hindu', 'Shudra', v_user_id);

    -- User 555: Nikhil Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.yadav.555@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Yadav', 'PhD', 100938.91, 171.07, 'Male', '2001-09-12', 'https://randomuser.me/api/portraits/men/35.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    -- User 556: Rohan Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.nair.556@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Nair', 'Master's', 153980.18, 188.99, 'Male', '1982-01-06', 'https://randomuser.me/api/portraits/men/100.jpg', 'Professor', 'Jain', 'Porwal', v_user_id);

    -- User 557: Atharv Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.kaur.557@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Kaur', 'High School', 76314.6, 164.69, 'Male', '2004-09-01', 'https://randomuser.me/api/portraits/men/65.jpg', 'Software Engineer', 'Jain', 'Shrimal', v_user_id);

    -- User 558: Kabir Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.ali.558@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Ali', 'Bachelor's', 137043.13, 183.03, 'Male', '2002-05-18', 'https://randomuser.me/api/portraits/men/18.jpg', 'Marketing Manager', 'Jain', 'Porwal', v_user_id);

    -- User 559: Zara Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.garg.559@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Garg', 'PhD', 112651.95, 153.82, 'Female', '1980-06-18', 'https://randomuser.me/api/portraits/women/57.jpg', 'Civil Servant', 'Jain', 'Shrimal', v_user_id);

    -- User 560: Anika Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.ali.560@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Ali', 'PhD', 38092.44, 154.7, 'Female', '2002-11-07', 'https://randomuser.me/api/portraits/women/28.jpg', 'Entrepreneur', 'Buddhist', 'Mahar', v_user_id);

    -- User 561: Anushka Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.thakur.561@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Thakur', 'High School', 123354.11, 174.27, 'Female', '1988-08-10', 'https://randomuser.me/api/portraits/women/34.jpg', 'Data Analyst', 'Hindu', 'Vaishya', v_user_id);

    -- User 562: Saanvi Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.mehta.562@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Mehta', 'Bachelor's', 145245.38, 170.72, 'Female', '1998-02-10', 'https://randomuser.me/api/portraits/women/10.jpg', 'Consultant', 'Muslim', 'Pathan', v_user_id);

    -- User 563: Reyansh Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.patel.563@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Patel', 'PhD', 62931.33, 185.84, 'Male', '1993-06-04', 'https://randomuser.me/api/portraits/men/72.jpg', 'Product Manager', 'Buddhist', 'Chamar', v_user_id);

    -- User 564: Angel Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.kapoor.564@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Kapoor', 'Bachelor's', 160597.19, 163.12, 'Female', '1986-03-28', 'https://randomuser.me/api/portraits/women/27.jpg', 'Financial Analyst', 'Sikh', 'Arora', v_user_id);

    -- User 565: Aaradhya Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.malhotra.565@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Malhotra', 'PhD', 109842.18, 153.25, 'Female', '1984-06-19', 'https://randomuser.me/api/portraits/women/96.jpg', 'Financial Analyst', 'Muslim', 'Sheikh', v_user_id);

    -- User 566: Anushka Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.mukherjee.566@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Mukherjee', 'High School', 163860.08, 153.29, 'Female', '1988-03-16', 'https://randomuser.me/api/portraits/women/26.jpg', 'Chartered Accountant', 'Muslim', 'Sheikh', v_user_id);

    -- User 567: Anushka Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.chaudhary.567@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Chaudhary', 'Master's', 42880.24, 171.04, 'Female', '1981-05-09', 'https://randomuser.me/api/portraits/women/31.jpg', 'Architect', 'Hindu', 'Kshatriya', v_user_id);

    -- User 568: Pihu Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.roy.568@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Roy', 'PhD', 114862.98, 167.32, 'Female', '2000-04-16', 'https://randomuser.me/api/portraits/women/56.jpg', 'Lawyer', 'Hindu', 'Baniya', v_user_id);

    -- User 569: Prisha Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.kumar.569@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Kumar', 'PhD', 58633.69, 166.87, 'Female', '2002-02-11', 'https://randomuser.me/api/portraits/women/93.jpg', 'Photographer', 'Hindu', 'Brahmin', v_user_id);

    -- User 570: Jasmine Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.mukherjee.570@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Mukherjee', 'PhD', 104958.66, 152.67, 'Female', '1981-12-05', 'https://randomuser.me/api/portraits/women/31.jpg', 'Banker', 'Buddhist', 'Chamar', v_user_id);

    -- User 571: Pooja Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.singh.571@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Singh', 'PhD', 49048.63, 158.24, 'Female', '1984-09-18', 'https://randomuser.me/api/portraits/women/82.jpg', 'Product Manager', 'Muslim', 'Syed', v_user_id);

    -- User 572: Madhav Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.verma.572@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Verma', 'Bachelor's', 100938.81, 166.15, 'Male', '1989-05-06', 'https://randomuser.me/api/portraits/men/81.jpg', 'Photographer', 'Hindu', 'Jat', v_user_id);

    -- User 573: Arjun Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.bose.573@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Bose', 'Master's', 99555.18, 188.56, 'Male', '1993-01-18', 'https://randomuser.me/api/portraits/men/80.jpg', 'Fashion Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 574: Maya Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.bansal.574@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Bansal', 'Bachelor's', 187454.34, 164.44, 'Female', '1989-10-15', 'https://randomuser.me/api/portraits/women/99.jpg', 'Business Owner', 'Hindu', 'Baniya', v_user_id);

    -- User 575: Aaradhya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.singh.575@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Singh', 'High School', 198952.69, 157.5, 'Female', '1994-11-09', 'https://randomuser.me/api/portraits/women/74.jpg', 'Interior Designer', 'Muslim', 'Sheikh', v_user_id);

    -- User 576: Pari Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.shah.576@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Shah', 'High School', 146187.02, 171.37, 'Female', '1990-12-09', 'https://randomuser.me/api/portraits/women/52.jpg', 'Civil Engineer', 'Hindu', 'Rajput', v_user_id);

    -- User 577: Dhruv Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.jain.577@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Jain', 'High School', 106225.18, 187.4, 'Male', '2000-03-16', 'https://randomuser.me/api/portraits/men/76.jpg', 'Doctor', 'Hindu', 'Jat', v_user_id);

    -- User 578: Pranav Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.rathore.578@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Rathore', 'PhD', 181670.84, 167.15, 'Male', '1996-09-05', 'https://randomuser.me/api/portraits/men/98.jpg', 'Doctor', 'Buddhist', 'Mahar', v_user_id);

    -- User 579: Riya Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.sen.579@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Sen', 'PhD', 50007.11, 154.74, 'Female', '2002-03-11', 'https://randomuser.me/api/portraits/women/93.jpg', 'Accountant', 'Muslim', 'Qureshi', v_user_id);

    -- User 580: Divya Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.kumar.580@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Kumar', 'Master's', 49606.99, 158.96, 'Female', '1988-01-22', 'https://randomuser.me/api/portraits/women/28.jpg', 'Mechanical Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 581: Myra Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('myra.reddy.581@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Myra', 'Reddy', 'Master's', 117025.91, 152.61, 'Female', '1986-05-01', 'https://randomuser.me/api/portraits/women/20.jpg', 'Business Owner', 'Sikh', 'Kamboj', v_user_id);

    -- User 582: Varun Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('varun.garg.582@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Varun', 'Garg', 'Master's', 166676.09, 165.86, 'Male', '1987-11-11', 'https://randomuser.me/api/portraits/men/50.jpg', 'Dentist', 'Buddhist', 'Mahar', v_user_id);

    -- User 583: Sneha Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.srivastava.583@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Srivastava', 'Master's', 197753.25, 156.68, 'Female', '1989-09-07', 'https://randomuser.me/api/portraits/women/64.jpg', 'Sales Executive', 'Sikh', 'Arora', v_user_id);

    -- User 584: Tanish Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.malhotra.584@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Malhotra', 'High School', 47373.63, 185.9, 'Male', '1990-05-18', 'https://randomuser.me/api/portraits/men/77.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    -- User 585: Aarav Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.pillai.585@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Pillai', 'Bachelor's', 100579.91, 160.34, 'Male', '1994-12-16', 'https://randomuser.me/api/portraits/men/51.jpg', 'Architect', 'Muslim', 'Ansari', v_user_id);

    -- User 586: Pari Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.chaudhary.586@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Chaudhary', 'Bachelor's', 191121.61, 152.49, 'Female', '1999-07-13', 'https://randomuser.me/api/portraits/women/69.jpg', 'Doctor', 'Hindu', 'Rajput', v_user_id);

    -- User 587: Sneha Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.thakur.587@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Thakur', 'High School', 129230.29, 166.2, 'Female', '1984-10-16', 'https://randomuser.me/api/portraits/women/51.jpg', 'Civil Servant', 'Sikh', 'Jat', v_user_id);

    -- User 588: Kiara Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.singh.588@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Singh', 'Bachelor's', 66063.75, 164.9, 'Female', '2004-12-26', 'https://randomuser.me/api/portraits/women/74.jpg', 'Entrepreneur', 'Jain', 'Shrimal', v_user_id);

    -- User 589: Vihaan Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.kaur.589@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Kaur', 'Master's', 76998.8, 189.07, 'Male', '1996-10-10', 'https://randomuser.me/api/portraits/men/26.jpg', 'Nurse', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 590: Daksh Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.reddy.590@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Reddy', 'High School', 86690.48, 169.33, 'Male', '1994-03-15', 'https://randomuser.me/api/portraits/men/18.jpg', 'Consultant', 'Sikh', 'Kamboj', v_user_id);

    -- User 591: Divya Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.bhattacharya.591@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Bhattacharya', 'PhD', 128470.18, 156.03, 'Female', '2003-11-06', 'https://randomuser.me/api/portraits/women/30.jpg', 'Doctor', 'Jain', 'Porwal', v_user_id);

    -- User 592: Aditi Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.ali.592@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Ali', 'High School', 136127.66, 168.19, 'Female', '1999-07-10', 'https://randomuser.me/api/portraits/women/1.jpg', 'Marketing Manager', 'Hindu', 'Baniya', v_user_id);

    -- User 593: Pooja Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.tiwari.593@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Tiwari', 'PhD', 152924.51, 150.75, 'Female', '2003-10-28', 'https://randomuser.me/api/portraits/women/17.jpg', 'Business Owner', 'Buddhist', 'Mahar', v_user_id);

    -- User 594: Rahul Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.chakraborty.594@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Chakraborty', 'Master's', 144684.76, 176.29, 'Male', '1995-12-13', 'https://randomuser.me/api/portraits/men/90.jpg', 'Interior Designer', 'Sikh', 'Arora', v_user_id);

    -- User 595: Kabir Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.pillai.595@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Pillai', 'High School', 102274.16, 162.37, 'Male', '1989-02-25', 'https://randomuser.me/api/portraits/men/72.jpg', 'Dentist', 'Hindu', 'Shudra', v_user_id);

    -- User 596: Kiara Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.tiwari.596@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Tiwari', 'PhD', 33586.98, 157.56, 'Female', '1999-03-22', 'https://randomuser.me/api/portraits/women/70.jpg', 'Government Officer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 597: Daksh Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('daksh.sharma.597@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Daksh', 'Sharma', 'PhD', 187595.57, 179.83, 'Male', '1984-10-03', 'https://randomuser.me/api/portraits/men/94.jpg', 'Pilot', 'Christian', 'Syrian Christian', v_user_id);

    -- User 598: Aryan Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.chatterjee.598@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Chatterjee', 'High School', 199710.44, 161.01, 'Male', '1987-06-01', 'https://randomuser.me/api/portraits/men/45.jpg', 'Pilot', 'Jain', 'Shrimal', v_user_id);

    -- User 599: Bhavya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.mehta.599@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Mehta', 'Bachelor's', 165911.49, 156.69, 'Female', '1981-03-23', 'https://randomuser.me/api/portraits/women/11.jpg', 'Nurse', 'Jain', 'Agarwal', v_user_id);

    -- User 600: Nikhil Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.garg.600@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Garg', 'PhD', 186665.7, 186.01, 'Male', '2003-12-16', 'https://randomuser.me/api/portraits/men/6.jpg', 'Pharmacist', 'Sikh', 'Arora', v_user_id);

    -- Completed 600 profiles

    -- User 601: Rahul Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.kaur.601@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Kaur', 'PhD', 48238.4, 172.83, 'Male', '1982-07-25', 'https://randomuser.me/api/portraits/men/19.jpg', 'Financial Analyst', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 602: Darsh Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.sinha.602@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Sinha', 'PhD', 105915.81, 172.28, 'Male', '1994-04-15', 'https://randomuser.me/api/portraits/men/14.jpg', 'Nurse', 'Sikh', 'Kamboj', v_user_id);

    -- User 603: Angel Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.tiwari.603@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Tiwari', 'High School', 137176.97, 163.93, 'Female', '1989-03-10', 'https://randomuser.me/api/portraits/women/37.jpg', 'Doctor', 'Muslim', 'Qureshi', v_user_id);

    -- User 604: Kunal Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kunal.agarwal.604@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kunal', 'Agarwal', 'Master's', 120751.67, 182.48, 'Male', '2003-01-25', 'https://randomuser.me/api/portraits/men/79.jpg', 'Consultant', 'Hindu', 'Rajput', v_user_id);

    -- User 605: Aarav Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.ali.605@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Ali', 'High School', 35789.84, 176.72, 'Male', '1982-01-28', 'https://randomuser.me/api/portraits/men/40.jpg', 'Chef', 'Jain', 'Porwal', v_user_id);

    -- User 606: Krishna Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.khan.606@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Khan', 'Bachelor's', 196391.77, 175.73, 'Male', '1998-06-21', 'https://randomuser.me/api/portraits/men/37.jpg', 'Researcher', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 607: Kabir Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.menon.607@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Menon', 'PhD', 36892.36, 168.85, 'Male', '1995-04-26', 'https://randomuser.me/api/portraits/men/79.jpg', 'Interior Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 608: Dhruv Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.saxena.608@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Saxena', 'High School', 198921.74, 169.09, 'Male', '1990-08-14', 'https://randomuser.me/api/portraits/men/51.jpg', 'Pharmacist', 'Muslim', 'Sheikh', v_user_id);

    -- User 609: Mira Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('mira.joshi.609@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Mira', 'Joshi', 'PhD', 137817.68, 153.87, 'Female', '1990-03-24', 'https://randomuser.me/api/portraits/women/88.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    -- User 610: Ansh Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.agarwal.610@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Agarwal', 'PhD', 187425.14, 160.6, 'Male', '1981-06-23', 'https://randomuser.me/api/portraits/men/42.jpg', 'Content Writer', 'Jain', 'Agarwal', v_user_id);

    -- User 611: Sara Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.reddy.611@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Reddy', 'High School', 134738.59, 171.19, 'Female', '2001-05-26', 'https://randomuser.me/api/portraits/women/52.jpg', 'Entrepreneur', 'Muslim', 'Qureshi', v_user_id);

    -- User 612: Arnav Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.tiwari.612@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Tiwari', 'High School', 32515.86, 176.83, 'Male', '1988-03-24', 'https://randomuser.me/api/portraits/men/55.jpg', 'Pilot', 'Hindu', 'Brahmin', v_user_id);

    -- User 613: Sara Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.garg.613@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Garg', 'High School', 163844.47, 170.78, 'Female', '2001-02-11', 'https://randomuser.me/api/portraits/women/10.jpg', 'Designer', 'Jain', 'Oswal', v_user_id);

    -- User 614: Akash Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.dutta.614@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Dutta', 'High School', 46903.99, 170.08, 'Male', '1993-02-23', 'https://randomuser.me/api/portraits/men/62.jpg', 'Chartered Accountant', 'Hindu', 'Vaishya', v_user_id);

    -- User 615: Ishaan Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.ghosh.615@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Ghosh', 'Bachelor's', 80486.27, 170.46, 'Male', '1980-02-12', 'https://randomuser.me/api/portraits/men/92.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    -- User 616: Pihu Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.sharma.616@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Sharma', 'High School', 111192.59, 161.18, 'Female', '1992-12-21', 'https://randomuser.me/api/portraits/women/78.jpg', 'Pilot', 'Hindu', 'Kshatriya', v_user_id);

    -- User 617: Naksh Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.verma.617@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Verma', 'High School', 100131.71, 163.68, 'Male', '2001-07-25', 'https://randomuser.me/api/portraits/men/74.jpg', 'Professor', 'Jain', 'Shrimal', v_user_id);

    -- User 618: Shlok Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.dutta.618@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Dutta', 'Master's', 63850.23, 172.93, 'Male', '1981-04-06', 'https://randomuser.me/api/portraits/men/24.jpg', 'Consultant', 'Christian', 'Roman Catholic', v_user_id);

    -- User 619: Darsh Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.tiwari.619@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Tiwari', 'Bachelor's', 186338.82, 189.38, 'Male', '1989-02-26', 'https://randomuser.me/api/portraits/men/67.jpg', 'Entrepreneur', 'Jain', 'Porwal', v_user_id);

    -- User 620: Kriti Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.srivastava.620@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Srivastava', 'PhD', 84553.58, 161.59, 'Female', '1998-01-08', 'https://randomuser.me/api/portraits/women/94.jpg', 'Interior Designer', 'Muslim', 'Syed', v_user_id);

    -- User 621: Tanish Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.rathore.621@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Rathore', 'High School', 198698.92, 167.22, 'Male', '1987-10-27', 'https://randomuser.me/api/portraits/men/57.jpg', 'Photographer', 'Hindu', 'Vaishya', v_user_id);

    -- User 622: Meera Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.verma.622@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Verma', 'PhD', 77296.68, 154.33, 'Female', '1987-04-23', 'https://randomuser.me/api/portraits/women/84.jpg', 'Pilot', 'Sikh', 'Kamboj', v_user_id);

    -- User 623: Zara Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.mukherjee.623@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Mukherjee', 'Bachelor's', 135888.48, 163.92, 'Female', '2003-09-12', 'https://randomuser.me/api/portraits/women/20.jpg', 'Entrepreneur', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 624: Pihu Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.thakur.624@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Thakur', 'Bachelor's', 64183.34, 153.68, 'Female', '1980-01-16', 'https://randomuser.me/api/portraits/women/65.jpg', 'Civil Servant', 'Christian', 'Roman Catholic', v_user_id);

    -- User 625: Bhavya Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.ali.625@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Ali', 'Master's', 157823.87, 162.55, 'Female', '1990-06-08', 'https://randomuser.me/api/portraits/women/15.jpg', 'Banker', 'Muslim', 'Syed', v_user_id);

    -- User 626: Gauri Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.roy.626@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Roy', 'High School', 48319.98, 156.01, 'Female', '1985-08-24', 'https://randomuser.me/api/portraits/women/35.jpg', 'Content Writer', 'Sikh', 'Arora', v_user_id);

    -- User 627: Reyansh Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.jain.627@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Jain', 'Bachelor's', 39582.42, 169.23, 'Male', '1983-10-26', 'https://randomuser.me/api/portraits/men/45.jpg', 'Photographer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 628: Kiaan Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.menon.628@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Menon', 'PhD', 186958.12, 183.63, 'Male', '1994-05-20', 'https://randomuser.me/api/portraits/men/7.jpg', 'Civil Engineer', 'Hindu', 'Jat', v_user_id);

    -- User 629: Karan Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.mishra.629@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Mishra', 'PhD', 138379.31, 162.96, 'Male', '1987-08-20', 'https://randomuser.me/api/portraits/men/48.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    -- User 630: Arman Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.malhotra.630@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Malhotra', 'PhD', 114731.26, 161.21, 'Male', '1982-04-13', 'https://randomuser.me/api/portraits/men/24.jpg', 'Marketing Manager', 'Jain', 'Agarwal', v_user_id);

    -- User 631: Madhav Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.dutta.631@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Dutta', 'Bachelor's', 62141.49, 169.42, 'Male', '1988-11-18', 'https://randomuser.me/api/portraits/men/95.jpg', 'Banker', 'Sikh', 'Jat', v_user_id);

    -- User 632: Pranav Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.khan.632@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Khan', 'High School', 128529.41, 168.07, 'Male', '1996-01-25', 'https://randomuser.me/api/portraits/men/67.jpg', 'Doctor', 'Jain', 'Porwal', v_user_id);

    -- User 633: Avni Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('avni.sen.633@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Avni', 'Sen', 'Master's', 179962.12, 153.93, 'Female', '1980-06-09', 'https://randomuser.me/api/portraits/women/42.jpg', 'Banker', 'Hindu', 'Shudra', v_user_id);

    -- User 634: Krishna Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.sharma.634@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Sharma', 'PhD', 180611.99, 189.02, 'Male', '1982-06-20', 'https://randomuser.me/api/portraits/men/6.jpg', 'Nurse', 'Sikh', 'Arora', v_user_id);

    -- User 635: Karan Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.jain.635@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Jain', 'Master's', 103775.46, 160.88, 'Male', '2001-03-16', 'https://randomuser.me/api/portraits/men/84.jpg', 'Software Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 636: Dhruv Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.bose.636@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Bose', 'Bachelor's', 55348.48, 177.06, 'Male', '2004-01-23', 'https://randomuser.me/api/portraits/men/33.jpg', 'Interior Designer', 'Hindu', 'Brahmin', v_user_id);

    -- User 637: Ananya Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.agarwal.637@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Agarwal', 'High School', 178781.92, 163.78, 'Female', '1983-01-24', 'https://randomuser.me/api/portraits/women/24.jpg', 'Doctor', 'Hindu', 'Brahmin', v_user_id);

    -- User 638: Kritika Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.nair.638@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Nair', 'PhD', 40262.42, 174.06, 'Female', '1998-02-17', 'https://randomuser.me/api/portraits/women/93.jpg', 'Lawyer', 'Hindu', 'Brahmin', v_user_id);

    -- User 639: Nisha Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nisha.das.639@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nisha', 'Das', 'Master's', 126229.29, 157.34, 'Female', '1981-04-12', 'https://randomuser.me/api/portraits/women/27.jpg', 'Product Manager', 'Hindu', 'Shudra', v_user_id);

    -- User 640: Vivaan Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.chaudhary.640@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Chaudhary', 'Bachelor's', 98621.49, 176.92, 'Male', '1995-07-21', 'https://randomuser.me/api/portraits/men/68.jpg', 'Designer', 'Jain', 'Shrimal', v_user_id);

    -- User 641: Yash Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.kapoor.641@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Kapoor', 'High School', 122424.53, 178.63, 'Male', '1998-03-10', 'https://randomuser.me/api/portraits/men/56.jpg', 'Financial Analyst', 'Muslim', 'Qureshi', v_user_id);

    -- User 642: Navya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.mehta.642@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Mehta', 'High School', 167423.54, 171.93, 'Female', '1989-02-28', 'https://randomuser.me/api/portraits/women/61.jpg', 'Financial Analyst', 'Buddhist', 'Mahar', v_user_id);

    -- User 643: Shanaya Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.kaur.643@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Kaur', 'High School', 40747.26, 165.63, 'Female', '1987-09-05', 'https://randomuser.me/api/portraits/women/13.jpg', 'Designer', 'Hindu', 'Vaishya', v_user_id);

    -- User 644: Navya Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.malhotra.644@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Malhotra', 'High School', 93754.93, 159.68, 'Female', '1980-08-19', 'https://randomuser.me/api/portraits/women/73.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    -- User 645: Ansh Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.sharma.645@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Sharma', 'PhD', 84685.32, 175.57, 'Male', '2003-07-22', 'https://randomuser.me/api/portraits/men/80.jpg', 'Chef', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 646: Bhavya Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.malhotra.646@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Malhotra', 'PhD', 189433.91, 167.77, 'Female', '1980-09-07', 'https://randomuser.me/api/portraits/women/44.jpg', 'Marketing Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 647: Yash Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.pillai.647@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Pillai', 'Bachelor's', 145585.87, 184.36, 'Male', '2001-01-02', 'https://randomuser.me/api/portraits/men/29.jpg', 'Lawyer', 'Buddhist', 'Chamar', v_user_id);

    -- User 648: Anika Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.nair.648@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Nair', 'PhD', 49902.93, 159.68, 'Female', '1993-06-09', 'https://randomuser.me/api/portraits/women/3.jpg', 'Financial Analyst', 'Christian', 'Latin Catholic', v_user_id);

    -- User 649: Laksh Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.chopra.649@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Chopra', 'Master's', 56783.9, 177.38, 'Male', '1991-06-17', 'https://randomuser.me/api/portraits/men/3.jpg', 'Dentist', 'Muslim', 'Syed', v_user_id);

    -- User 650: Ansh Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.sinha.650@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Sinha', 'Master's', 178460.72, 186.08, 'Male', '1981-06-17', 'https://randomuser.me/api/portraits/men/72.jpg', 'Lawyer', 'Muslim', 'Pathan', v_user_id);

    -- User 651: Siya Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.bansal.651@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Bansal', 'Bachelor's', 134476.65, 164.69, 'Female', '1995-09-23', 'https://randomuser.me/api/portraits/women/97.jpg', 'Photographer', 'Muslim', 'Ansari', v_user_id);

    -- User 652: Kunal Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kunal.yadav.652@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kunal', 'Yadav', 'Master's', 175005.78, 188.96, 'Male', '1980-05-02', 'https://randomuser.me/api/portraits/men/19.jpg', 'Professor', 'Hindu', 'Jat', v_user_id);

    -- User 653: Shaurya Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.chopra.653@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Chopra', 'Master's', 93167.66, 180.43, 'Male', '2000-06-21', 'https://randomuser.me/api/portraits/men/58.jpg', 'HR Manager', 'Muslim', 'Pathan', v_user_id);

    -- User 654: Shanaya Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.bhat.654@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Bhat', 'PhD', 74398.48, 155.86, 'Female', '2000-06-23', 'https://randomuser.me/api/portraits/women/67.jpg', 'HR Manager', 'Jain', 'Porwal', v_user_id);

    -- User 655: Aarush Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.shah.655@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Shah', 'Bachelor's', 70676.82, 164.79, 'Male', '1990-08-12', 'https://randomuser.me/api/portraits/men/86.jpg', 'Consultant', 'Muslim', 'Qureshi', v_user_id);

    -- User 656: Dev Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.kapoor.656@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Kapoor', 'Master's', 147492.48, 161.31, 'Male', '1981-11-19', 'https://randomuser.me/api/portraits/men/61.jpg', 'Architect', 'Sikh', 'Jat', v_user_id);

    -- User 657: Nisha Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nisha.chauhan.657@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nisha', 'Chauhan', 'Master's', 187870.04, 152.7, 'Female', '1996-02-25', 'https://randomuser.me/api/portraits/women/4.jpg', 'Product Manager', 'Hindu', 'Kayastha', v_user_id);

    -- User 658: Kabir Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.chauhan.658@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Chauhan', 'Bachelor's', 155476.84, 163.08, 'Male', '1991-07-06', 'https://randomuser.me/api/portraits/men/54.jpg', 'Content Writer', 'Muslim', 'Qureshi', v_user_id);

    -- User 659: Aadhya Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.gupta.659@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Gupta', 'Master's', 53269.74, 174.48, 'Female', '1982-12-24', 'https://randomuser.me/api/portraits/women/100.jpg', 'Teacher', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 660: Sara Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.saxena.660@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Saxena', 'High School', 122490.0, 158.14, 'Female', '1989-01-20', 'https://randomuser.me/api/portraits/women/9.jpg', 'Chef', 'Hindu', 'Kayastha', v_user_id);

    -- User 661: Nikhil Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.nair.661@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Nair', 'High School', 127621.49, 161.64, 'Male', '1981-05-09', 'https://randomuser.me/api/portraits/men/68.jpg', 'Product Manager', 'Sikh', 'Arora', v_user_id);

    -- User 662: Riddhi Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.iyer.662@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Iyer', 'Bachelor's', 46586.07, 171.29, 'Female', '1985-01-14', 'https://randomuser.me/api/portraits/women/83.jpg', 'Entrepreneur', 'Muslim', 'Qureshi', v_user_id);

    -- User 663: Rahul Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.mishra.663@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Mishra', 'High School', 117163.02, 178.02, 'Male', '1988-02-12', 'https://randomuser.me/api/portraits/men/45.jpg', 'Fashion Designer', 'Hindu', 'Jat', v_user_id);

    -- User 664: Param Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.ghosh.664@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Ghosh', 'High School', 187136.82, 189.2, 'Male', '1992-04-07', 'https://randomuser.me/api/portraits/men/36.jpg', 'Consultant', 'Hindu', 'Vaishya', v_user_id);

    -- User 665: Akash Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.gupta.665@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Gupta', 'Master's', 133028.7, 168.01, 'Male', '1992-04-18', 'https://randomuser.me/api/portraits/men/57.jpg', 'Architect', 'Buddhist', 'Chamar', v_user_id);

    -- User 666: Akash Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.mehta.666@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Mehta', 'Master's', 30327.36, 164.0, 'Male', '2004-11-04', 'https://randomuser.me/api/portraits/men/82.jpg', 'Electrical Engineer', 'Buddhist', 'Chamar', v_user_id);

    -- User 667: Reyansh Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.chaudhary.667@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Chaudhary', 'Bachelor's', 156954.45, 175.07, 'Male', '1987-05-20', 'https://randomuser.me/api/portraits/men/48.jpg', 'Dentist', 'Christian', 'Protestant', v_user_id);

    -- User 668: Angel Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.bhat.668@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Bhat', 'Bachelor's', 147883.88, 158.86, 'Female', '1998-11-20', 'https://randomuser.me/api/portraits/women/76.jpg', 'Researcher', 'Muslim', 'Pathan', v_user_id);

    -- User 669: Nikhil Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.dutta.669@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Dutta', 'Bachelor's', 36028.1, 187.99, 'Male', '1990-07-05', 'https://randomuser.me/api/portraits/men/16.jpg', 'Operations Manager', 'Hindu', 'Kayastha', v_user_id);

    -- User 670: Harsh Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.chaudhary.670@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Chaudhary', 'Bachelor's', 47896.24, 171.67, 'Male', '1987-02-23', 'https://randomuser.me/api/portraits/men/7.jpg', 'Nurse', 'Jain', 'Oswal', v_user_id);

    -- User 671: Tanvi Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanvi.pillai.671@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanvi', 'Pillai', 'PhD', 166486.0, 152.68, 'Female', '1989-04-10', 'https://randomuser.me/api/portraits/women/33.jpg', 'Professor', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 672: Darsh Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.kapoor.672@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Kapoor', 'High School', 199132.05, 166.86, 'Male', '1995-12-12', 'https://randomuser.me/api/portraits/men/18.jpg', 'Data Analyst', 'Hindu', 'Rajput', v_user_id);

    -- User 673: Arnav Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.mishra.673@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Mishra', 'Master's', 80312.95, 169.77, 'Male', '1996-10-16', 'https://randomuser.me/api/portraits/men/62.jpg', 'Financial Analyst', 'Buddhist', 'Mahar', v_user_id);

    -- User 674: Madhav Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.chaudhary.674@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Chaudhary', 'PhD', 68568.44, 172.53, 'Male', '1994-07-21', 'https://randomuser.me/api/portraits/men/45.jpg', 'Civil Servant', 'Jain', 'Agarwal', v_user_id);

    -- User 675: Aadhya Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.iyer.675@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Iyer', 'Bachelor's', 136848.9, 173.87, 'Female', '2002-07-24', 'https://randomuser.me/api/portraits/women/55.jpg', 'Fashion Designer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 676: Neha Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('neha.tiwari.676@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Neha', 'Tiwari', 'High School', 80406.19, 159.31, 'Female', '1986-10-23', 'https://randomuser.me/api/portraits/women/69.jpg', 'Nurse', 'Sikh', 'Kamboj', v_user_id);

    -- User 677: Chirag Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.mukherjee.677@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Mukherjee', 'Master's', 118677.84, 175.07, 'Male', '2004-06-19', 'https://randomuser.me/api/portraits/men/24.jpg', 'Civil Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 678: Karan Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.shukla.678@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Shukla', 'Master's', 110797.73, 169.53, 'Male', '2003-05-03', 'https://randomuser.me/api/portraits/men/67.jpg', 'Pharmacist', 'Jain', 'Porwal', v_user_id);

    -- User 679: Reyansh Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.chatterjee.679@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Chatterjee', 'PhD', 197907.57, 185.39, 'Male', '1985-02-21', 'https://randomuser.me/api/portraits/men/61.jpg', 'Civil Servant', 'Buddhist', 'Chamar', v_user_id);

    -- User 680: Rahul Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.iyer.680@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Iyer', 'Master's', 168817.01, 161.31, 'Male', '1992-08-27', 'https://randomuser.me/api/portraits/men/84.jpg', 'Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 681: Yash Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.roy.681@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Roy', 'High School', 112090.04, 175.6, 'Male', '1980-06-15', 'https://randomuser.me/api/portraits/men/67.jpg', 'Civil Engineer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 682: Tara Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.verma.682@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Verma', 'PhD', 102837.63, 158.43, 'Female', '1986-07-03', 'https://randomuser.me/api/portraits/women/81.jpg', 'Professor', 'Sikh', 'Kamboj', v_user_id);

    -- User 683: Advik Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.bansal.683@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Bansal', 'Bachelor's', 101840.62, 177.9, 'Male', '1991-12-02', 'https://randomuser.me/api/portraits/men/36.jpg', 'Financial Analyst', 'Jain', 'Shrimal', v_user_id);

    -- User 684: Tanish Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.pandey.684@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Pandey', 'Master's', 115729.88, 178.61, 'Male', '2003-05-12', 'https://randomuser.me/api/portraits/men/12.jpg', 'Mechanical Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 685: Riya Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.iyer.685@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Iyer', 'Bachelor's', 155643.8, 151.08, 'Female', '1980-05-10', 'https://randomuser.me/api/portraits/women/38.jpg', 'Chartered Accountant', 'Christian', 'Syrian Christian', v_user_id);

    -- User 686: Naksh Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.pandey.686@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Pandey', 'Master's', 127419.12, 185.28, 'Male', '1986-01-06', 'https://randomuser.me/api/portraits/men/53.jpg', 'HR Manager', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 687: Dev Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dev.pillai.687@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dev', 'Pillai', 'High School', 63791.93, 184.85, 'Male', '1996-01-15', 'https://randomuser.me/api/portraits/men/17.jpg', 'Chef', 'Jain', 'Agarwal', v_user_id);

    -- User 688: Rudra Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.verma.688@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Verma', 'PhD', 121666.89, 169.78, 'Male', '1991-09-08', 'https://randomuser.me/api/portraits/men/63.jpg', 'Designer', 'Jain', 'Shrimal', v_user_id);

    -- User 689: Arjun Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.mehta.689@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Mehta', 'Master's', 124592.63, 170.44, 'Male', '1998-07-20', 'https://randomuser.me/api/portraits/men/89.jpg', 'Software Engineer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 690: Gauri Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.pandey.690@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Pandey', 'Master's', 196485.02, 161.49, 'Female', '1990-03-14', 'https://randomuser.me/api/portraits/women/44.jpg', 'Chef', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 691: Tara Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.chauhan.691@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Chauhan', 'Master's', 140825.67, 156.82, 'Female', '1995-04-09', 'https://randomuser.me/api/portraits/women/76.jpg', 'Product Manager', 'Muslim', 'Sheikh', v_user_id);

    -- User 692: Aayansh Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.thakur.692@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Thakur', 'High School', 34761.05, 166.12, 'Male', '1993-01-15', 'https://randomuser.me/api/portraits/men/58.jpg', 'Lawyer', 'Sikh', 'Jat', v_user_id);

    -- User 693: Rohan Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.malhotra.693@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Malhotra', 'High School', 49935.39, 160.54, 'Male', '1987-07-04', 'https://randomuser.me/api/portraits/men/9.jpg', 'Data Analyst', 'Hindu', 'Rajput', v_user_id);

    -- User 694: Laksh Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.nair.694@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Nair', 'PhD', 179555.81, 161.25, 'Male', '2000-07-24', 'https://randomuser.me/api/portraits/men/45.jpg', 'Researcher', 'Muslim', 'Syed', v_user_id);

    -- User 695: Pihu Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.sinha.695@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Sinha', 'Bachelor's', 85070.46, 168.54, 'Female', '1998-08-21', 'https://randomuser.me/api/portraits/women/24.jpg', 'Photographer', 'Buddhist', 'Mahar', v_user_id);

    -- User 696: Riddhi Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.nair.696@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Nair', 'Master's', 186438.96, 169.35, 'Female', '2001-05-03', 'https://randomuser.me/api/portraits/women/28.jpg', 'Financial Analyst', 'Christian', 'Protestant', v_user_id);

    -- User 697: Kriti Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.mishra.697@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Mishra', 'Bachelor's', 131449.18, 173.42, 'Female', '1984-06-17', 'https://randomuser.me/api/portraits/women/1.jpg', 'Mechanical Engineer', 'Muslim', 'Pathan', v_user_id);

    -- User 698: Diya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.mehta.698@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Mehta', 'PhD', 191440.12, 158.31, 'Female', '1986-09-22', 'https://randomuser.me/api/portraits/women/51.jpg', 'Business Owner', 'Christian', 'Protestant', v_user_id);

    -- User 699: Reyansh Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.nair.699@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Nair', 'PhD', 178404.36, 175.98, 'Male', '2001-10-09', 'https://randomuser.me/api/portraits/men/92.jpg', 'Electrical Engineer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 700: Param Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.bhattacharya.700@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Bhattacharya', 'High School', 49780.73, 160.4, 'Male', '1997-05-03', 'https://randomuser.me/api/portraits/men/83.jpg', 'Interior Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- Completed 700 profiles

    -- User 701: Maya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.singh.701@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Singh', 'High School', 135775.28, 154.86, 'Female', '1997-10-21', 'https://randomuser.me/api/portraits/women/98.jpg', 'Nurse', 'Christian', 'Latin Catholic', v_user_id);

    -- User 702: Anika Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.khan.702@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Khan', 'Bachelor's', 104558.99, 160.72, 'Female', '1999-09-08', 'https://randomuser.me/api/portraits/women/55.jpg', 'Project Manager', 'Hindu', 'Jat', v_user_id);

    -- User 703: Rohan Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.kapoor.703@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Kapoor', 'Master's', 153546.76, 160.47, 'Male', '1987-05-07', 'https://randomuser.me/api/portraits/men/31.jpg', 'Nurse', 'Sikh', 'Kamboj', v_user_id);

    -- User 704: Vivaan Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.shukla.704@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Shukla', 'Bachelor's', 199532.14, 165.0, 'Male', '1984-06-01', 'https://randomuser.me/api/portraits/men/30.jpg', 'Project Manager', 'Buddhist', 'Mahar', v_user_id);

    -- User 705: Arman Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arman.agarwal.705@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arman', 'Agarwal', 'PhD', 65430.43, 171.99, 'Male', '1980-11-23', 'https://randomuser.me/api/portraits/men/11.jpg', 'Researcher', 'Jain', 'Porwal', v_user_id);

    -- User 706: Maya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.mehta.706@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Mehta', 'Master's', 57605.98, 166.1, 'Female', '1991-03-09', 'https://randomuser.me/api/portraits/women/45.jpg', 'Mechanical Engineer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 707: Akash Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.chatterjee.707@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Chatterjee', 'High School', 62008.62, 173.62, 'Male', '1995-12-03', 'https://randomuser.me/api/portraits/men/16.jpg', 'Government Officer', 'Sikh', 'Kamboj', v_user_id);

    -- User 708: Madhav Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.gupta.708@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Gupta', 'Master's', 121275.29, 161.27, 'Male', '2004-09-01', 'https://randomuser.me/api/portraits/men/23.jpg', 'Content Writer', 'Muslim', 'Pathan', v_user_id);

    -- User 709: Karan Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.bhat.709@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Bhat', 'Master's', 60112.64, 166.55, 'Male', '1998-03-03', 'https://randomuser.me/api/portraits/men/3.jpg', 'Civil Servant', 'Muslim', 'Ansari', v_user_id);

    -- User 710: Vihaan Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.roy.710@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Roy', 'PhD', 133790.28, 172.57, 'Male', '1986-10-17', 'https://randomuser.me/api/portraits/men/73.jpg', 'Entrepreneur', 'Christian', 'Latin Catholic', v_user_id);

    -- User 711: Kiara Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.kumar.711@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Kumar', 'Bachelor's', 116744.45, 174.03, 'Female', '2003-04-06', 'https://randomuser.me/api/portraits/women/26.jpg', 'Accountant', 'Buddhist', 'Mahar', v_user_id);

    -- User 712: Rohan Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.garg.712@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Garg', 'Bachelor's', 144577.33, 182.21, 'Male', '1991-11-07', 'https://randomuser.me/api/portraits/men/34.jpg', 'Software Engineer', 'Hindu', 'Kshatriya', v_user_id);

    -- User 713: Atharv Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.kapoor.713@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Kapoor', 'High School', 144473.14, 174.08, 'Male', '1994-01-12', 'https://randomuser.me/api/portraits/men/53.jpg', 'Chartered Accountant', 'Christian', 'Syrian Christian', v_user_id);

    -- User 714: Aditi Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.kapoor.714@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Kapoor', 'High School', 72569.48, 158.89, 'Female', '1995-06-14', 'https://randomuser.me/api/portraits/women/32.jpg', 'Fashion Designer', 'Muslim', 'Pathan', v_user_id);

    -- User 715: Saanvi Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.das.715@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Das', 'Bachelor's', 129290.5, 173.1, 'Female', '2003-06-17', 'https://randomuser.me/api/portraits/women/1.jpg', 'Business Owner', 'Hindu', 'Vaishya', v_user_id);

    -- User 716: Sakshi Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.bhattacharya.716@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Bhattacharya', 'High School', 52525.75, 154.82, 'Female', '1982-01-04', 'https://randomuser.me/api/portraits/women/51.jpg', 'Government Officer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 717: Chirag Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.rathore.717@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Rathore', 'Bachelor's', 152535.83, 171.65, 'Male', '1988-01-24', 'https://randomuser.me/api/portraits/men/85.jpg', 'Government Officer', 'Muslim', 'Sheikh', v_user_id);

    -- User 718: Isha Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.sinha.718@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Sinha', 'Bachelor's', 65474.24, 153.57, 'Female', '1984-10-01', 'https://randomuser.me/api/portraits/women/87.jpg', 'Mechanical Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 719: Bhavya Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.roy.719@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Roy', 'High School', 177127.16, 152.6, 'Female', '1995-07-11', 'https://randomuser.me/api/portraits/women/28.jpg', 'Dentist', 'Sikh', 'Arora', v_user_id);

    -- User 720: Sara Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.nair.720@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Nair', 'Master's', 101708.71, 161.97, 'Female', '1999-12-06', 'https://randomuser.me/api/portraits/women/82.jpg', 'Banker', 'Christian', 'Protestant', v_user_id);

    -- User 721: Maya Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.sharma.721@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Sharma', 'PhD', 132002.9, 164.61, 'Female', '1986-08-15', 'https://randomuser.me/api/portraits/women/90.jpg', 'Doctor', 'Muslim', 'Pathan', v_user_id);

    -- User 722: Aryan Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.malhotra.722@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Malhotra', 'Bachelor's', 138030.96, 170.4, 'Male', '1996-11-24', 'https://randomuser.me/api/portraits/men/90.jpg', 'Fashion Designer', 'Hindu', 'Kayastha', v_user_id);

    -- User 723: Kritika Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.chopra.723@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Chopra', 'Bachelor's', 121650.71, 167.24, 'Female', '1995-08-05', 'https://randomuser.me/api/portraits/women/10.jpg', 'Civil Servant', 'Jain', 'Shrimal', v_user_id);

    -- User 724: Pari Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.mehta.724@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Mehta', 'Bachelor's', 195962.25, 166.86, 'Female', '1987-07-22', 'https://randomuser.me/api/portraits/women/65.jpg', 'Operations Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 725: Prisha Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.saxena.725@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Saxena', 'Bachelor's', 61084.31, 160.95, 'Female', '1996-08-09', 'https://randomuser.me/api/portraits/women/99.jpg', 'Civil Servant', 'Sikh', 'Arora', v_user_id);

    -- User 726: Param Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.iyer.726@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Iyer', 'Bachelor's', 115512.76, 166.56, 'Male', '1986-03-26', 'https://randomuser.me/api/portraits/men/50.jpg', 'Content Writer', 'Muslim', 'Syed', v_user_id);

    -- User 727: Aaradhya Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.joshi.727@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Joshi', 'High School', 164005.26, 158.54, 'Female', '1998-01-23', 'https://randomuser.me/api/portraits/women/95.jpg', 'Photographer', 'Hindu', 'Jat', v_user_id);

    -- User 728: Priya Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('priya.pillai.728@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Priya', 'Pillai', 'High School', 162129.34, 151.26, 'Female', '1986-06-22', 'https://randomuser.me/api/portraits/women/42.jpg', 'Chef', 'Muslim', 'Sheikh', v_user_id);

    -- User 729: Aryan Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.garg.729@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Garg', 'PhD', 154914.9, 170.67, 'Male', '1989-12-10', 'https://randomuser.me/api/portraits/men/65.jpg', 'Interior Designer', 'Muslim', 'Pathan', v_user_id);

    -- User 730: Anushka Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.khan.730@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Khan', 'Master's', 176978.18, 154.9, 'Female', '1985-03-20', 'https://randomuser.me/api/portraits/women/79.jpg', 'Photographer', 'Buddhist', 'Chamar', v_user_id);

    -- User 731: Aditya Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.chauhan.731@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Chauhan', 'High School', 130834.54, 171.42, 'Male', '1982-11-18', 'https://randomuser.me/api/portraits/men/13.jpg', 'Dentist', 'Hindu', 'Brahmin', v_user_id);

    -- User 732: Tanish Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.sen.732@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Sen', 'High School', 108729.0, 166.77, 'Male', '1995-04-14', 'https://randomuser.me/api/portraits/men/3.jpg', 'Consultant', 'Hindu', 'Brahmin', v_user_id);

    -- User 733: Aaradhya Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.menon.733@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Menon', 'Bachelor's', 103805.84, 163.04, 'Female', '2003-05-18', 'https://randomuser.me/api/portraits/women/57.jpg', 'Interior Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 734: Kabir Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.ali.734@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Ali', 'Bachelor's', 180633.26, 166.37, 'Male', '1992-09-15', 'https://randomuser.me/api/portraits/men/68.jpg', 'Banker', 'Jain', 'Agarwal', v_user_id);

    -- User 735: Pooja Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pooja.kaur.735@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pooja', 'Kaur', 'PhD', 90064.2, 165.08, 'Female', '1991-05-26', 'https://randomuser.me/api/portraits/women/56.jpg', 'Pilot', 'Buddhist', 'Mahar', v_user_id);

    -- User 736: Meera Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.chaudhary.736@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Chaudhary', 'Bachelor's', 94089.3, 173.41, 'Female', '1997-08-04', 'https://randomuser.me/api/portraits/women/73.jpg', 'Operations Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 737: Pari Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.thakur.737@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Thakur', 'Bachelor's', 151530.56, 157.5, 'Female', '1980-06-19', 'https://randomuser.me/api/portraits/women/27.jpg', 'Chartered Accountant', 'Sikh', 'Kamboj', v_user_id);

    -- User 738: Bhavya Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.dubey.738@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Dubey', 'PhD', 130574.34, 152.75, 'Female', '2004-01-03', 'https://randomuser.me/api/portraits/women/64.jpg', 'Product Manager', 'Muslim', 'Qureshi', v_user_id);

    -- User 739: Ansh Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.sharma.739@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Sharma', 'PhD', 46507.0, 177.54, 'Male', '1994-12-23', 'https://randomuser.me/api/portraits/men/38.jpg', 'Pharmacist', 'Hindu', 'Vaishya', v_user_id);

    -- User 740: Disha Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.saxena.740@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Saxena', 'Master's', 38325.44, 168.56, 'Female', '1980-05-28', 'https://randomuser.me/api/portraits/women/96.jpg', 'Data Analyst', 'Muslim', 'Pathan', v_user_id);

    -- User 741: Diya Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.patel.741@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Patel', 'Bachelor's', 100649.71, 157.62, 'Female', '1988-07-11', 'https://randomuser.me/api/portraits/women/98.jpg', 'Interior Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 742: Karthik Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.chauhan.742@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Chauhan', 'PhD', 41914.6, 165.65, 'Male', '1992-09-23', 'https://randomuser.me/api/portraits/men/71.jpg', 'Accountant', 'Sikh', 'Kamboj', v_user_id);

    -- User 743: Advik Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.bansal.743@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Bansal', 'Master's', 35793.19, 170.56, 'Male', '1990-10-11', 'https://randomuser.me/api/portraits/men/31.jpg', 'Civil Engineer', 'Buddhist', 'Chamar', v_user_id);

    -- User 744: Aditi Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditi.malhotra.744@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditi', 'Malhotra', 'Master's', 83111.32, 156.75, 'Female', '1992-05-13', 'https://randomuser.me/api/portraits/women/1.jpg', 'Content Writer', 'Hindu', 'Vaishya', v_user_id);

    -- User 745: Kiara Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.patel.745@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Patel', 'Master's', 86326.47, 171.91, 'Female', '1983-11-22', 'https://randomuser.me/api/portraits/women/82.jpg', 'Fashion Designer', 'Sikh', 'Kamboj', v_user_id);

    -- User 746: Advait Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.srivastava.746@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Srivastava', 'PhD', 58980.31, 174.33, 'Male', '1999-05-26', 'https://randomuser.me/api/portraits/men/97.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    -- User 747: Aayansh Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.bose.747@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Bose', 'Bachelor's', 57856.12, 184.35, 'Male', '1996-08-28', 'https://randomuser.me/api/portraits/men/98.jpg', 'Data Analyst', 'Hindu', 'Vaishya', v_user_id);

    -- User 748: Naksh Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.mishra.748@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Mishra', 'Master's', 57888.35, 189.32, 'Male', '1982-05-18', 'https://randomuser.me/api/portraits/men/62.jpg', 'Software Engineer', 'Buddhist', 'Mahar', v_user_id);

    -- User 749: Shreya Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.menon.749@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Menon', 'Bachelor's', 74288.44, 161.78, 'Female', '2002-05-18', 'https://randomuser.me/api/portraits/women/46.jpg', 'Civil Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 750: Siya Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.saxena.750@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Saxena', 'Bachelor's', 51868.72, 163.77, 'Female', '1996-05-21', 'https://randomuser.me/api/portraits/women/59.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    -- User 751: Pari Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.rathore.751@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Rathore', 'High School', 138037.34, 164.59, 'Female', '1996-05-13', 'https://randomuser.me/api/portraits/women/71.jpg', 'Doctor', 'Muslim', 'Sheikh', v_user_id);

    -- User 752: Kiaan Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.pillai.752@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Pillai', 'High School', 49283.19, 170.16, 'Male', '1991-04-26', 'https://randomuser.me/api/portraits/men/75.jpg', 'Consultant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 753: Arnav Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.chauhan.753@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Chauhan', 'Bachelor's', 140417.88, 161.94, 'Male', '1990-06-04', 'https://randomuser.me/api/portraits/men/98.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 754: Shlok Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.saxena.754@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Saxena', 'Bachelor's', 117191.78, 169.8, 'Male', '1993-07-04', 'https://randomuser.me/api/portraits/men/76.jpg', 'Interior Designer', 'Sikh', 'Kamboj', v_user_id);

    -- User 755: Shlok Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.rao.755@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Rao', 'High School', 32179.71, 184.98, 'Male', '2001-06-02', 'https://randomuser.me/api/portraits/men/50.jpg', 'Pharmacist', 'Jain', 'Oswal', v_user_id);

    -- User 756: Tanish Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.jain.756@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Jain', 'Bachelor's', 162132.84, 183.34, 'Male', '1992-08-28', 'https://randomuser.me/api/portraits/men/34.jpg', 'Civil Servant', 'Sikh', 'Jat', v_user_id);

    -- User 757: Kunal Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kunal.gupta.757@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kunal', 'Gupta', 'High School', 195965.35, 163.12, 'Male', '1991-07-13', 'https://randomuser.me/api/portraits/men/56.jpg', 'Operations Manager', 'Sikh', 'Arora', v_user_id);

    -- User 758: Aarav Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.mishra.758@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Mishra', 'PhD', 152420.55, 177.01, 'Male', '1988-06-07', 'https://randomuser.me/api/portraits/men/73.jpg', 'Electrical Engineer', 'Hindu', 'Vaishya', v_user_id);

    -- User 759: Anjali Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.pillai.759@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Pillai', 'High School', 143941.62, 168.98, 'Female', '2003-08-13', 'https://randomuser.me/api/portraits/women/18.jpg', 'Professor', 'Christian', 'Roman Catholic', v_user_id);

    -- User 760: Atharv Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.nair.760@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Nair', 'Bachelor's', 171870.36, 176.42, 'Male', '1998-06-08', 'https://randomuser.me/api/portraits/men/90.jpg', 'Architect', 'Muslim', 'Pathan', v_user_id);

    -- User 761: Jiya Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.srivastava.761@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Srivastava', 'Bachelor's', 88256.48, 171.43, 'Female', '2004-11-20', 'https://randomuser.me/api/portraits/women/88.jpg', 'Dentist', 'Muslim', 'Qureshi', v_user_id);

    -- User 762: Disha Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.sinha.762@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Sinha', 'PhD', 194095.28, 165.82, 'Female', '1992-01-04', 'https://randomuser.me/api/portraits/women/84.jpg', 'Pharmacist', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 763: Arnav Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.kumar.763@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Kumar', 'High School', 135131.08, 189.87, 'Male', '1984-04-20', 'https://randomuser.me/api/portraits/men/22.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    -- User 764: Prisha Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.dubey.764@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Dubey', 'High School', 172270.27, 172.51, 'Female', '1993-09-13', 'https://randomuser.me/api/portraits/women/59.jpg', 'Professor', 'Buddhist', 'Mahar', v_user_id);

    -- User 765: Pranav Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pranav.rao.765@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pranav', 'Rao', 'Bachelor's', 33513.18, 189.64, 'Male', '1989-05-16', 'https://randomuser.me/api/portraits/men/10.jpg', 'Financial Analyst', 'Buddhist', 'Mahar', v_user_id);

    -- User 766: Aayansh Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.rao.766@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Rao', 'High School', 170907.86, 185.4, 'Male', '1997-05-05', 'https://randomuser.me/api/portraits/men/61.jpg', 'Accountant', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 767: Karan Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.srivastava.767@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Srivastava', 'PhD', 57503.17, 168.67, 'Male', '1997-06-23', 'https://randomuser.me/api/portraits/men/81.jpg', 'Operations Manager', 'Muslim', 'Pathan', v_user_id);

    -- User 768: Prisha Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.garg.768@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Garg', 'PhD', 61582.23, 153.77, 'Female', '2004-01-03', 'https://randomuser.me/api/portraits/women/79.jpg', 'Teacher', 'Hindu', 'Brahmin', v_user_id);

    -- User 769: Sara Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.garg.769@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Garg', 'PhD', 124925.08, 173.31, 'Female', '1983-03-01', 'https://randomuser.me/api/portraits/women/1.jpg', 'Product Manager', 'Muslim', 'Ansari', v_user_id);

    -- User 770: Naksh Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.agarwal.770@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Agarwal', 'Master's', 31239.45, 171.87, 'Male', '1997-11-16', 'https://randomuser.me/api/portraits/men/29.jpg', 'Dentist', 'Muslim', 'Sheikh', v_user_id);

    -- User 771: Rahul Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.ghosh.771@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Ghosh', 'Bachelor's', 175034.82, 164.72, 'Male', '2002-08-04', 'https://randomuser.me/api/portraits/men/3.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 772: Neha Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('neha.roy.772@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Neha', 'Roy', 'Bachelor's', 189449.72, 152.99, 'Female', '1993-06-16', 'https://randomuser.me/api/portraits/women/30.jpg', 'Civil Servant', 'Jain', 'Oswal', v_user_id);

    -- User 773: Pari Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.pandey.773@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Pandey', 'Master's', 191730.61, 158.33, 'Female', '1984-04-26', 'https://randomuser.me/api/portraits/women/63.jpg', 'Chef', 'Christian', 'Roman Catholic', v_user_id);

    -- User 774: Saanvi Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.chatterjee.774@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Chatterjee', 'PhD', 44307.82, 154.27, 'Female', '1996-10-15', 'https://randomuser.me/api/portraits/women/61.jpg', 'Content Writer', 'Hindu', 'Vaishya', v_user_id);

    -- User 775: Kritika Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kritika.dubey.775@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kritika', 'Dubey', 'PhD', 81415.14, 171.16, 'Female', '1983-08-18', 'https://randomuser.me/api/portraits/women/33.jpg', 'HR Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 776: Meera Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.chatterjee.776@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Chatterjee', 'High School', 61050.99, 152.62, 'Female', '1983-11-26', 'https://randomuser.me/api/portraits/women/90.jpg', 'Entrepreneur', 'Muslim', 'Sheikh', v_user_id);

    -- User 777: Pari Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.verma.777@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Verma', 'High School', 109485.56, 162.18, 'Female', '1995-02-14', 'https://randomuser.me/api/portraits/women/15.jpg', 'Civil Engineer', 'Hindu', 'Vaishya', v_user_id);

    -- User 778: Vivaan Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.kaur.778@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Kaur', 'PhD', 59874.83, 171.28, 'Male', '2003-04-13', 'https://randomuser.me/api/portraits/men/71.jpg', 'Photographer', 'Muslim', 'Qureshi', v_user_id);

    -- User 779: Ishaan Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.garg.779@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Garg', 'Master's', 109015.03, 173.63, 'Male', '1986-08-04', 'https://randomuser.me/api/portraits/men/3.jpg', 'Banker', 'Jain', 'Oswal', v_user_id);

    -- User 780: Harsh Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.chakraborty.780@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Chakraborty', 'High School', 129926.56, 189.26, 'Male', '1999-12-23', 'https://randomuser.me/api/portraits/men/51.jpg', 'Civil Servant', 'Christian', 'Syrian Christian', v_user_id);

    -- User 781: Anushka Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.chaudhary.781@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Chaudhary', 'High School', 169191.6, 160.84, 'Female', '1987-08-01', 'https://randomuser.me/api/portraits/women/68.jpg', 'Consultant', 'Buddhist', 'Mahar', v_user_id);

    -- User 782: Vihaan Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.mehta.782@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Mehta', 'Bachelor's', 45185.93, 187.37, 'Male', '1994-03-03', 'https://randomuser.me/api/portraits/men/15.jpg', 'Operations Manager', 'Christian', 'Roman Catholic', v_user_id);

    -- User 783: Vivaan Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.bose.783@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Bose', 'Master's', 73535.12, 167.05, 'Male', '1991-08-08', 'https://randomuser.me/api/portraits/men/87.jpg', 'Lawyer', 'Sikh', 'Arora', v_user_id);

    -- User 784: Jiya Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.chopra.784@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Chopra', 'Master's', 41573.24, 168.45, 'Female', '1996-05-28', 'https://randomuser.me/api/portraits/women/10.jpg', 'Entrepreneur', 'Buddhist', 'Mahar', v_user_id);

    -- User 785: Saanvi Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('saanvi.shah.785@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Saanvi', 'Shah', 'PhD', 172047.57, 161.68, 'Female', '2001-03-18', 'https://randomuser.me/api/portraits/women/14.jpg', 'Product Manager', 'Christian', 'Protestant', v_user_id);

    -- User 786: Laksh Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.das.786@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Das', 'High School', 84929.18, 174.65, 'Male', '2002-09-26', 'https://randomuser.me/api/portraits/men/11.jpg', 'Financial Analyst', 'Christian', 'Protestant', v_user_id);

    -- User 787: Madhav Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.kumar.787@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Kumar', 'Bachelor's', 110369.83, 173.07, 'Male', '1983-10-06', 'https://randomuser.me/api/portraits/men/58.jpg', 'Pilot', 'Sikh', 'Arora', v_user_id);

    -- User 788: Advik Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.sinha.788@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Sinha', 'PhD', 161186.89, 169.79, 'Male', '1994-04-04', 'https://randomuser.me/api/portraits/men/52.jpg', 'Project Manager', 'Hindu', 'Rajput', v_user_id);

    -- User 789: Mira Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('mira.gupta.789@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Mira', 'Gupta', 'PhD', 183663.63, 160.14, 'Female', '1985-11-12', 'https://randomuser.me/api/portraits/women/9.jpg', 'Sales Executive', 'Sikh', 'Arora', v_user_id);

    -- User 790: Ishita Ghosh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.ghosh.790@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Ghosh', 'High School', 132241.09, 151.58, 'Female', '1984-07-18', 'https://randomuser.me/api/portraits/women/45.jpg', 'Photographer', 'Buddhist', 'Chamar', v_user_id);

    -- User 791: Ayaan Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ayaan.chauhan.791@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ayaan', 'Chauhan', 'Master's', 60910.77, 187.89, 'Male', '1993-03-06', 'https://randomuser.me/api/portraits/men/100.jpg', 'Content Writer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 792: Meera Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.chopra.792@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Chopra', 'Bachelor's', 45589.36, 157.49, 'Female', '1984-11-22', 'https://randomuser.me/api/portraits/women/18.jpg', 'Pilot', 'Hindu', 'Shudra', v_user_id);

    -- User 793: Sneha Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.rao.793@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Rao', 'Master's', 51118.22, 166.62, 'Female', '1980-02-16', 'https://randomuser.me/api/portraits/women/100.jpg', 'Software Engineer', 'Hindu', 'Brahmin', v_user_id);

    -- User 794: Shreya Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shreya.kapoor.794@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shreya', 'Kapoor', 'Bachelor's', 130564.5, 171.38, 'Female', '1992-09-23', 'https://randomuser.me/api/portraits/women/60.jpg', 'Data Analyst', 'Christian', 'Syrian Christian', v_user_id);

    -- User 795: Pari Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pari.kaur.795@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pari', 'Kaur', 'Master's', 80121.2, 165.66, 'Female', '2001-09-28', 'https://randomuser.me/api/portraits/women/65.jpg', 'Chef', 'Christian', 'Latin Catholic', v_user_id);

    -- User 796: Aryan Tiwari
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.tiwari.796@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Tiwari', 'High School', 173653.28, 165.85, 'Male', '1994-12-22', 'https://randomuser.me/api/portraits/men/70.jpg', 'Software Engineer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 797: Riddhi Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.thakur.797@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Thakur', 'Master's', 40566.58, 168.31, 'Female', '1984-10-05', 'https://randomuser.me/api/portraits/women/74.jpg', 'Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 798: Gauri Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('gauri.shah.798@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Gauri', 'Shah', 'High School', 185640.21, 152.23, 'Female', '1985-07-02', 'https://randomuser.me/api/portraits/women/40.jpg', 'Nurse', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 799: Navya Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.sharma.799@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Sharma', 'High School', 47181.61, 169.48, 'Female', '1981-02-18', 'https://randomuser.me/api/portraits/women/98.jpg', 'Civil Servant', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 800: Isha Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.desai.800@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Desai', 'Bachelor's', 147449.38, 154.33, 'Female', '1992-12-17', 'https://randomuser.me/api/portraits/women/85.jpg', 'Teacher', 'Hindu', 'Brahmin', v_user_id);

    -- Completed 800 profiles

    -- User 801: Darsh Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('darsh.iyer.801@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Darsh', 'Iyer', 'Bachelor's', 172525.12, 177.28, 'Male', '1980-11-14', 'https://randomuser.me/api/portraits/men/19.jpg', 'Pilot', 'Christian', 'Latin Catholic', v_user_id);

    -- User 802: Khushi Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('khushi.joshi.802@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Khushi', 'Joshi', 'Bachelor's', 184314.36, 159.17, 'Female', '2000-03-11', 'https://randomuser.me/api/portraits/women/39.jpg', 'Designer', 'Muslim', 'Ansari', v_user_id);

    -- User 803: Ila Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.pandey.803@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Pandey', 'Bachelor's', 172437.17, 166.87, 'Female', '1994-09-23', 'https://randomuser.me/api/portraits/women/60.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    -- User 804: Prisha Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.mishra.804@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Mishra', 'Master's', 191664.4, 169.05, 'Female', '1986-12-19', 'https://randomuser.me/api/portraits/women/68.jpg', 'Project Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 805: Ansh Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.chauhan.805@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Chauhan', 'Bachelor's', 51104.54, 185.59, 'Male', '1992-01-13', 'https://randomuser.me/api/portraits/men/20.jpg', 'Marketing Manager', 'Christian', 'Syrian Christian', v_user_id);

    -- User 806: Aarush Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.garg.806@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Garg', 'High School', 34038.41, 182.42, 'Male', '1999-04-16', 'https://randomuser.me/api/portraits/men/32.jpg', 'Data Analyst', 'Muslim', 'Ansari', v_user_id);

    -- User 807: Dhruv Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.verma.807@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Verma', 'Bachelor's', 126572.05, 174.23, 'Male', '1985-01-19', 'https://randomuser.me/api/portraits/men/26.jpg', 'Teacher', 'Sikh', 'Arora', v_user_id);

    -- User 808: Maya Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('maya.mehta.808@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Maya', 'Mehta', 'PhD', 105123.79, 157.94, 'Female', '2000-02-17', 'https://randomuser.me/api/portraits/women/26.jpg', 'Designer', 'Christian', 'Protestant', v_user_id);

    -- User 809: Rahul Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.chauhan.809@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Chauhan', 'High School', 139490.49, 187.33, 'Male', '1994-12-23', 'https://randomuser.me/api/portraits/men/93.jpg', 'Project Manager', 'Sikh', 'Arora', v_user_id);

    -- User 810: Varun Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('varun.shukla.810@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Varun', 'Shukla', 'Bachelor's', 35818.72, 174.71, 'Male', '1998-09-05', 'https://randomuser.me/api/portraits/men/12.jpg', 'Electrical Engineer', 'Jain', 'Porwal', v_user_id);

    -- User 811: Advait Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.chopra.811@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Chopra', 'High School', 184785.02, 189.92, 'Male', '1998-09-19', 'https://randomuser.me/api/portraits/men/86.jpg', 'Consultant', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 812: Sara Verma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.verma.812@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Verma', 'Master's', 82109.34, 156.4, 'Female', '1997-01-28', 'https://randomuser.me/api/portraits/women/81.jpg', 'Teacher', 'Jain', 'Porwal', v_user_id);

    -- User 813: Siya Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.chakraborty.813@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Chakraborty', 'PhD', 128453.87, 164.17, 'Female', '1989-04-18', 'https://randomuser.me/api/portraits/women/45.jpg', 'HR Manager', 'Sikh', 'Arora', v_user_id);

    -- User 814: Tara Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.pillai.814@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Pillai', 'Master's', 104768.49, 171.23, 'Female', '2004-03-08', 'https://randomuser.me/api/portraits/women/16.jpg', 'Chef', 'Muslim', 'Qureshi', v_user_id);

    -- User 815: Rishi Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rishi.bansal.815@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rishi', 'Bansal', 'Bachelor's', 120275.25, 184.71, 'Male', '1991-11-16', 'https://randomuser.me/api/portraits/men/42.jpg', 'Business Owner', 'Jain', 'Porwal', v_user_id);

    -- User 816: Ishaan Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.shah.816@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Shah', 'Bachelor's', 154256.7, 175.92, 'Male', '2003-04-11', 'https://randomuser.me/api/portraits/men/49.jpg', 'Mechanical Engineer', 'Muslim', 'Syed', v_user_id);

    -- User 817: Naksh Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.chatterjee.817@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Chatterjee', 'Master's', 100984.67, 174.73, 'Male', '1994-04-05', 'https://randomuser.me/api/portraits/men/45.jpg', 'Banker', 'Sikh', 'Jat', v_user_id);

    -- User 818: Naksh Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.mukherjee.818@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Mukherjee', 'Bachelor's', 67750.3, 174.17, 'Male', '2003-09-21', 'https://randomuser.me/api/portraits/men/78.jpg', 'Marketing Manager', 'Jain', 'Oswal', v_user_id);

    -- User 819: Atharv Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.chaudhary.819@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Chaudhary', 'Master's', 33256.15, 179.95, 'Male', '1981-10-05', 'https://randomuser.me/api/portraits/men/73.jpg', 'Consultant', 'Muslim', 'Syed', v_user_id);

    -- User 820: Nisha Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nisha.sharma.820@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nisha', 'Sharma', 'Master's', 118137.32, 157.22, 'Female', '2001-06-18', 'https://randomuser.me/api/portraits/women/65.jpg', 'Designer', 'Jain', 'Agarwal', v_user_id);

    -- User 821: Riddhi Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.chaudhary.821@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Chaudhary', 'PhD', 198621.79, 174.61, 'Female', '1998-03-01', 'https://randomuser.me/api/portraits/women/33.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    -- User 822: Nikhil Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.dubey.822@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Dubey', 'PhD', 74997.34, 161.98, 'Male', '1988-06-17', 'https://randomuser.me/api/portraits/men/39.jpg', 'Civil Servant', 'Jain', 'Porwal', v_user_id);

    -- User 823: Diya Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.singh.823@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Singh', 'PhD', 78132.2, 153.43, 'Female', '1993-12-06', 'https://randomuser.me/api/portraits/women/33.jpg', 'Software Engineer', 'Christian', 'Protestant', v_user_id);

    -- User 824: Shanaya Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.dutta.824@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Dutta', 'PhD', 60254.79, 166.37, 'Female', '1982-04-22', 'https://randomuser.me/api/portraits/women/96.jpg', 'Researcher', 'Hindu', 'Baniya', v_user_id);

    -- User 825: Bhavya Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.shukla.825@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Shukla', 'Bachelor's', 154719.34, 174.89, 'Female', '1990-02-18', 'https://randomuser.me/api/portraits/women/18.jpg', 'Electrical Engineer', 'Jain', 'Oswal', v_user_id);

    -- User 826: Bhavya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.nair.826@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Nair', 'Master's', 71562.8, 150.86, 'Female', '1990-06-02', 'https://randomuser.me/api/portraits/women/61.jpg', 'Content Writer', 'Hindu', 'Rajput', v_user_id);

    -- User 827: Jasmine Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.mehta.827@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Mehta', 'Bachelor's', 98990.84, 152.96, 'Female', '1990-07-06', 'https://randomuser.me/api/portraits/women/92.jpg', 'Chartered Accountant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 828: Sneha Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.agarwal.828@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Agarwal', 'Master's', 39222.61, 159.1, 'Female', '1980-09-24', 'https://randomuser.me/api/portraits/women/6.jpg', 'Photographer', 'Jain', 'Shrimal', v_user_id);

    -- User 829: Madhav Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.singh.829@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Singh', 'High School', 130844.81, 171.26, 'Male', '2001-04-03', 'https://randomuser.me/api/portraits/men/46.jpg', 'Financial Analyst', 'Hindu', 'Jat', v_user_id);

    -- User 830: Jasmine Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.gupta.830@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Gupta', 'Master's', 174352.1, 155.88, 'Female', '1995-03-16', 'https://randomuser.me/api/portraits/women/75.jpg', 'Government Officer', 'Sikh', 'Arora', v_user_id);

    -- User 831: Lavanya Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.reddy.831@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Reddy', 'Bachelor's', 140020.32, 170.02, 'Female', '1981-01-13', 'https://randomuser.me/api/portraits/women/73.jpg', 'HR Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 832: Nisha Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nisha.shukla.832@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nisha', 'Shukla', 'High School', 82087.84, 152.33, 'Female', '1980-04-25', 'https://randomuser.me/api/portraits/women/42.jpg', 'Content Writer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 833: Kiaan Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.rao.833@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Rao', 'Bachelor's', 41547.26, 180.93, 'Male', '2002-06-03', 'https://randomuser.me/api/portraits/men/87.jpg', 'Accountant', 'Jain', 'Porwal', v_user_id);

    -- User 834: Karthik Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.chopra.834@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Chopra', 'PhD', 149287.08, 182.77, 'Male', '1990-10-19', 'https://randomuser.me/api/portraits/men/49.jpg', 'Designer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 835: Ansh Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.jain.835@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Jain', 'Master's', 67824.65, 167.44, 'Male', '2003-05-26', 'https://randomuser.me/api/portraits/men/62.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    -- User 836: Ishaan Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishaan.bose.836@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishaan', 'Bose', 'Master's', 75416.35, 167.14, 'Male', '1980-05-14', 'https://randomuser.me/api/portraits/men/89.jpg', 'Architect', 'Muslim', 'Sheikh', v_user_id);

    -- User 837: Anika Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.mishra.837@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Mishra', 'Master's', 92073.82, 166.67, 'Female', '1980-08-23', 'https://randomuser.me/api/portraits/women/2.jpg', 'Marketing Manager', 'Jain', 'Agarwal', v_user_id);

    -- User 838: Prisha Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('prisha.kapoor.838@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Prisha', 'Kapoor', 'Master's', 138467.17, 169.47, 'Female', '1986-11-06', 'https://randomuser.me/api/portraits/women/59.jpg', 'Architect', 'Hindu', 'Rajput', v_user_id);

    -- User 839: Angel Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.singh.839@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Singh', 'PhD', 131198.49, 157.21, 'Female', '1993-07-04', 'https://randomuser.me/api/portraits/women/46.jpg', 'Accountant', 'Buddhist', 'Chamar', v_user_id);

    -- User 840: Sara Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.khan.840@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Khan', 'High School', 126843.97, 168.16, 'Female', '1989-09-21', 'https://randomuser.me/api/portraits/women/30.jpg', 'Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 841: Bhavya Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.sen.841@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Sen', 'PhD', 87797.3, 158.69, 'Female', '1986-08-17', 'https://randomuser.me/api/portraits/women/24.jpg', 'Pharmacist', 'Sikh', 'Arora', v_user_id);

    -- User 842: Vivaan Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.pandey.842@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Pandey', 'High School', 128600.32, 188.33, 'Male', '1992-11-24', 'https://randomuser.me/api/portraits/men/4.jpg', 'Consultant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 843: Bhavya Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.ali.843@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Ali', 'High School', 144255.47, 169.43, 'Female', '2004-02-09', 'https://randomuser.me/api/portraits/women/89.jpg', 'Civil Servant', 'Muslim', 'Qureshi', v_user_id);

    -- User 844: Aryan Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aryan.bhattacharya.844@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aryan', 'Bhattacharya', 'High School', 56586.94, 164.96, 'Male', '2003-12-08', 'https://randomuser.me/api/portraits/men/62.jpg', 'Interior Designer', 'Buddhist', 'Chamar', v_user_id);

    -- User 845: Jiya Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.chakraborty.845@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Chakraborty', 'High School', 87161.35, 174.53, 'Female', '2003-05-11', 'https://randomuser.me/api/portraits/women/5.jpg', 'Mechanical Engineer', 'Sikh', 'Jat', v_user_id);

    -- User 846: Arjun Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.malhotra.846@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Malhotra', 'Master's', 68066.82, 172.84, 'Male', '1990-08-13', 'https://randomuser.me/api/portraits/men/93.jpg', 'Financial Analyst', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 847: Zara Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.nair.847@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Nair', 'PhD', 76410.07, 163.04, 'Female', '2002-01-19', 'https://randomuser.me/api/portraits/women/98.jpg', 'Product Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 848: Advait Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advait.dutta.848@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advait', 'Dutta', 'High School', 94209.54, 186.39, 'Male', '1998-04-20', 'https://randomuser.me/api/portraits/men/92.jpg', 'Professor', 'Christian', 'Protestant', v_user_id);

    -- User 849: Angel Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.reddy.849@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Reddy', 'Bachelor's', 141084.22, 172.64, 'Female', '1987-10-09', 'https://randomuser.me/api/portraits/women/8.jpg', 'Doctor', 'Muslim', 'Sheikh', v_user_id);

    -- User 850: Riddhi Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.chakraborty.850@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Chakraborty', 'High School', 142132.95, 172.26, 'Female', '1990-05-15', 'https://randomuser.me/api/portraits/women/11.jpg', 'Sales Executive', 'Jain', 'Porwal', v_user_id);

    -- User 851: Meera Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.reddy.851@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Reddy', 'PhD', 124501.01, 167.61, 'Female', '2004-08-17', 'https://randomuser.me/api/portraits/women/51.jpg', 'Civil Engineer', 'Hindu', 'Baniya', v_user_id);

    -- User 852: Karthik Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karthik.pillai.852@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karthik', 'Pillai', 'Bachelor's', 142024.06, 171.46, 'Male', '2002-10-16', 'https://randomuser.me/api/portraits/men/18.jpg', 'Mechanical Engineer', 'Hindu', 'Shudra', v_user_id);

    -- User 853: Yash Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.bansal.853@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Bansal', 'Master's', 57864.15, 160.04, 'Male', '1996-09-24', 'https://randomuser.me/api/portraits/men/37.jpg', 'Pharmacist', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 854: Pihu Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.sharma.854@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Sharma', 'Bachelor's', 139638.4, 154.38, 'Female', '1983-06-25', 'https://randomuser.me/api/portraits/women/54.jpg', 'Doctor', 'Hindu', 'Vaishya', v_user_id);

    -- User 855: Aditya Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.bansal.855@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Bansal', 'PhD', 188191.67, 185.82, 'Male', '2004-05-25', 'https://randomuser.me/api/portraits/men/56.jpg', 'Accountant', 'Jain', 'Shrimal', v_user_id);

    -- User 856: Laksh Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.mukherjee.856@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Mukherjee', 'Bachelor's', 147175.26, 175.28, 'Male', '1989-12-21', 'https://randomuser.me/api/portraits/men/13.jpg', 'Mechanical Engineer', 'Hindu', 'Shudra', v_user_id);

    -- User 857: Om Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('om.mehta.857@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Om', 'Mehta', 'PhD', 172411.08, 180.83, 'Male', '1987-05-19', 'https://randomuser.me/api/portraits/men/68.jpg', 'Nurse', 'Sikh', 'Jat', v_user_id);

    -- User 858: Zara Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.yadav.858@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Yadav', 'Master's', 83920.62, 154.4, 'Female', '1996-09-10', 'https://randomuser.me/api/portraits/women/69.jpg', 'Marketing Manager', 'Buddhist', 'Mahar', v_user_id);

    -- User 859: Laksh Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('laksh.chakraborty.859@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Laksh', 'Chakraborty', 'Bachelor's', 83429.94, 182.97, 'Male', '1985-09-20', 'https://randomuser.me/api/portraits/men/8.jpg', 'Entrepreneur', 'Muslim', 'Ansari', v_user_id);

    -- User 860: Akash Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.chakraborty.860@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Chakraborty', 'PhD', 187664.84, 162.0, 'Male', '2002-10-07', 'https://randomuser.me/api/portraits/men/32.jpg', 'Electrical Engineer', 'Buddhist', 'Chamar', v_user_id);

    -- User 861: Anika Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anika.malhotra.861@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anika', 'Malhotra', 'PhD', 127562.82, 159.78, 'Female', '2002-09-20', 'https://randomuser.me/api/portraits/women/76.jpg', 'Doctor', 'Sikh', 'Arora', v_user_id);

    -- User 862: Vihaan Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.menon.862@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Menon', 'High School', 96216.13, 180.32, 'Male', '1999-05-02', 'https://randomuser.me/api/portraits/men/13.jpg', 'Consultant', 'Jain', 'Agarwal', v_user_id);

    -- User 863: Anjali Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.kumar.863@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Kumar', 'PhD', 188578.14, 153.44, 'Female', '1996-11-10', 'https://randomuser.me/api/portraits/women/10.jpg', 'Doctor', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 864: Rishi Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rishi.chakraborty.864@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rishi', 'Chakraborty', 'PhD', 66844.86, 184.56, 'Male', '1986-07-14', 'https://randomuser.me/api/portraits/men/46.jpg', 'Photographer', 'Buddhist', 'Mahar', v_user_id);

    -- User 865: Sara Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.ali.865@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Ali', 'Bachelor's', 171958.98, 173.37, 'Female', '1999-01-24', 'https://randomuser.me/api/portraits/women/56.jpg', 'Fashion Designer', 'Christian', 'Latin Catholic', v_user_id);

    -- User 866: Om Saxena
    INSERT INTO users (email, password, subscription_id)
    VALUES ('om.saxena.866@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Om', 'Saxena', 'PhD', 76934.46, 189.2, 'Male', '2000-07-26', 'https://randomuser.me/api/portraits/men/28.jpg', 'Business Owner', 'Jain', 'Oswal', v_user_id);

    -- User 867: Akash Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.bhattacharya.867@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Bhattacharya', 'PhD', 50326.55, 178.62, 'Male', '2003-03-06', 'https://randomuser.me/api/portraits/men/39.jpg', 'Product Manager', 'Sikh', 'Jat', v_user_id);

    -- User 868: Naksh Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.chauhan.868@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Chauhan', 'PhD', 78121.15, 172.95, 'Male', '1989-01-21', 'https://randomuser.me/api/portraits/men/96.jpg', 'Interior Designer', 'Jain', 'Shrimal', v_user_id);

    -- User 869: Vihaan Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.srivastava.869@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Srivastava', 'High School', 35819.91, 168.5, 'Male', '1984-10-18', 'https://randomuser.me/api/portraits/men/39.jpg', 'Photographer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 870: Yash Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.dutta.870@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Dutta', 'Master's', 153858.75, 161.53, 'Male', '1998-09-10', 'https://randomuser.me/api/portraits/men/25.jpg', 'Researcher', 'Jain', 'Oswal', v_user_id);

    -- User 871: Ila Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.kaur.871@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Kaur', 'Master's', 63288.86, 155.86, 'Female', '1982-08-22', 'https://randomuser.me/api/portraits/women/55.jpg', 'Lawyer', 'Christian', 'Protestant', v_user_id);

    -- User 872: Zara Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.dubey.872@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Dubey', 'Bachelor's', 177735.06, 172.81, 'Female', '1993-06-01', 'https://randomuser.me/api/portraits/women/94.jpg', 'Marketing Manager', 'Jain', 'Agarwal', v_user_id);

    -- User 873: Atharv Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.chaudhary.873@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Chaudhary', 'Master's', 60561.86, 189.04, 'Male', '1998-03-24', 'https://randomuser.me/api/portraits/men/74.jpg', 'Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 874: Ananya Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ananya.patel.874@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ananya', 'Patel', 'PhD', 52640.74, 165.75, 'Female', '1994-05-12', 'https://randomuser.me/api/portraits/women/71.jpg', 'Business Owner', 'Christian', 'Latin Catholic', v_user_id);

    -- User 875: Jiya Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jiya.chakraborty.875@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jiya', 'Chakraborty', 'High School', 127987.3, 153.45, 'Female', '1982-06-16', 'https://randomuser.me/api/portraits/women/81.jpg', 'Architect', 'Hindu', 'Shudra', v_user_id);

    -- User 876: Aaradhya Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.pillai.876@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Pillai', 'High School', 144223.67, 160.94, 'Female', '1981-10-13', 'https://randomuser.me/api/portraits/women/57.jpg', 'Professor', 'Christian', 'Latin Catholic', v_user_id);

    -- User 877: Aaradhya Malhotra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.malhotra.877@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Malhotra', 'High School', 163668.67, 153.26, 'Female', '1983-02-05', 'https://randomuser.me/api/portraits/women/90.jpg', 'Architect', 'Christian', 'Roman Catholic', v_user_id);

    -- User 878: Sakshi Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.chatterjee.878@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Chatterjee', 'Master's', 51435.21, 156.43, 'Female', '1982-11-03', 'https://randomuser.me/api/portraits/women/42.jpg', 'Doctor', 'Hindu', 'Vaishya', v_user_id);

    -- User 879: Disha Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('disha.kumar.879@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Disha', 'Kumar', 'High School', 43938.79, 154.03, 'Female', '1997-01-25', 'https://randomuser.me/api/portraits/women/70.jpg', 'Software Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 880: Jasmine Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.garg.880@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Garg', 'Bachelor's', 185254.93, 153.36, 'Female', '1991-05-10', 'https://randomuser.me/api/portraits/women/58.jpg', 'Chartered Accountant', 'Muslim', 'Pathan', v_user_id);

    -- User 881: Anushka Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.bhat.881@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Bhat', 'PhD', 111102.72, 163.78, 'Female', '1986-10-08', 'https://randomuser.me/api/portraits/women/26.jpg', 'Entrepreneur', 'Sikh', 'Jat', v_user_id);

    -- User 882: Angel Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.chatterjee.882@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Chatterjee', 'Master's', 190235.48, 150.35, 'Female', '1985-07-01', 'https://randomuser.me/api/portraits/women/36.jpg', 'Government Officer', 'Jain', 'Agarwal', v_user_id);

    -- User 883: Anjali Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.bhat.883@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Bhat', 'Master's', 33152.8, 158.0, 'Female', '1996-11-11', 'https://randomuser.me/api/portraits/women/96.jpg', 'Pilot', 'Jain', 'Porwal', v_user_id);

    -- User 884: Tara Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tara.pillai.884@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tara', 'Pillai', 'Bachelor's', 170748.47, 174.07, 'Female', '1987-07-04', 'https://randomuser.me/api/portraits/women/73.jpg', 'Banker', 'Sikh', 'Arora', v_user_id);

    -- User 885: Divya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.nair.885@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Nair', 'Master's', 133688.43, 156.21, 'Female', '1991-08-15', 'https://randomuser.me/api/portraits/women/80.jpg', 'Software Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 886: Naksh Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('naksh.chopra.886@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Naksh', 'Chopra', 'High School', 56447.6, 181.24, 'Male', '1996-11-21', 'https://randomuser.me/api/portraits/men/50.jpg', 'Teacher', 'Christian', 'Roman Catholic', v_user_id);

    -- User 887: Vivaan Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vivaan.gupta.887@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vivaan', 'Gupta', 'PhD', 83437.77, 166.36, 'Male', '1999-03-18', 'https://randomuser.me/api/portraits/men/56.jpg', 'Marketing Manager', 'Jain', 'Agarwal', v_user_id);

    -- User 888: Param Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('param.rao.888@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Param', 'Rao', 'PhD', 128956.01, 187.69, 'Male', '1995-07-15', 'https://randomuser.me/api/portraits/men/10.jpg', 'Sales Executive', 'Jain', 'Oswal', v_user_id);

    -- User 889: Anushka Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.shah.889@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Shah', 'Master's', 63060.1, 173.84, 'Female', '1981-10-15', 'https://randomuser.me/api/portraits/women/53.jpg', 'Civil Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 890: Arnav Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.iyer.890@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Iyer', 'Bachelor's', 134892.0, 187.47, 'Male', '1989-02-06', 'https://randomuser.me/api/portraits/men/88.jpg', 'Professor', 'Sikh', 'Jat', v_user_id);

    -- User 891: Ayaan Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ayaan.jain.891@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ayaan', 'Jain', 'Master's', 193278.29, 167.45, 'Male', '1993-08-18', 'https://randomuser.me/api/portraits/men/23.jpg', 'Electrical Engineer', 'Sikh', 'Arora', v_user_id);

    -- User 892: Zara Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.jain.892@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Jain', 'PhD', 71794.0, 166.92, 'Female', '1988-05-26', 'https://randomuser.me/api/portraits/women/65.jpg', 'Data Analyst', 'Hindu', 'Rajput', v_user_id);

    -- User 893: Advik Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('advik.roy.893@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Advik', 'Roy', 'PhD', 161296.39, 185.54, 'Male', '1991-03-08', 'https://randomuser.me/api/portraits/men/74.jpg', 'Chef', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 894: Rishi Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rishi.bose.894@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rishi', 'Bose', 'PhD', 179661.16, 173.2, 'Male', '1980-06-03', 'https://randomuser.me/api/portraits/men/41.jpg', 'Researcher', 'Muslim', 'Ansari', v_user_id);

    -- User 895: Riya Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.mishra.895@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Mishra', 'PhD', 55569.88, 156.45, 'Female', '1981-05-10', 'https://randomuser.me/api/portraits/women/87.jpg', 'Designer', 'Hindu', 'Vaishya', v_user_id);

    -- User 896: Arjun Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arjun.mukherjee.896@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arjun', 'Mukherjee', 'High School', 127308.28, 162.11, 'Male', '2002-12-24', 'https://randomuser.me/api/portraits/men/51.jpg', 'Doctor', 'Christian', 'Syrian Christian', v_user_id);

    -- User 897: Vihaan Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('vihaan.chakraborty.897@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Vihaan', 'Chakraborty', 'High School', 102582.19, 185.46, 'Male', '1991-06-09', 'https://randomuser.me/api/portraits/men/60.jpg', 'Researcher', 'Buddhist', 'Mahar', v_user_id);

    -- User 898: Shlok Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shlok.ali.898@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shlok', 'Ali', 'Master's', 44665.3, 163.32, 'Male', '1995-04-16', 'https://randomuser.me/api/portraits/men/37.jpg', 'Fashion Designer', 'Jain', 'Shrimal', v_user_id);

    -- User 899: Kiara Bose
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.bose.899@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Bose', 'PhD', 116247.55, 167.05, 'Female', '2000-04-07', 'https://randomuser.me/api/portraits/women/60.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    -- User 900: Shanaya Mukherjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.mukherjee.900@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Mukherjee', 'Master's', 136454.38, 152.43, 'Female', '1995-02-26', 'https://randomuser.me/api/portraits/women/39.jpg', 'Pharmacist', 'Muslim', 'Qureshi', v_user_id);

    -- Completed 900 profiles

    -- User 901: Diya Sharma
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.sharma.901@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Sharma', 'Master's', 65806.86, 159.46, 'Female', '1990-05-07', 'https://randomuser.me/api/portraits/women/80.jpg', 'HR Manager', 'Hindu', 'Baniya', v_user_id);

    -- User 902: Rudra Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.sen.902@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Sen', 'PhD', 121637.18, 170.84, 'Male', '1996-12-01', 'https://randomuser.me/api/portraits/men/55.jpg', 'Architect', 'Hindu', 'Rajput', v_user_id);

    -- User 903: Siya Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('siya.mishra.903@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Siya', 'Mishra', 'PhD', 130484.39, 152.3, 'Female', '1989-11-06', 'https://randomuser.me/api/portraits/women/100.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    -- User 904: Kiaan Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiaan.roy.904@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiaan', 'Roy', 'PhD', 165220.88, 177.52, 'Male', '1989-05-06', 'https://randomuser.me/api/portraits/men/99.jpg', 'Fashion Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 905: Tanish Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('tanish.gupta.905@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Tanish', 'Gupta', 'Bachelor's', 134314.22, 189.89, 'Male', '1997-06-15', 'https://randomuser.me/api/portraits/men/100.jpg', 'Civil Servant', 'Muslim', 'Pathan', v_user_id);

    -- User 906: Arnav Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.garg.906@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Garg', 'PhD', 187425.95, 176.79, 'Male', '1986-06-13', 'https://randomuser.me/api/portraits/men/14.jpg', 'Doctor', 'Muslim', 'Ansari', v_user_id);

    -- User 907: Jasmine Agarwal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.agarwal.907@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Agarwal', 'High School', 40875.41, 161.35, 'Female', '1999-10-28', 'https://randomuser.me/api/portraits/women/48.jpg', 'Financial Analyst', 'Jain', 'Agarwal', v_user_id);

    -- User 908: Divya Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.ali.908@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Ali', 'PhD', 96867.34, 159.55, 'Female', '1995-02-24', 'https://randomuser.me/api/portraits/women/7.jpg', 'Sales Executive', 'Sikh', 'Arora', v_user_id);

    -- User 909: Pihu Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.iyer.909@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Iyer', 'Master's', 102482.11, 150.84, 'Female', '1990-12-22', 'https://randomuser.me/api/portraits/women/35.jpg', 'Operations Manager', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 910: Anjali Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.desai.910@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Desai', 'Master's', 110180.26, 161.01, 'Female', '2000-01-28', 'https://randomuser.me/api/portraits/women/91.jpg', 'Pharmacist', 'Muslim', 'Syed', v_user_id);

    -- User 911: Sara Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sara.chakraborty.911@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sara', 'Chakraborty', 'Bachelor's', 177862.01, 170.78, 'Female', '1987-09-19', 'https://randomuser.me/api/portraits/women/23.jpg', 'Designer', 'Sikh', 'Kamboj', v_user_id);

    -- User 912: Ishita Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.singh.912@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Singh', 'Bachelor's', 65366.38, 164.91, 'Female', '2004-10-01', 'https://randomuser.me/api/portraits/women/85.jpg', 'Interior Designer', 'Muslim', 'Sheikh', v_user_id);

    -- User 913: Avni Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('avni.mishra.913@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Avni', 'Mishra', 'PhD', 93202.55, 153.87, 'Female', '1981-10-11', 'https://randomuser.me/api/portraits/women/75.jpg', 'Content Writer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 914: Ishita Dubey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.dubey.914@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Dubey', 'Master's', 154984.01, 172.11, 'Female', '1999-06-23', 'https://randomuser.me/api/portraits/women/93.jpg', 'Fashion Designer', 'Hindu', 'Brahmin', v_user_id);

    -- User 915: Kiara Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.roy.915@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Roy', 'High School', 177167.87, 155.97, 'Female', '1989-09-03', 'https://randomuser.me/api/portraits/women/63.jpg', 'Fashion Designer', 'Sikh', 'Kamboj', v_user_id);

    -- User 916: Piyush Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('piyush.roy.916@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Piyush', 'Roy', 'PhD', 155237.56, 166.21, 'Male', '2001-06-07', 'https://randomuser.me/api/portraits/men/82.jpg', 'Electrical Engineer', 'Sikh', 'Kamboj', v_user_id);

    -- User 917: Anjali Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.das.917@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Das', 'High School', 181225.54, 159.33, 'Female', '1987-08-26', 'https://randomuser.me/api/portraits/women/32.jpg', 'Mechanical Engineer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 918: Divya Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.reddy.918@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Reddy', 'Bachelor's', 182846.54, 161.97, 'Female', '1980-09-07', 'https://randomuser.me/api/portraits/women/62.jpg', 'Civil Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 919: Aarush Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarush.kaur.919@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarush', 'Kaur', 'Bachelor's', 132098.15, 168.63, 'Male', '1999-01-24', 'https://randomuser.me/api/portraits/men/83.jpg', 'Consultant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 920: Diya Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('diya.kapoor.920@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Diya', 'Kapoor', 'PhD', 132984.22, 161.05, 'Female', '1989-02-10', 'https://randomuser.me/api/portraits/women/15.jpg', 'Professor', 'Jain', 'Shrimal', v_user_id);

    -- User 921: Zara Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.thakur.921@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Thakur', 'High School', 66198.88, 169.04, 'Female', '1992-01-23', 'https://randomuser.me/api/portraits/women/9.jpg', 'Nurse', 'Hindu', 'Rajput', v_user_id);

    -- User 922: Manav Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.srivastava.922@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Srivastava', 'High School', 160846.14, 169.95, 'Male', '1992-02-01', 'https://randomuser.me/api/portraits/men/86.jpg', 'HR Manager', 'Jain', 'Porwal', v_user_id);

    -- User 923: Shanaya Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.roy.923@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Roy', 'PhD', 41964.89, 171.33, 'Female', '1994-05-02', 'https://randomuser.me/api/portraits/women/98.jpg', 'Entrepreneur', 'Jain', 'Agarwal', v_user_id);

    -- User 924: Harsh Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.das.924@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Das', 'High School', 157695.62, 160.05, 'Male', '1997-07-13', 'https://randomuser.me/api/portraits/men/8.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    -- User 925: Rohan Bhattacharya
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.bhattacharya.925@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Bhattacharya', 'Bachelor's', 80165.6, 170.91, 'Male', '1996-11-11', 'https://randomuser.me/api/portraits/men/35.jpg', 'Marketing Manager', 'Sikh', 'Kamboj', v_user_id);

    -- User 926: Aditya Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.bansal.926@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Bansal', 'Master's', 86322.35, 162.32, 'Male', '1992-05-01', 'https://randomuser.me/api/portraits/men/28.jpg', 'Researcher', 'Muslim', 'Ansari', v_user_id);

    -- User 927: Nisha Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nisha.srivastava.927@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nisha', 'Srivastava', 'Bachelor's', 53148.89, 153.55, 'Female', '1996-12-17', 'https://randomuser.me/api/portraits/women/97.jpg', 'Content Writer', 'Jain', 'Porwal', v_user_id);

    -- User 928: Anjali Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.das.928@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Das', 'Master's', 175343.55, 162.19, 'Female', '1980-01-16', 'https://randomuser.me/api/portraits/women/4.jpg', 'Doctor', 'Jain', 'Agarwal', v_user_id);

    -- User 929: Ila Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.rathore.929@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Rathore', 'Master's', 119055.56, 162.6, 'Female', '1997-05-10', 'https://randomuser.me/api/portraits/women/47.jpg', 'Civil Servant', 'Christian', 'Roman Catholic', v_user_id);

    -- User 930: Anjali Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.rathore.930@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Rathore', 'Master's', 162534.73, 155.73, 'Female', '1994-09-08', 'https://randomuser.me/api/portraits/women/55.jpg', 'Business Owner', 'Muslim', 'Qureshi', v_user_id);

    -- User 931: Lavanya Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.chatterjee.931@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Chatterjee', 'Master's', 168458.37, 166.15, 'Female', '1995-04-05', 'https://randomuser.me/api/portraits/women/42.jpg', 'Doctor', 'Christian', 'Latin Catholic', v_user_id);

    -- User 932: Sakshi Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sakshi.singh.932@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sakshi', 'Singh', 'High School', 185355.11, 160.56, 'Female', '1985-02-27', 'https://randomuser.me/api/portraits/women/85.jpg', 'Operations Manager', 'Muslim', 'Ansari', v_user_id);

    -- User 933: Sneha Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sneha.pillai.933@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sneha', 'Pillai', 'PhD', 83088.36, 155.37, 'Female', '1984-03-26', 'https://randomuser.me/api/portraits/women/71.jpg', 'Nurse', 'Buddhist', 'Chamar', v_user_id);

    -- User 934: Akash Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.das.934@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Das', 'Bachelor's', 46495.22, 189.57, 'Male', '1987-05-01', 'https://randomuser.me/api/portraits/men/36.jpg', 'Data Analyst', 'Christian', 'Roman Catholic', v_user_id);

    -- User 935: Pihu Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('pihu.dutta.935@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Pihu', 'Dutta', 'PhD', 116866.17, 168.37, 'Female', '1990-12-07', 'https://randomuser.me/api/portraits/women/81.jpg', 'Entrepreneur', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 936: Shaurya Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shaurya.desai.936@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shaurya', 'Desai', 'High School', 188663.92, 173.92, 'Male', '1996-09-25', 'https://randomuser.me/api/portraits/men/29.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    -- User 937: Aditya Garg
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.garg.937@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Garg', 'High School', 151319.32, 165.4, 'Male', '1987-04-20', 'https://randomuser.me/api/portraits/men/14.jpg', 'Teacher', 'Hindu', 'Rajput', v_user_id);

    -- User 938: Anjali Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.shah.938@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Shah', 'Bachelor's', 174019.65, 152.4, 'Female', '1995-12-21', 'https://randomuser.me/api/portraits/women/43.jpg', 'Electrical Engineer', 'Christian', 'Protestant', v_user_id);

    -- User 939: Manav Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('manav.bansal.939@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Manav', 'Bansal', 'Master's', 81509.69, 172.25, 'Male', '1989-01-07', 'https://randomuser.me/api/portraits/men/33.jpg', 'Fashion Designer', 'Hindu', 'Vaishya', v_user_id);

    -- User 940: Rudra Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rudra.bhat.940@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rudra', 'Bhat', 'PhD', 154153.08, 186.14, 'Male', '1991-04-21', 'https://randomuser.me/api/portraits/men/95.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 941: Krishna Rathore
    INSERT INTO users (email, password, subscription_id)
    VALUES ('krishna.rathore.941@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Krishna', 'Rathore', 'PhD', 92707.65, 161.54, 'Male', '2002-04-06', 'https://randomuser.me/api/portraits/men/20.jpg', 'Project Manager', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 942: Divya Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.dutta.942@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Dutta', 'Bachelor's', 181305.08, 150.58, 'Female', '1983-06-24', 'https://randomuser.me/api/portraits/women/12.jpg', 'Chef', 'Sikh', 'Kamboj', v_user_id);

    -- User 943: Sai Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('sai.mehta.943@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Sai', 'Mehta', 'Bachelor's', 74544.9, 187.42, 'Male', '1991-12-27', 'https://randomuser.me/api/portraits/men/55.jpg', 'Researcher', 'Hindu', 'Vaishya', v_user_id);

    -- User 944: Rahul Kumar
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rahul.kumar.944@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rahul', 'Kumar', 'PhD', 119757.96, 160.11, 'Male', '1980-10-27', 'https://randomuser.me/api/portraits/men/36.jpg', 'Dentist', 'Christian', 'Protestant', v_user_id);

    -- User 945: Rohan Kaur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('rohan.kaur.945@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Rohan', 'Kaur', 'PhD', 102845.39, 189.65, 'Male', '1993-02-02', 'https://randomuser.me/api/portraits/men/5.jpg', 'Lawyer', 'Buddhist', 'Chamar', v_user_id);

    -- User 946: Anushka Yadav
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anushka.yadav.946@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anushka', 'Yadav', 'Bachelor's', 191325.45, 170.08, 'Female', '1997-01-26', 'https://randomuser.me/api/portraits/women/11.jpg', 'Content Writer', 'Hindu', 'Rajput', v_user_id);

    -- User 947: Dhruv Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.ali.947@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Ali', 'Bachelor's', 137108.39, 161.03, 'Male', '1999-01-06', 'https://randomuser.me/api/portraits/men/98.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    -- User 948: Aaradhya Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.joshi.948@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Joshi', 'PhD', 112883.14, 155.84, 'Female', '1993-09-28', 'https://randomuser.me/api/portraits/women/41.jpg', 'Fashion Designer', 'Christian', 'Roman Catholic', v_user_id);

    -- User 949: Divya Rao
    INSERT INTO users (email, password, subscription_id)
    VALUES ('divya.rao.949@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Divya', 'Rao', 'Bachelor's', 194184.39, 161.74, 'Female', '1992-10-03', 'https://randomuser.me/api/portraits/women/87.jpg', 'Marketing Manager', 'Jain', 'Porwal', v_user_id);

    -- User 950: Reyansh Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.chopra.950@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Chopra', 'PhD', 188282.92, 168.38, 'Male', '1984-12-12', 'https://randomuser.me/api/portraits/men/71.jpg', 'Pilot', 'Muslim', 'Sheikh', v_user_id);

    -- User 951: Natasha Gupta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('natasha.gupta.951@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Natasha', 'Gupta', 'High School', 160605.3, 157.88, 'Female', '1991-07-17', 'https://randomuser.me/api/portraits/women/59.jpg', 'Operations Manager', 'Sikh', 'Jat', v_user_id);

    -- User 952: Akash Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('akash.pandey.952@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Akash', 'Pandey', 'High School', 47002.71, 169.48, 'Male', '1995-12-05', 'https://randomuser.me/api/portraits/men/85.jpg', 'Government Officer', 'Hindu', 'Baniya', v_user_id);

    -- User 953: Atharv Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('atharv.menon.953@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Atharv', 'Menon', 'PhD', 44289.21, 160.76, 'Male', '2000-12-11', 'https://randomuser.me/api/portraits/men/82.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    -- User 954: Neha Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('neha.chaudhary.954@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Neha', 'Chaudhary', 'PhD', 37710.6, 153.24, 'Female', '1990-05-27', 'https://randomuser.me/api/portraits/women/100.jpg', 'Consultant', 'Christian', 'Syrian Christian', v_user_id);

    -- User 955: Meera Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('meera.bhat.955@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Meera', 'Bhat', 'PhD', 131057.87, 163.51, 'Female', '1982-06-13', 'https://randomuser.me/api/portraits/women/22.jpg', 'Entrepreneur', 'Sikh', 'Ramgarhia', v_user_id);

    -- User 956: Anjali Joshi
    INSERT INTO users (email, password, subscription_id)
    VALUES ('anjali.joshi.956@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Anjali', 'Joshi', 'High School', 151032.46, 161.76, 'Female', '2003-05-22', 'https://randomuser.me/api/portraits/women/55.jpg', 'Architect', 'Christian', 'Roman Catholic', v_user_id);

    -- User 957: Ansh Thakur
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.thakur.957@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Thakur', 'PhD', 190633.17, 160.81, 'Male', '1980-09-11', 'https://randomuser.me/api/portraits/men/83.jpg', 'Interior Designer', 'Hindu', 'Brahmin', v_user_id);

    -- User 958: Angel Jain
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.jain.958@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Jain', 'PhD', 192480.6, 173.35, 'Female', '2000-11-18', 'https://randomuser.me/api/portraits/women/44.jpg', 'Civil Servant', 'Christian', 'Protestant', v_user_id);

    -- User 959: Mira Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('mira.shah.959@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Mira', 'Shah', 'Master's', 107798.5, 155.37, 'Female', '1997-07-19', 'https://randomuser.me/api/portraits/women/82.jpg', 'Data Analyst', 'Christian', 'Protestant', v_user_id);

    -- User 960: Zara Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('zara.chaudhary.960@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Zara', 'Chaudhary', 'Master's', 110030.69, 152.36, 'Female', '1996-09-18', 'https://randomuser.me/api/portraits/women/38.jpg', 'Researcher', 'Muslim', 'Sheikh', v_user_id);

    -- User 961: Shanaya Nair
    INSERT INTO users (email, password, subscription_id)
    VALUES ('shanaya.nair.961@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Shanaya', 'Nair', 'Bachelor's', 162798.77, 167.89, 'Female', '2004-05-05', 'https://randomuser.me/api/portraits/women/10.jpg', 'Consultant', 'Muslim', 'Pathan', v_user_id);

    -- User 962: Aditya Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aditya.khan.962@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aditya', 'Khan', 'Master's', 60790.63, 170.45, 'Male', '2002-04-17', 'https://randomuser.me/api/portraits/men/43.jpg', 'Sales Executive', 'Christian', 'Roman Catholic', v_user_id);

    -- User 963: Kiara Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kiara.pillai.963@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kiara', 'Pillai', 'High School', 102280.27, 171.3, 'Female', '1985-09-17', 'https://randomuser.me/api/portraits/women/54.jpg', 'Sales Executive', 'Sikh', 'Kamboj', v_user_id);

    -- User 964: Yash Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('yash.chauhan.964@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Yash', 'Chauhan', 'PhD', 80819.25, 174.27, 'Male', '2000-11-22', 'https://randomuser.me/api/portraits/men/71.jpg', 'Civil Servant', 'Sikh', 'Kamboj', v_user_id);

    -- User 965: Dhruv Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('dhruv.chopra.965@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Dhruv', 'Chopra', 'PhD', 122291.54, 176.87, 'Male', '1988-09-28', 'https://randomuser.me/api/portraits/men/74.jpg', 'Interior Designer', 'Muslim', 'Pathan', v_user_id);

    -- User 966: Kabir Roy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.roy.966@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Roy', 'PhD', 86070.62, 164.3, 'Male', '1998-07-14', 'https://randomuser.me/api/portraits/men/22.jpg', 'Government Officer', 'Buddhist', 'Mahar', v_user_id);

    -- User 967: Arnav Desai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.desai.967@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Desai', 'PhD', 132489.49, 178.0, 'Male', '1993-02-10', 'https://randomuser.me/api/portraits/men/7.jpg', 'Project Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 968: Chirag Dutta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('chirag.dutta.968@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Chirag', 'Dutta', 'Master's', 101938.92, 183.69, 'Male', '1981-06-19', 'https://randomuser.me/api/portraits/men/33.jpg', 'Researcher', 'Muslim', 'Pathan', v_user_id);

    -- User 969: Kriti Shah
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kriti.shah.969@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kriti', 'Shah', 'High School', 151202.15, 160.43, 'Female', '1994-05-13', 'https://randomuser.me/api/portraits/women/50.jpg', 'Banker', 'Sikh', 'Arora', v_user_id);

    -- User 970: Angel Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.singh.970@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Singh', 'Bachelor's', 88748.94, 174.81, 'Female', '1988-03-23', 'https://randomuser.me/api/portraits/women/33.jpg', 'Software Engineer', 'Muslim', 'Qureshi', v_user_id);

    -- User 971: Madhav Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.chopra.971@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Chopra', 'PhD', 149048.4, 185.75, 'Male', '1984-11-10', 'https://randomuser.me/api/portraits/men/75.jpg', 'Pharmacist', 'Christian', 'Roman Catholic', v_user_id);

    -- User 972: Riddhi Das
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riddhi.das.972@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riddhi', 'Das', 'PhD', 31137.0, 168.75, 'Female', '1982-10-09', 'https://randomuser.me/api/portraits/women/62.jpg', 'Fashion Designer', 'Jain', 'Agarwal', v_user_id);

    -- User 973: Arnav Sen
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.sen.973@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Sen', 'High School', 68333.61, 164.64, 'Male', '2002-12-06', 'https://randomuser.me/api/portraits/men/48.jpg', 'Civil Servant', 'Muslim', 'Ansari', v_user_id);

    -- User 974: Riya Patel
    INSERT INTO users (email, password, subscription_id)
    VALUES ('riya.patel.974@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Riya', 'Patel', 'High School', 37055.84, 171.42, 'Female', '2003-08-10', 'https://randomuser.me/api/portraits/women/65.jpg', 'Sales Executive', 'Jain', 'Agarwal', v_user_id);

    -- User 975: Aayansh Menon
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aayansh.menon.975@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aayansh', 'Menon', 'Master's', 188705.21, 180.54, 'Male', '1988-02-25', 'https://randomuser.me/api/portraits/men/86.jpg', 'Financial Analyst', 'Hindu', 'Brahmin', v_user_id);

    -- User 976: Varun Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('varun.srivastava.976@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Varun', 'Srivastava', 'Master's', 168573.28, 183.66, 'Male', '2000-12-23', 'https://randomuser.me/api/portraits/men/34.jpg', 'Content Writer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 977: Ila Iyer
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ila.iyer.977@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ila', 'Iyer', 'High School', 52454.26, 172.01, 'Female', '1988-05-25', 'https://randomuser.me/api/portraits/women/9.jpg', 'Accountant', 'Christian', 'Syrian Christian', v_user_id);

    -- User 978: Reyansh Bansal
    INSERT INTO users (email, password, subscription_id)
    VALUES ('reyansh.bansal.978@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Reyansh', 'Bansal', 'PhD', 164779.5, 169.9, 'Male', '1982-12-22', 'https://randomuser.me/api/portraits/men/11.jpg', 'Doctor', 'Jain', 'Shrimal', v_user_id);

    -- User 979: Bhavya Khan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.khan.979@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Khan', 'PhD', 148876.07, 173.18, 'Female', '1984-02-12', 'https://randomuser.me/api/portraits/women/16.jpg', 'Operations Manager', 'Christian', 'Latin Catholic', v_user_id);

    -- User 980: Bhavya Pillai
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.pillai.980@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Pillai', 'Master's', 33431.86, 169.26, 'Female', '1986-01-21', 'https://randomuser.me/api/portraits/women/59.jpg', 'Interior Designer', 'Buddhist', 'Mahar', v_user_id);

    -- User 981: Jasmine Ali
    INSERT INTO users (email, password, subscription_id)
    VALUES ('jasmine.ali.981@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Jasmine', 'Ali', 'High School', 56753.91, 167.66, 'Female', '1998-09-23', 'https://randomuser.me/api/portraits/women/54.jpg', 'HR Manager', 'Hindu', 'Kshatriya', v_user_id);

    -- User 982: Ansh Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ansh.kapoor.982@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ansh', 'Kapoor', 'Master's', 41117.55, 180.75, 'Male', '2004-06-15', 'https://randomuser.me/api/portraits/men/80.jpg', 'Teacher', 'Buddhist', 'Mahar', v_user_id);

    -- User 983: Navya Srivastava
    INSERT INTO users (email, password, subscription_id)
    VALUES ('navya.srivastava.983@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Navya', 'Srivastava', 'Bachelor's', 140767.8, 151.97, 'Female', '1991-03-07', 'https://randomuser.me/api/portraits/women/5.jpg', 'Civil Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 984: Kabir Chopra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.chopra.984@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Chopra', 'PhD', 55104.12, 178.11, 'Male', '1984-02-11', 'https://randomuser.me/api/portraits/men/84.jpg', 'Civil Servant', 'Sikh', 'Arora', v_user_id);

    -- User 985: Madhav Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('madhav.singh.985@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Madhav', 'Singh', 'High School', 52312.43, 183.02, 'Male', '1993-06-09', 'https://randomuser.me/api/portraits/men/48.jpg', 'Pharmacist', 'Sikh', 'Kamboj', v_user_id);

    -- User 986: Ishita Chauhan
    INSERT INTO users (email, password, subscription_id)
    VALUES ('ishita.chauhan.986@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Ishita', 'Chauhan', 'PhD', 169657.46, 170.01, 'Female', '1986-02-09', 'https://randomuser.me/api/portraits/women/4.jpg', 'Chef', 'Hindu', 'Shudra', v_user_id);

    -- User 987: Lavanya Shukla
    INSERT INTO users (email, password, subscription_id)
    VALUES ('lavanya.shukla.987@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Lavanya', 'Shukla', 'High School', 155494.35, 172.89, 'Female', '1984-09-21', 'https://randomuser.me/api/portraits/women/21.jpg', 'Photographer', 'Sikh', 'Kamboj', v_user_id);

    -- User 988: Karan Chaudhary
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.chaudhary.988@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Chaudhary', 'Bachelor's', 83646.99, 162.59, 'Male', '1980-07-06', 'https://randomuser.me/api/portraits/men/70.jpg', 'Dentist', 'Jain', 'Agarwal', v_user_id);

    -- User 989: Avni Singh
    INSERT INTO users (email, password, subscription_id)
    VALUES ('avni.singh.989@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Avni', 'Singh', 'Bachelor's', 67936.0, 167.16, 'Female', '1992-12-24', 'https://randomuser.me/api/portraits/women/37.jpg', 'Professor', 'Hindu', 'Baniya', v_user_id);

    -- User 990: Aadhya Reddy
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aadhya.reddy.990@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aadhya', 'Reddy', 'PhD', 126421.64, 160.44, 'Female', '1990-03-10', 'https://randomuser.me/api/portraits/women/1.jpg', 'Interior Designer', 'Muslim', 'Qureshi', v_user_id);

    -- User 991: Karan Mehta
    INSERT INTO users (email, password, subscription_id)
    VALUES ('karan.mehta.991@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Karan', 'Mehta', 'Bachelor's', 55003.88, 160.15, 'Male', '2003-09-01', 'https://randomuser.me/api/portraits/men/67.jpg', 'Dentist', 'Christian', 'Roman Catholic', v_user_id);

    -- User 992: Nikhil Bhat
    INSERT INTO users (email, password, subscription_id)
    VALUES ('nikhil.bhat.992@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Nikhil', 'Bhat', 'Master's', 86028.51, 160.37, 'Male', '1999-01-21', 'https://randomuser.me/api/portraits/men/43.jpg', 'Software Engineer', 'Muslim', 'Pathan', v_user_id);

    -- User 993: Bhavya Pandey
    INSERT INTO users (email, password, subscription_id)
    VALUES ('bhavya.pandey.993@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Bhavya', 'Pandey', 'High School', 167887.98, 160.79, 'Female', '1983-05-11', 'https://randomuser.me/api/portraits/women/64.jpg', 'Researcher', 'Hindu', 'Rajput', v_user_id);

    -- User 994: Harsh Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('harsh.mishra.994@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Harsh', 'Mishra', 'Bachelor's', 121021.15, 168.79, 'Male', '1988-08-17', 'https://randomuser.me/api/portraits/men/9.jpg', 'Sales Executive', 'Hindu', 'Brahmin', v_user_id);

    -- User 995: Kabir Sinha
    INSERT INTO users (email, password, subscription_id)
    VALUES ('kabir.sinha.995@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Kabir', 'Sinha', 'High School', 145317.86, 186.91, 'Male', '1993-04-26', 'https://randomuser.me/api/portraits/men/21.jpg', 'Designer', 'Muslim', 'Sheikh', v_user_id);

    -- User 996: Aarav Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aarav.chatterjee.996@outlook.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aarav', 'Chatterjee', 'Bachelor's', 181398.39, 171.95, 'Male', '2000-04-01', 'https://randomuser.me/api/portraits/men/45.jpg', 'Fashion Designer', 'Christian', 'Syrian Christian', v_user_id);

    -- User 997: Isha Chakraborty
    INSERT INTO users (email, password, subscription_id)
    VALUES ('isha.chakraborty.997@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Isha', 'Chakraborty', 'Bachelor's', 198768.87, 170.53, 'Female', '1987-02-03', 'https://randomuser.me/api/portraits/women/59.jpg', 'Entrepreneur', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 998: Aaradhya Chatterjee
    INSERT INTO users (email, password, subscription_id)
    VALUES ('aaradhya.chatterjee.998@gmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Aaradhya', 'Chatterjee', 'Master's', 47408.7, 150.88, 'Female', '1982-12-13', 'https://randomuser.me/api/portraits/women/96.jpg', 'Content Writer', 'Buddhist', 'Bhotiya', v_user_id);

    -- User 999: Arnav Mishra
    INSERT INTO users (email, password, subscription_id)
    VALUES ('arnav.mishra.999@hotmail.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Arnav', 'Mishra', 'High School', 126037.91, 172.38, 'Male', '1995-05-10', 'https://randomuser.me/api/portraits/men/74.jpg', 'Photographer', 'Jain', 'Shrimal', v_user_id);

    -- User 1000: Angel Kapoor
    INSERT INTO users (email, password, subscription_id)
    VALUES ('angel.kapoor.1000@yahoo.com', '$2a$10$dZ9YKVfQ3DzQ9YKVfQ3DzegKvE9yU5F9YKVfQ3DzegKvE9yU5F9YKV', v_free_subscription_id)
    RETURNING user_id INTO v_user_id;

    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id)
    VALUES ('Angel', 'Kapoor', 'PhD', 83384.59, 161.94, 'Female', '1984-10-02', 'https://randomuser.me/api/portraits/women/9.jpg', 'Electrical Engineer', 'Christian', 'Syrian Christian', v_user_id);

    -- Completed 1000 profiles

END $$;
