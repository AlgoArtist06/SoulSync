-- Ensure unique index exists for ON CONFLICT to work
CREATE UNIQUE INDEX IF NOT EXISTS idx_subscription_name ON subscriptions (subscription_name);;

-- Ensure subscriptions exist (Idempotent)
INSERT INTO subscriptions (subscription_name, fees, queries_number, profiles_allowed)
SELECT 'FREE', 0.0, 5, 3
WHERE NOT EXISTS (SELECT 1 FROM subscriptions WHERE subscription_name = 'FREE');;

INSERT INTO subscriptions (subscription_name, fees, queries_number, profiles_allowed)
SELECT 'BASIC', 9.99, 20, 10
WHERE NOT EXISTS (SELECT 1 FROM subscriptions WHERE subscription_name = 'BASIC');;

INSERT INTO subscriptions (subscription_name, fees, queries_number, profiles_allowed)
SELECT 'GOLD', 29.99, 100, 50
WHERE NOT EXISTS (SELECT 1 FROM subscriptions WHERE subscription_name = 'GOLD');;

INSERT INTO subscriptions (subscription_name, fees, queries_number, profiles_allowed)
SELECT 'PLATINUM', 49.99, -1, -1
WHERE NOT EXISTS (SELECT 1 FROM subscriptions WHERE subscription_name = 'PLATINUM');;

DO $$
DECLARE
    v_user_id BIGINT;
    v_free_subscription_id BIGINT;
BEGIN
    -- Idempotency check: if users exist, do nothing
    IF EXISTS (SELECT 1 FROM users) THEN
        RETURN;
    END IF;

    SELECT subscription_id INTO v_free_subscription_id FROM subscriptions WHERE subscription_name = 'FREE' LIMIT 1;

    INSERT INTO users (email, password, subscription_id) VALUES ('luke.rodrigues.1@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Luke', 'Rodrigues', 'PhD', 189617.93, 171.26, 'Male', '1984-09-15', 'https://randomuser.me/api/portraits/men/65.jpg', 'Sales Executive', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.sheikh.2@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Sheikh', 'Masters', 50696.76, 167.29, 'Male', '1988-06-05', 'https://randomuser.me/api/portraits/men/96.jpg', 'Marketing Manager', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('nikhil.reddy.3@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Nikhil', 'Reddy', 'Bachelors', 49074.75, 188.78, 'Male', '2004-06-14', 'https://randomuser.me/api/portraits/men/43.jpg', 'Data Analyst', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.jain.4@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Jain', 'High School', 192609.99, 164.79, 'Female', '1989-07-18', 'https://randomuser.me/api/portraits/women/83.jpg', 'Pharmacist', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.khan.5@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Khan', 'High School', 124727.5, 185.84, 'Male', '1993-11-28', 'https://randomuser.me/api/portraits/men/18.jpg', 'Sales Executive', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.sandhu.6@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Sandhu', 'PhD', 177442.74, 150.1, 'Female', '1982-08-14', 'https://randomuser.me/api/portraits/women/29.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.tamang.7@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Tamang', 'PhD', 107492.62, 151.0, 'Female', '1988-03-20', 'https://randomuser.me/api/portraits/women/95.jpg', 'Consultant', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanvi.desai.8@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanvi', 'Desai', 'Masters', 87996.7, 163.43, 'Female', '1990-07-19', 'https://randomuser.me/api/portraits/women/62.jpg', 'Software Engineer', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.sidhu.9@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Sidhu', 'Bachelors', 43871.93, 178.92, 'Male', '1994-01-07', 'https://randomuser.me/api/portraits/men/55.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('darsh.desai.10@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Darsh', 'Desai', 'Bachelors', 75905.63, 187.76, 'Male', '1995-07-26', 'https://randomuser.me/api/portraits/men/92.jpg', 'Marketing Manager', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('martha.pereira.11@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Martha', 'Pereira', 'Bachelors', 34682.87, 169.66, 'Female', '1982-09-14', 'https://randomuser.me/api/portraits/women/44.jpg', 'Teacher', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aisha.ansari.12@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aisha', 'Ansari', 'Bachelors', 80334.45, 156.3, 'Female', '1980-12-27', 'https://randomuser.me/api/portraits/women/93.jpg', 'Lawyer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.gurung.13@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Gurung', 'PhD', 146184.11, 177.51, 'Male', '1987-06-02', 'https://randomuser.me/api/portraits/men/38.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.shah.14@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Shah', 'High School', 144164.61, 160.36, 'Female', '1994-12-10', 'https://randomuser.me/api/portraits/women/13.jpg', 'Chef', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.brar.15@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Brar', 'Bachelors', 55298.6, 165.99, 'Female', '1989-08-26', 'https://randomuser.me/api/portraits/women/69.jpg', 'Civil Engineer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.xavier.16@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'Xavier', 'Bachelors', 172779.42, 165.98, 'Female', '1985-06-13', 'https://randomuser.me/api/portraits/women/76.jpg', 'Banker', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.gill.17@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Gill', 'Masters', 164197.26, 186.89, 'Male', '1986-04-25', 'https://randomuser.me/api/portraits/men/41.jpg', 'Accountant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('luke.rodrigues.18@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Luke', 'Rodrigues', 'Masters', 131359.32, 181.95, 'Male', '1996-05-25', 'https://randomuser.me/api/portraits/men/5.jpg', 'Business Owner', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hiba.hussain.19@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hiba', 'Hussain', 'High School', 168145.38, 173.88, 'Female', '1985-01-08', 'https://randomuser.me/api/portraits/women/47.jpg', 'Entrepreneur', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dev.sharma.20@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dev', 'Sharma', 'Masters', 81704.2, 180.49, 'Male', '1982-06-08', 'https://randomuser.me/api/portraits/men/68.jpg', 'Accountant', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('priya.pereira.21@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Priya', 'Pereira', 'Bachelors', 39110.54, 163.25, 'Female', '1986-06-03', 'https://randomuser.me/api/portraits/women/49.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kiranpreet.gill.22@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kiranpreet', 'Gill', 'Bachelors', 64414.25, 150.12, 'Female', '1989-01-09', 'https://randomuser.me/api/portraits/women/83.jpg', 'Sales Executive', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.sherpa.23@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Sherpa', 'Masters', 194668.25, 178.86, 'Male', '1980-06-14', 'https://randomuser.me/api/portraits/men/38.jpg', 'Pharmacist', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('andrew.gomes.24@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Andrew', 'Gomes', 'High School', 131901.27, 171.29, 'Male', '1981-03-17', 'https://randomuser.me/api/portraits/men/18.jpg', 'Accountant', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.ahmed.25@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Ahmed', 'Bachelors', 53214.77, 172.56, 'Female', '1987-12-10', 'https://randomuser.me/api/portraits/women/4.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('christopher.d''souza.26@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Christopher', 'D''Souza', 'High School', 122400.71, 176.86, 'Male', '1995-02-08', 'https://randomuser.me/api/portraits/men/80.jpg', 'Designer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.gupta.27@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Gupta', 'Masters', 62586.41, 151.59, 'Female', '1998-04-07', 'https://randomuser.me/api/portraits/women/85.jpg', 'Accountant', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pooja.patel.28@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pooja', 'Patel', 'High School', 98401.92, 170.21, 'Female', '1993-08-12', 'https://randomuser.me/api/portraits/women/42.jpg', 'Consultant', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amarjeet.kaur.29@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amarjeet', 'Kaur', 'Bachelors', 122020.89, 161.89, 'Male', '1999-04-08', 'https://randomuser.me/api/portraits/men/5.jpg', 'Consultant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anna.gomes.30@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anna', 'Gomes', 'PhD', 61771.97, 152.21, 'Female', '1988-11-15', 'https://randomuser.me/api/portraits/women/14.jpg', 'Lawyer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ishita.iyer.31@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ishita', 'Iyer', 'Bachelors', 32838.74, 168.53, 'Female', '1986-08-28', 'https://randomuser.me/api/portraits/women/34.jpg', 'Sales Executive', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anika.gupta.32@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anika', 'Gupta', 'High School', 70660.97, 150.68, 'Female', '1989-07-03', 'https://randomuser.me/api/portraits/women/79.jpg', 'Nurse', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.tamang.33@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Tamang', 'PhD', 136908.84, 176.52, 'Male', '1980-11-21', 'https://randomuser.me/api/portraits/men/93.jpg', 'Business Owner', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.porwal.34@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Porwal', 'Masters', 101296.38, 167.41, 'Female', '1984-12-27', 'https://randomuser.me/api/portraits/women/15.jpg', 'Accountant', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.sherpa.35@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Sherpa', 'High School', 51303.01, 152.8, 'Female', '1985-11-04', 'https://randomuser.me/api/portraits/women/11.jpg', 'Consultant', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.jain.36@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Jain', 'High School', 33619.78, 164.76, 'Female', '2004-10-27', 'https://randomuser.me/api/portraits/women/34.jpg', 'Lawyer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.shah.37@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Shah', 'Masters', 113571.0, 172.95, 'Female', '1993-07-10', 'https://randomuser.me/api/portraits/women/33.jpg', 'Teacher', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.agarwal.38@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Agarwal', 'Masters', 119821.33, 172.5, 'Female', '1993-01-03', 'https://randomuser.me/api/portraits/women/44.jpg', 'Teacher', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.tamang.39@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Tamang', 'High School', 78042.61, 182.41, 'Male', '2003-08-21', 'https://randomuser.me/api/portraits/men/79.jpg', 'Lawyer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.grewal.40@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Grewal', 'Bachelors', 56257.23, 185.09, 'Male', '1995-02-12', 'https://randomuser.me/api/portraits/men/34.jpg', 'Accountant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mary.fernandes.41@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mary', 'Fernandes', 'High School', 38259.44, 156.63, 'Female', '1989-04-09', 'https://randomuser.me/api/portraits/women/94.jpg', 'Nurse', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('advik.gupta.42@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Advik', 'Gupta', 'High School', 71619.68, 171.57, 'Male', '1996-05-06', 'https://randomuser.me/api/portraits/men/71.jpg', 'Accountant', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.bhutia.43@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Bhutia', 'Bachelors', 136653.93, 183.77, 'Male', '2004-10-27', 'https://randomuser.me/api/portraits/men/66.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.sandhu.44@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Sandhu', 'Bachelors', 170156.71, 165.35, 'Female', '1988-10-21', 'https://randomuser.me/api/portraits/women/30.jpg', 'Architect', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.shah.45@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Shah', 'High School', 195397.95, 177.59, 'Male', '2002-02-17', 'https://randomuser.me/api/portraits/men/3.jpg', 'Software Engineer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.dhillon.46@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Dhillon', 'Masters', 152548.09, 167.45, 'Female', '1990-02-13', 'https://randomuser.me/api/portraits/women/21.jpg', 'Entrepreneur', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.tamang.47@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Tamang', 'Bachelors', 141958.39, 178.58, 'Male', '1992-03-05', 'https://randomuser.me/api/portraits/men/55.jpg', 'Chef', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.bhutia.48@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Bhutia', 'Bachelors', 167542.53, 185.68, 'Male', '1989-08-13', 'https://randomuser.me/api/portraits/men/98.jpg', 'Teacher', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arhan.hussain.49@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arhan', 'Hussain', 'High School', 176314.66, 161.75, 'Male', '1986-02-08', 'https://randomuser.me/api/portraits/men/69.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harleen.singh.50@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harleen', 'Singh', 'High School', 104933.83, 162.48, 'Female', '2003-02-21', 'https://randomuser.me/api/portraits/women/87.jpg', 'Civil Engineer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.tamang.51@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Tamang', 'High School', 89948.97, 184.37, 'Male', '1994-03-16', 'https://randomuser.me/api/portraits/men/4.jpg', 'Nurse', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('taranjot.sidhu.52@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Taranjot', 'Sidhu', 'High School', 191791.5, 173.49, 'Female', '1999-04-12', 'https://randomuser.me/api/portraits/women/57.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.grewal.53@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Grewal', 'Masters', 135856.91, 187.25, 'Male', '1997-07-15', 'https://randomuser.me/api/portraits/men/79.jpg', 'Teacher', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.brar.54@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Brar', 'Masters', 145739.09, 168.95, 'Male', '1984-12-10', 'https://randomuser.me/api/portraits/men/98.jpg', 'Designer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sandeep.brar.55@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sandeep', 'Brar', 'PhD', 97482.72, 159.96, 'Female', '1999-11-26', 'https://randomuser.me/api/portraits/women/69.jpg', 'Software Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.sidhu.56@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Sidhu', 'High School', 112699.79, 165.12, 'Male', '1999-04-21', 'https://randomuser.me/api/portraits/men/48.jpg', 'Architect', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.agarwal.57@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Agarwal', 'Bachelors', 122017.41, 174.96, 'Female', '2004-01-19', 'https://randomuser.me/api/portraits/women/66.jpg', 'Banker', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rachel.d''souza.58@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rachel', 'D''Souza', 'PhD', 37700.5, 157.53, 'Female', '1999-09-23', 'https://randomuser.me/api/portraits/women/94.jpg', 'Doctor', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.d''souza.59@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'D''Souza', 'PhD', 106670.32, 169.98, 'Female', '1981-12-25', 'https://randomuser.me/api/portraits/women/53.jpg', 'Business Owner', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.patel.60@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Patel', 'Bachelors', 193551.67, 169.71, 'Female', '1987-09-27', 'https://randomuser.me/api/portraits/women/93.jpg', 'Lawyer', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.reddy.61@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Reddy', 'Masters', 91471.3, 165.53, 'Female', '2002-04-11', 'https://randomuser.me/api/portraits/women/89.jpg', 'Software Engineer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('madhav.verma.62@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Madhav', 'Verma', 'Bachelors', 195385.4, 176.14, 'Male', '1988-06-13', 'https://randomuser.me/api/portraits/men/11.jpg', 'Lawyer', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arhan.khan.63@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arhan', 'Khan', 'High School', 138130.32, 183.1, 'Male', '2003-08-15', 'https://randomuser.me/api/portraits/men/100.jpg', 'Civil Engineer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.fernandes.64@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Fernandes', 'High School', 61291.73, 168.11, 'Male', '1997-02-21', 'https://randomuser.me/api/portraits/men/100.jpg', 'Pharmacist', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mohammed.syed.65@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mohammed', 'Syed', 'High School', 171228.72, 170.08, 'Male', '1990-03-06', 'https://randomuser.me/api/portraits/men/76.jpg', 'Marketing Manager', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.grewal.66@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Grewal', 'Masters', 97408.91, 167.88, 'Male', '1999-01-26', 'https://randomuser.me/api/portraits/men/63.jpg', 'Consultant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.shah.67@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Shah', 'Bachelors', 135580.14, 157.13, 'Female', '1990-06-21', 'https://randomuser.me/api/portraits/women/23.jpg', 'Banker', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ansh.desai.68@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ansh', 'Desai', 'Bachelors', 99958.84, 178.44, 'Male', '1992-07-05', 'https://randomuser.me/api/portraits/men/53.jpg', 'Accountant', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.reddy.69@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Reddy', 'Masters', 135924.11, 155.59, 'Female', '1986-09-23', 'https://randomuser.me/api/portraits/women/68.jpg', 'Marketing Manager', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rebecca.rodrigues.70@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rebecca', 'Rodrigues', 'Bachelors', 137403.38, 152.12, 'Female', '1984-05-25', 'https://randomuser.me/api/portraits/women/58.jpg', 'Nurse', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yasmin.ahmed.71@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yasmin', 'Ahmed', 'PhD', 182100.89, 167.76, 'Female', '2004-08-02', 'https://randomuser.me/api/portraits/women/48.jpg', 'Banker', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.jain.72@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Jain', 'High School', 87973.91, 182.47, 'Male', '1997-10-26', 'https://randomuser.me/api/portraits/men/35.jpg', 'Accountant', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.singh.73@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Singh', 'Masters', 52022.44, 167.07, 'Female', '1981-01-06', 'https://randomuser.me/api/portraits/women/92.jpg', 'Consultant', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paramjit.singh.74@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paramjit', 'Singh', 'Bachelors', 113610.53, 161.41, 'Male', '1999-02-25', 'https://randomuser.me/api/portraits/men/72.jpg', 'Marketing Manager', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.oswal.75@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Oswal', 'Bachelors', 43479.36, 155.12, 'Female', '1993-04-14', 'https://randomuser.me/api/portraits/women/10.jpg', 'Data Analyst', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.porwal.76@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Porwal', 'Masters', 96332.1, 186.18, 'Male', '1981-08-24', 'https://randomuser.me/api/portraits/men/8.jpg', 'Marketing Manager', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.lama.77@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Lama', 'High School', 124060.27, 173.39, 'Male', '1989-01-10', 'https://randomuser.me/api/portraits/men/81.jpg', 'Lawyer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navya.singh.78@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navya', 'Singh', 'Masters', 74006.22, 167.53, 'Female', '1984-12-17', 'https://randomuser.me/api/portraits/women/45.jpg', 'Lawyer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.porwal.79@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Porwal', 'Bachelors', 33821.32, 173.0, 'Male', '2000-02-25', 'https://randomuser.me/api/portraits/men/40.jpg', 'Banker', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.porwal.80@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Porwal', 'High School', 71486.72, 167.71, 'Female', '1994-07-13', 'https://randomuser.me/api/portraits/women/5.jpg', 'Designer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mariam.sheikh.81@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mariam', 'Sheikh', 'Masters', 84234.04, 152.44, 'Female', '2000-05-04', 'https://randomuser.me/api/portraits/women/91.jpg', 'Chef', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.grewal.82@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Grewal', 'High School', 81735.54, 166.37, 'Male', '2002-10-27', 'https://randomuser.me/api/portraits/men/10.jpg', 'Marketing Manager', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.dhillon.83@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Dhillon', 'PhD', 84672.14, 162.94, 'Female', '1990-03-22', 'https://randomuser.me/api/portraits/women/10.jpg', 'Architect', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.tamang.84@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Tamang', 'Masters', 153429.59, 163.04, 'Female', '1998-09-05', 'https://randomuser.me/api/portraits/women/56.jpg', 'Pharmacist', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.dhillon.85@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Dhillon', 'Masters', 81603.2, 162.13, 'Female', '2002-12-06', 'https://randomuser.me/api/portraits/women/42.jpg', 'Marketing Manager', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.ansari.86@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Ansari', 'High School', 47303.67, 174.45, 'Male', '2004-04-11', 'https://randomuser.me/api/portraits/men/29.jpg', 'Nurse', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.lama.87@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Lama', 'Bachelors', 67786.08, 159.8, 'Female', '1980-10-25', 'https://randomuser.me/api/portraits/women/97.jpg', 'Entrepreneur', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.hussain.88@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Hussain', 'Masters', 120797.08, 163.18, 'Female', '1988-05-17', 'https://randomuser.me/api/portraits/women/62.jpg', 'Nurse', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.ahmed.89@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Ahmed', 'PhD', 120784.16, 173.21, 'Female', '1991-02-06', 'https://randomuser.me/api/portraits/women/26.jpg', 'Consultant', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dolma.tamang.90@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dolma', 'Tamang', 'Masters', 50336.67, 168.25, 'Female', '1980-11-13', 'https://randomuser.me/api/portraits/women/36.jpg', 'Banker', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.tamang.91@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Tamang', 'PhD', 64161.46, 169.7, 'Male', '1985-05-15', 'https://randomuser.me/api/portraits/men/32.jpg', 'Marketing Manager', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.shah.92@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Shah', 'High School', 95904.91, 150.47, 'Female', '1986-12-07', 'https://randomuser.me/api/portraits/women/93.jpg', 'Software Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('susan.xavier.93@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Susan', 'Xavier', 'High School', 194280.46, 166.95, 'Female', '1994-08-23', 'https://randomuser.me/api/portraits/women/21.jpg', 'Architect', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('siya.patel.94@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Siya', 'Patel', 'Bachelors', 108970.21, 174.99, 'Female', '1997-04-23', 'https://randomuser.me/api/portraits/women/33.jpg', 'Civil Engineer', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khadija.hassan.95@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khadija', 'Hassan', 'Bachelors', 82640.44, 159.27, 'Female', '1993-02-20', 'https://randomuser.me/api/portraits/women/97.jpg', 'Software Engineer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.agarwal.96@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Agarwal', 'Bachelors', 71811.21, 168.74, 'Male', '2003-01-11', 'https://randomuser.me/api/portraits/men/58.jpg', 'Data Analyst', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.gurung.97@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Gurung', 'High School', 49881.61, 165.63, 'Male', '2004-05-14', 'https://randomuser.me/api/portraits/men/89.jpg', 'Business Owner', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('luke.thomas.98@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Luke', 'Thomas', 'Masters', 97931.25, 189.93, 'Male', '1992-11-23', 'https://randomuser.me/api/portraits/men/37.jpg', 'Designer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.jain.99@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Jain', 'Masters', 93852.77, 173.48, 'Female', '2004-11-27', 'https://randomuser.me/api/portraits/women/71.jpg', 'Accountant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rayan.khan.100@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rayan', 'Khan', 'Masters', 64141.59, 189.62, 'Male', '1991-06-26', 'https://randomuser.me/api/portraits/men/29.jpg', 'Consultant', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rohan.iyer.101@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rohan', 'Iyer', 'PhD', 148110.62, 166.69, 'Male', '1981-08-22', 'https://randomuser.me/api/portraits/men/18.jpg', 'Civil Engineer', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zara.hussain.102@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zara', 'Hussain', 'PhD', 181021.07, 161.23, 'Female', '2003-08-19', 'https://randomuser.me/api/portraits/women/23.jpg', 'Business Owner', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('laila.hassan.103@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Laila', 'Hassan', 'Bachelors', 136499.0, 171.92, 'Female', '1984-05-04', 'https://randomuser.me/api/portraits/women/41.jpg', 'Doctor', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.jain.104@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Jain', 'High School', 150025.93, 162.76, 'Female', '2000-01-21', 'https://randomuser.me/api/portraits/women/99.jpg', 'Marketing Manager', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.lama.105@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Lama', 'PhD', 176915.32, 162.77, 'Male', '1993-12-11', 'https://randomuser.me/api/portraits/men/24.jpg', 'Chef', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('varun.singh.106@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Varun', 'Singh', 'Bachelors', 181155.15, 166.61, 'Male', '1994-01-01', 'https://randomuser.me/api/portraits/men/97.jpg', 'Accountant', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('abdullah.ali.107@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Abdullah', 'Ali', 'High School', 150570.06, 179.73, 'Male', '1999-05-06', 'https://randomuser.me/api/portraits/men/36.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sai.singh.108@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sai', 'Singh', 'Bachelors', 128215.8, 163.38, 'Male', '1985-11-26', 'https://randomuser.me/api/portraits/men/3.jpg', 'Pharmacist', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.porwal.109@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Porwal', 'High School', 71531.52, 151.19, 'Female', '1999-06-01', 'https://randomuser.me/api/portraits/women/20.jpg', 'Pharmacist', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.shah.110@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Shah', 'Masters', 190398.94, 150.72, 'Female', '2000-06-17', 'https://randomuser.me/api/portraits/women/96.jpg', 'Accountant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mohammed.syed.111@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mohammed', 'Syed', 'Masters', 71622.47, 169.02, 'Male', '1988-10-14', 'https://randomuser.me/api/portraits/men/9.jpg', 'Civil Engineer', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditi.iyer.112@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditi', 'Iyer', 'High School', 98788.56, 162.33, 'Female', '1995-08-14', 'https://randomuser.me/api/portraits/women/80.jpg', 'Architect', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.verma.113@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Verma', 'Masters', 160066.98, 158.95, 'Female', '2002-08-08', 'https://randomuser.me/api/portraits/women/71.jpg', 'Banker', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.gill.114@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Gill', 'Masters', 136705.53, 170.77, 'Female', '2001-02-28', 'https://randomuser.me/api/portraits/women/74.jpg', 'Lawyer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.sherpa.115@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Sherpa', 'Bachelors', 105459.59, 150.05, 'Female', '1993-01-06', 'https://randomuser.me/api/portraits/women/61.jpg', 'Teacher', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yash.desai.116@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yash', 'Desai', 'High School', 190566.01, 172.82, 'Male', '1994-09-11', 'https://randomuser.me/api/portraits/men/8.jpg', 'Consultant', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.sharma.117@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Sharma', 'PhD', 123466.19, 161.08, 'Male', '1987-08-12', 'https://randomuser.me/api/portraits/men/63.jpg', 'Entrepreneur', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('omar.syed.118@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Omar', 'Syed', 'High School', 185588.25, 163.7, 'Male', '2002-03-26', 'https://randomuser.me/api/portraits/men/39.jpg', 'Pharmacist', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditi.singh.119@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditi', 'Singh', 'Bachelors', 171374.53, 154.22, 'Female', '1988-04-13', 'https://randomuser.me/api/portraits/women/73.jpg', 'Entrepreneur', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.khan.120@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Khan', 'High School', 59486.87, 179.28, 'Male', '1991-12-09', 'https://randomuser.me/api/portraits/men/68.jpg', 'Sales Executive', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('siya.verma.121@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Siya', 'Verma', 'Masters', 140110.22, 171.82, 'Female', '1994-02-24', 'https://randomuser.me/api/portraits/women/88.jpg', 'Pharmacist', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.kaur.122@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Kaur', 'PhD', 122590.59, 173.12, 'Male', '1993-10-06', 'https://randomuser.me/api/portraits/men/85.jpg', 'Chef', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.tamang.123@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Tamang', 'Masters', 112619.31, 159.23, 'Female', '1992-07-08', 'https://randomuser.me/api/portraits/women/52.jpg', 'Data Analyst', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.nair.124@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Nair', 'Masters', 196779.39, 154.05, 'Female', '2000-10-21', 'https://randomuser.me/api/portraits/women/89.jpg', 'Business Owner', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.xavier.125@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Xavier', 'PhD', 71950.42, 178.94, 'Male', '1994-10-25', 'https://randomuser.me/api/portraits/men/59.jpg', 'Sales Executive', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aadhya.verma.126@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aadhya', 'Verma', 'High School', 78318.43, 168.53, 'Female', '1982-04-08', 'https://randomuser.me/api/portraits/women/88.jpg', 'Chef', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harleen.gill.127@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harleen', 'Gill', 'Masters', 92006.8, 155.14, 'Female', '1991-02-06', 'https://randomuser.me/api/portraits/women/92.jpg', 'Doctor', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amarjeet.brar.128@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amarjeet', 'Brar', 'Masters', 180121.93, 171.41, 'Male', '1989-04-23', 'https://randomuser.me/api/portraits/men/9.jpg', 'Software Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mohammed.ali.129@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mohammed', 'Ali', 'Masters', 125432.11, 163.85, 'Male', '1998-12-17', 'https://randomuser.me/api/portraits/men/74.jpg', 'Data Analyst', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.patel.130@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Patel', 'Masters', 105527.15, 168.45, 'Male', '1995-03-06', 'https://randomuser.me/api/portraits/men/36.jpg', 'Data Analyst', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.shah.131@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Shah', 'High School', 84186.53, 172.81, 'Female', '2003-04-03', 'https://randomuser.me/api/portraits/women/63.jpg', 'Entrepreneur', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.jain.132@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Jain', 'PhD', 198121.23, 177.22, 'Male', '1981-07-27', 'https://randomuser.me/api/portraits/men/7.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.agarwal.133@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Agarwal', 'PhD', 141637.21, 178.91, 'Male', '2003-11-04', 'https://randomuser.me/api/portraits/men/81.jpg', 'Pharmacist', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.reddy.134@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Reddy', 'Bachelors', 148152.11, 189.03, 'Male', '2004-02-24', 'https://randomuser.me/api/portraits/men/72.jpg', 'Lawyer', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.brar.135@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Brar', 'PhD', 103739.27, 163.22, 'Female', '1984-08-23', 'https://randomuser.me/api/portraits/women/65.jpg', 'Lawyer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('param.verma.136@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Param', 'Verma', 'Masters', 74859.39, 189.22, 'Male', '1994-09-15', 'https://randomuser.me/api/portraits/men/41.jpg', 'Marketing Manager', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.pereira.137@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'Pereira', 'PhD', 196232.98, 171.32, 'Female', '1999-09-18', 'https://randomuser.me/api/portraits/women/43.jpg', 'Accountant', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dev.gupta.138@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dev', 'Gupta', 'Masters', 136848.64, 180.27, 'Male', '1998-11-09', 'https://randomuser.me/api/portraits/men/39.jpg', 'Designer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sandeep.kaur.139@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sandeep', 'Kaur', 'PhD', 185185.63, 159.05, 'Female', '1987-10-18', 'https://randomuser.me/api/portraits/women/67.jpg', 'Architect', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.lama.140@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Lama', 'PhD', 40594.95, 171.52, 'Male', '1991-06-05', 'https://randomuser.me/api/portraits/men/68.jpg', 'Doctor', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.agarwal.141@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Agarwal', 'Masters', 85853.09, 153.8, 'Female', '1997-05-21', 'https://randomuser.me/api/portraits/women/97.jpg', 'Doctor', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.sheikh.142@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Sheikh', 'High School', 143204.24, 178.93, 'Male', '1996-05-14', 'https://randomuser.me/api/portraits/men/76.jpg', 'Sales Executive', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.agarwal.143@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Agarwal', 'High School', 197585.19, 179.97, 'Male', '1996-12-28', 'https://randomuser.me/api/portraits/men/44.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.jain.144@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Jain', 'PhD', 87104.03, 174.06, 'Male', '1997-12-03', 'https://randomuser.me/api/portraits/men/60.jpg', 'Software Engineer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.oswal.145@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Oswal', 'Masters', 90957.7, 170.84, 'Female', '1995-08-28', 'https://randomuser.me/api/portraits/women/70.jpg', 'Nurse', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.malik.146@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Malik', 'Bachelors', 143123.56, 172.84, 'Female', '2000-09-04', 'https://randomuser.me/api/portraits/women/28.jpg', 'Teacher', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sandhu.147@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sandhu', 'High School', 108789.02, 177.05, 'Male', '1997-05-20', 'https://randomuser.me/api/portraits/men/79.jpg', 'Designer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dolma.tamang.148@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dolma', 'Tamang', 'Bachelors', 197100.24, 168.73, 'Female', '1983-01-22', 'https://randomuser.me/api/portraits/women/12.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ali.syed.149@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ali', 'Syed', 'Bachelors', 78630.78, 169.5, 'Male', '1981-05-18', 'https://randomuser.me/api/portraits/men/23.jpg', 'Marketing Manager', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.sandhu.150@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Sandhu', 'Bachelors', 161916.37, 175.2, 'Male', '2003-03-22', 'https://randomuser.me/api/portraits/men/6.jpg', 'Sales Executive', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.singh.151@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Singh', 'High School', 131378.52, 164.77, 'Female', '1984-10-27', 'https://randomuser.me/api/portraits/women/57.jpg', 'Data Analyst', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.oswal.152@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Oswal', 'Bachelors', 174146.5, 161.25, 'Female', '1991-11-06', 'https://randomuser.me/api/portraits/women/16.jpg', 'Software Engineer', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('param.patel.153@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Param', 'Patel', 'PhD', 99543.85, 165.46, 'Male', '1992-06-02', 'https://randomuser.me/api/portraits/men/9.jpg', 'Doctor', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.gill.154@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Gill', 'PhD', 176213.02, 160.96, 'Male', '1996-10-16', 'https://randomuser.me/api/portraits/men/83.jpg', 'Chef', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.gupta.155@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Gupta', 'PhD', 82099.68, 169.94, 'Female', '1988-09-08', 'https://randomuser.me/api/portraits/women/60.jpg', 'Teacher', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.gupta.156@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Gupta', 'PhD', 97197.93, 170.98, 'Female', '1992-05-08', 'https://randomuser.me/api/portraits/women/58.jpg', 'Accountant', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.shah.157@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Shah', 'Masters', 126324.86, 167.37, 'Male', '2001-12-19', 'https://randomuser.me/api/portraits/men/43.jpg', 'Teacher', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.sandhu.158@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Sandhu', 'High School', 138914.79, 169.97, 'Male', '1985-04-02', 'https://randomuser.me/api/portraits/men/65.jpg', 'Pharmacist', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.malik.159@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Malik', 'Masters', 107314.23, 150.96, 'Female', '1999-04-14', 'https://randomuser.me/api/portraits/women/41.jpg', 'Nurse', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michael.d''souza.160@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michael', 'D''Souza', 'High School', 161422.6, 188.44, 'Male', '1997-09-23', 'https://randomuser.me/api/portraits/men/36.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.tamang.161@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Tamang', 'Masters', 157232.36, 164.38, 'Male', '2003-04-23', 'https://randomuser.me/api/portraits/men/23.jpg', 'Consultant', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.bhutia.162@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Bhutia', 'PhD', 54760.25, 178.78, 'Male', '1996-04-15', 'https://randomuser.me/api/portraits/men/97.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.nair.163@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Nair', 'High School', 126369.83, 186.92, 'Male', '1997-05-28', 'https://randomuser.me/api/portraits/men/95.jpg', 'Data Analyst', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.porwal.164@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Porwal', 'Masters', 113169.1, 166.02, 'Female', '1983-01-16', 'https://randomuser.me/api/portraits/women/46.jpg', 'Data Analyst', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.dhillon.165@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Dhillon', 'Bachelors', 122726.92, 174.68, 'Female', '1995-02-23', 'https://randomuser.me/api/portraits/women/53.jpg', 'Accountant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.pereira.166@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'Pereira', 'Masters', 145031.39, 165.37, 'Female', '1993-06-05', 'https://randomuser.me/api/portraits/women/13.jpg', 'Civil Engineer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.lama.167@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Lama', 'PhD', 162242.92, 166.58, 'Male', '1995-09-02', 'https://randomuser.me/api/portraits/men/66.jpg', 'Sales Executive', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.singh.168@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Singh', 'Bachelors', 85140.71, 160.32, 'Male', '1993-04-06', 'https://randomuser.me/api/portraits/men/46.jpg', 'Sales Executive', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.syed.169@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Syed', 'High School', 101559.43, 167.2, 'Female', '1997-05-13', 'https://randomuser.me/api/portraits/women/70.jpg', 'Nurse', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hannah.thomas.170@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hannah', 'Thomas', 'PhD', 78260.32, 166.31, 'Female', '1981-02-19', 'https://randomuser.me/api/portraits/women/49.jpg', 'Business Owner', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mariam.ahmed.171@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mariam', 'Ahmed', 'High School', 139721.62, 162.44, 'Female', '1989-04-05', 'https://randomuser.me/api/portraits/women/87.jpg', 'Civil Engineer', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arhan.hassan.172@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arhan', 'Hassan', 'High School', 167032.32, 168.33, 'Male', '1983-02-01', 'https://randomuser.me/api/portraits/men/11.jpg', 'Sales Executive', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('madhav.joshi.173@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Madhav', 'Joshi', 'Bachelors', 127823.84, 186.85, 'Male', '1986-05-13', 'https://randomuser.me/api/portraits/men/39.jpg', 'Chef', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.pereira.174@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'Pereira', 'PhD', 79598.55, 173.42, 'Female', '1984-05-28', 'https://randomuser.me/api/portraits/women/45.jpg', 'Banker', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aryan.sharma.175@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aryan', 'Sharma', 'Masters', 126379.54, 179.78, 'Male', '2004-11-14', 'https://randomuser.me/api/portraits/men/80.jpg', 'Software Engineer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harmeet.gill.176@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harmeet', 'Gill', 'PhD', 148936.96, 162.15, 'Male', '1990-11-05', 'https://randomuser.me/api/portraits/men/23.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.177@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'Bachelors', 196275.17, 189.28, 'Male', '1998-01-27', 'https://randomuser.me/api/portraits/men/91.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('joshua.gomes.178@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Joshua', 'Gomes', 'PhD', 94812.98, 181.9, 'Male', '1985-08-05', 'https://randomuser.me/api/portraits/men/56.jpg', 'Software Engineer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.patel.179@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Patel', 'Bachelors', 42174.52, 160.67, 'Male', '1988-11-19', 'https://randomuser.me/api/portraits/men/91.jpg', 'Entrepreneur', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.shah.180@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Shah', 'Masters', 82740.45, 166.52, 'Male', '1984-04-25', 'https://randomuser.me/api/portraits/men/38.jpg', 'Designer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.oswal.181@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Oswal', 'High School', 143540.21, 186.11, 'Male', '1990-06-21', 'https://randomuser.me/api/portraits/men/74.jpg', 'Software Engineer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.jain.182@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Jain', 'High School', 76466.9, 168.63, 'Male', '2000-10-11', 'https://randomuser.me/api/portraits/men/5.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.jain.183@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Jain', 'PhD', 179636.3, 166.74, 'Female', '1991-07-18', 'https://randomuser.me/api/portraits/women/4.jpg', 'Pharmacist', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('nisha.gupta.184@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Nisha', 'Gupta', 'PhD', 93855.31, 167.94, 'Female', '2003-02-02', 'https://randomuser.me/api/portraits/women/52.jpg', 'Civil Engineer', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('avni.verma.185@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Avni', 'Verma', 'High School', 182181.07, 160.51, 'Female', '1999-02-19', 'https://randomuser.me/api/portraits/women/79.jpg', 'Doctor', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.gurung.186@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Gurung', 'PhD', 182887.92, 171.6, 'Male', '1998-05-24', 'https://randomuser.me/api/portraits/men/11.jpg', 'Marketing Manager', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.porwal.187@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Porwal', 'PhD', 48940.87, 151.87, 'Female', '1988-12-09', 'https://randomuser.me/api/portraits/women/20.jpg', 'Civil Engineer', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('laila.syed.188@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Laila', 'Syed', 'Masters', 181861.6, 157.26, 'Female', '1988-05-09', 'https://randomuser.me/api/portraits/women/73.jpg', 'Banker', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.jain.189@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Jain', 'PhD', 159708.24, 173.41, 'Female', '1999-10-08', 'https://randomuser.me/api/portraits/women/15.jpg', 'Designer', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kiaan.singh.190@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kiaan', 'Singh', 'Masters', 33195.74, 162.64, 'Male', '1983-12-21', 'https://randomuser.me/api/portraits/men/99.jpg', 'Pharmacist', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.agarwal.191@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Agarwal', 'Masters', 93301.47, 158.7, 'Female', '2000-12-07', 'https://randomuser.me/api/portraits/women/77.jpg', 'Banker', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.sandhu.192@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Sandhu', 'Bachelors', 114009.65, 166.44, 'Male', '1998-12-10', 'https://randomuser.me/api/portraits/men/37.jpg', 'Chef', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.hussain.193@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Hussain', 'Bachelors', 195278.74, 171.79, 'Female', '2000-08-12', 'https://randomuser.me/api/portraits/women/48.jpg', 'Teacher', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.jain.194@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Jain', 'Masters', 98073.99, 162.04, 'Male', '1989-02-13', 'https://randomuser.me/api/portraits/men/88.jpg', 'Banker', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.oswal.195@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Oswal', 'High School', 81488.25, 172.45, 'Male', '1991-07-02', 'https://randomuser.me/api/portraits/men/60.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.shah.196@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Shah', 'High School', 112105.89, 184.47, 'Male', '1985-03-01', 'https://randomuser.me/api/portraits/men/25.jpg', 'Teacher', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zara.sheikh.197@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zara', 'Sheikh', 'PhD', 95393.88, 153.26, 'Female', '1981-03-12', 'https://randomuser.me/api/portraits/women/22.jpg', 'Entrepreneur', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.oswal.198@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Oswal', 'Bachelors', 92498.46, 160.14, 'Male', '2001-12-05', 'https://randomuser.me/api/portraits/men/92.jpg', 'Teacher', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.jain.199@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Jain', 'High School', 160215.55, 174.55, 'Male', '1986-04-10', 'https://randomuser.me/api/portraits/men/24.jpg', 'Business Owner', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.singh.200@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Singh', 'Masters', 105346.59, 161.78, 'Female', '1981-11-20', 'https://randomuser.me/api/portraits/women/83.jpg', 'Chef', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.sherpa.201@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Sherpa', 'High School', 75376.99, 161.93, 'Female', '1986-12-26', 'https://randomuser.me/api/portraits/women/43.jpg', 'Teacher', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.dhillon.202@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Dhillon', 'Masters', 139606.68, 153.96, 'Female', '1989-05-16', 'https://randomuser.me/api/portraits/women/97.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.kaur.203@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Kaur', 'Masters', 79046.54, 187.75, 'Male', '1998-10-07', 'https://randomuser.me/api/portraits/men/13.jpg', 'Architect', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('advik.verma.204@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Advik', 'Verma', 'PhD', 65480.11, 174.31, 'Male', '1984-08-18', 'https://randomuser.me/api/portraits/men/20.jpg', 'Consultant', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mariam.khan.205@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mariam', 'Khan', 'PhD', 185410.54, 161.45, 'Female', '2000-03-19', 'https://randomuser.me/api/portraits/women/95.jpg', 'Chef', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.jain.206@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Jain', 'High School', 91716.42, 170.54, 'Male', '1999-05-11', 'https://randomuser.me/api/portraits/men/92.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shaurya.singh.207@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shaurya', 'Singh', 'High School', 63033.96, 184.96, 'Male', '1980-11-22', 'https://randomuser.me/api/portraits/men/2.jpg', 'Lawyer', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.grewal.208@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Grewal', 'High School', 198034.74, 152.98, 'Female', '1990-10-28', 'https://randomuser.me/api/portraits/women/81.jpg', 'Lawyer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('omar.ansari.209@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Omar', 'Ansari', 'High School', 168354.51, 186.87, 'Male', '1997-08-08', 'https://randomuser.me/api/portraits/men/69.jpg', 'Entrepreneur', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paul.rodrigues.210@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paul', 'Rodrigues', 'PhD', 92755.63, 186.94, 'Male', '1989-01-01', 'https://randomuser.me/api/portraits/men/14.jpg', 'Data Analyst', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.bhutia.211@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Bhutia', 'Bachelors', 184586.16, 174.49, 'Male', '1983-06-23', 'https://randomuser.me/api/portraits/men/63.jpg', 'Lawyer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.shah.212@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Shah', 'Bachelors', 52239.0, 151.34, 'Female', '2001-12-08', 'https://randomuser.me/api/portraits/women/15.jpg', 'Accountant', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('safiya.khan.213@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Safiya', 'Khan', 'PhD', 62586.55, 162.92, 'Female', '1994-02-15', 'https://randomuser.me/api/portraits/women/78.jpg', 'Banker', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('advait.joshi.214@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Advait', 'Joshi', 'PhD', 42744.25, 160.8, 'Male', '1998-05-11', 'https://randomuser.me/api/portraits/men/33.jpg', 'Teacher', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('abdullah.malik.215@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Abdullah', 'Malik', 'High School', 175653.06, 179.67, 'Male', '1983-09-15', 'https://randomuser.me/api/portraits/men/68.jpg', 'Nurse', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.dhillon.216@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Dhillon', 'PhD', 98184.71, 162.86, 'Female', '2000-08-03', 'https://randomuser.me/api/portraits/women/83.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navya.nair.217@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navya', 'Nair', 'Bachelors', 71251.56, 156.37, 'Female', '2001-04-04', 'https://randomuser.me/api/portraits/women/82.jpg', 'Business Owner', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paramjit.sidhu.218@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paramjit', 'Sidhu', 'Bachelors', 59889.52, 169.03, 'Male', '1987-12-28', 'https://randomuser.me/api/portraits/men/7.jpg', 'Banker', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rebecca.fernandes.219@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rebecca', 'Fernandes', 'PhD', 35984.9, 151.41, 'Female', '1993-01-26', 'https://randomuser.me/api/portraits/women/63.jpg', 'Doctor', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.brar.220@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Brar', 'PhD', 110725.48, 162.58, 'Male', '2000-09-08', 'https://randomuser.me/api/portraits/men/53.jpg', 'Lawyer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.d''souza.221@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'D''Souza', 'Masters', 108591.03, 167.8, 'Female', '1991-03-12', 'https://randomuser.me/api/portraits/women/43.jpg', 'Data Analyst', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.sherpa.222@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Sherpa', 'High School', 39202.79, 166.8, 'Male', '1980-05-18', 'https://randomuser.me/api/portraits/men/40.jpg', 'Entrepreneur', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('abdullah.malik.223@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Abdullah', 'Malik', 'High School', 158241.57, 169.56, 'Male', '1982-07-06', 'https://randomuser.me/api/portraits/men/1.jpg', 'Banker', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.shah.224@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Shah', 'Masters', 63318.54, 177.85, 'Male', '1987-02-04', 'https://randomuser.me/api/portraits/men/62.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurbir.sidhu.225@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurbir', 'Sidhu', 'Masters', 133405.75, 181.4, 'Male', '1991-09-20', 'https://randomuser.me/api/portraits/men/19.jpg', 'Nurse', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aaliyah.malik.226@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aaliyah', 'Malik', 'Masters', 102686.95, 170.28, 'Female', '1980-09-19', 'https://randomuser.me/api/portraits/women/99.jpg', 'Marketing Manager', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ansh.iyer.227@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ansh', 'Iyer', 'High School', 40669.74, 184.41, 'Male', '1997-07-19', 'https://randomuser.me/api/portraits/men/78.jpg', 'Entrepreneur', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.agarwal.228@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Agarwal', 'High School', 81531.23, 161.55, 'Female', '2003-02-11', 'https://randomuser.me/api/portraits/women/20.jpg', 'Nurse', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('noor.sheikh.229@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Noor', 'Sheikh', 'Bachelors', 67239.16, 154.19, 'Female', '1991-03-19', 'https://randomuser.me/api/portraits/women/42.jpg', 'Civil Engineer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.tamang.230@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Tamang', 'Masters', 37446.67, 176.14, 'Male', '2004-12-10', 'https://randomuser.me/api/portraits/men/65.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('noor.syed.231@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Noor', 'Syed', 'High School', 51550.63, 173.54, 'Female', '2001-06-25', 'https://randomuser.me/api/portraits/women/24.jpg', 'Pharmacist', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.rodrigues.232@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Rodrigues', 'PhD', 119043.84, 161.98, 'Male', '1986-11-06', 'https://randomuser.me/api/portraits/men/17.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('safiya.ali.233@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Safiya', 'Ali', 'High School', 46313.86, 155.36, 'Female', '1982-05-09', 'https://randomuser.me/api/portraits/women/68.jpg', 'Designer', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.agarwal.234@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Agarwal', 'Masters', 125982.39, 188.11, 'Male', '1986-10-15', 'https://randomuser.me/api/portraits/men/87.jpg', 'Sales Executive', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.bhutia.235@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Bhutia', 'PhD', 146064.73, 167.64, 'Female', '1990-05-02', 'https://randomuser.me/api/portraits/women/15.jpg', 'Architect', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arnav.patel.236@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arnav', 'Patel', 'PhD', 38829.17, 173.15, 'Male', '1987-01-15', 'https://randomuser.me/api/portraits/men/39.jpg', 'Teacher', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lhamo.gurung.237@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lhamo', 'Gurung', 'High School', 91523.31, 168.43, 'Female', '1996-12-24', 'https://randomuser.me/api/portraits/women/40.jpg', 'Nurse', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('omar.sheikh.238@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Omar', 'Sheikh', 'High School', 104656.45, 180.41, 'Male', '1983-07-05', 'https://randomuser.me/api/portraits/men/74.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('peter.gomes.239@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Peter', 'Gomes', 'Masters', 55643.56, 187.38, 'Male', '1991-11-05', 'https://randomuser.me/api/portraits/men/76.jpg', 'Doctor', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.sheikh.240@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Sheikh', 'Bachelors', 73800.68, 162.6, 'Female', '1994-04-11', 'https://randomuser.me/api/portraits/women/86.jpg', 'Doctor', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('daniel.gomes.241@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Daniel', 'Gomes', 'Masters', 143783.7, 175.4, 'Male', '1990-12-24', 'https://randomuser.me/api/portraits/men/34.jpg', 'Teacher', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.agarwal.242@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Agarwal', 'Masters', 84285.57, 181.43, 'Male', '2002-09-04', 'https://randomuser.me/api/portraits/men/25.jpg', 'Civil Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aryan.singh.243@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aryan', 'Singh', 'PhD', 143460.03, 166.5, 'Male', '2003-04-09', 'https://randomuser.me/api/portraits/men/66.jpg', 'Consultant', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayaan.ali.244@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayaan', 'Ali', 'High School', 160685.54, 167.77, 'Male', '2001-05-15', 'https://randomuser.me/api/portraits/men/25.jpg', 'Banker', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayesha.hussain.245@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayesha', 'Hussain', 'PhD', 163509.29, 151.84, 'Female', '1992-02-28', 'https://randomuser.me/api/portraits/women/100.jpg', 'Civil Engineer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.kaur.246@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Kaur', 'High School', 119026.32, 167.51, 'Female', '1996-11-24', 'https://randomuser.me/api/portraits/women/87.jpg', 'Doctor', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.jain.247@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Jain', 'High School', 184634.18, 160.76, 'Female', '1980-03-23', 'https://randomuser.me/api/portraits/women/18.jpg', 'Business Owner', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.rodrigues.248@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Rodrigues', 'Bachelors', 109666.21, 184.88, 'Male', '1998-06-03', 'https://randomuser.me/api/portraits/men/59.jpg', 'Pharmacist', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('grace.xavier.249@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Grace', 'Xavier', 'Masters', 62804.67, 174.31, 'Female', '2004-04-08', 'https://randomuser.me/api/portraits/women/4.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.lama.250@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Lama', 'High School', 46182.85, 183.84, 'Male', '1987-10-04', 'https://randomuser.me/api/portraits/men/81.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sandeep.brar.251@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sandeep', 'Brar', 'Bachelors', 99526.07, 172.44, 'Female', '1986-05-09', 'https://randomuser.me/api/portraits/women/28.jpg', 'Teacher', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rahul.joshi.252@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rahul', 'Joshi', 'PhD', 134370.68, 183.62, 'Male', '1994-03-11', 'https://randomuser.me/api/portraits/men/18.jpg', 'Business Owner', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aadhya.verma.253@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aadhya', 'Verma', 'High School', 176602.38, 155.26, 'Female', '1992-01-01', 'https://randomuser.me/api/portraits/women/94.jpg', 'Lawyer', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rachel.rodrigues.254@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rachel', 'Rodrigues', 'High School', 141156.13, 155.45, 'Female', '2003-07-25', 'https://randomuser.me/api/portraits/women/25.jpg', 'Teacher', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khadija.ali.255@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khadija', 'Ali', 'Bachelors', 161431.45, 174.2, 'Female', '1992-07-22', 'https://randomuser.me/api/portraits/women/42.jpg', 'Doctor', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('martha.d''souza.256@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Martha', 'D''Souza', 'PhD', 184800.29, 159.95, 'Female', '1992-03-20', 'https://randomuser.me/api/portraits/women/52.jpg', 'Teacher', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.bhutia.257@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Bhutia', 'Masters', 82310.24, 179.9, 'Male', '1989-06-15', 'https://randomuser.me/api/portraits/men/46.jpg', 'Teacher', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.patel.258@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Patel', 'PhD', 87068.88, 163.86, 'Male', '1984-10-27', 'https://randomuser.me/api/portraits/men/35.jpg', 'Software Engineer', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rohan.desai.259@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rohan', 'Desai', 'Bachelors', 135026.98, 186.38, 'Male', '1981-06-20', 'https://randomuser.me/api/portraits/men/29.jpg', 'Lawyer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.verma.260@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Verma', 'Masters', 70192.72, 157.91, 'Female', '1993-03-28', 'https://randomuser.me/api/portraits/women/67.jpg', 'Marketing Manager', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.agarwal.261@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Agarwal', 'High School', 189698.33, 158.32, 'Female', '1995-12-21', 'https://randomuser.me/api/portraits/women/27.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.bhutia.262@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Bhutia', 'Bachelors', 161156.09, 161.03, 'Female', '1988-12-06', 'https://randomuser.me/api/portraits/women/86.jpg', 'Business Owner', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ishaan.reddy.263@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ishaan', 'Reddy', 'PhD', 121347.95, 167.45, 'Male', '1989-03-26', 'https://randomuser.me/api/portraits/men/18.jpg', 'Sales Executive', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.tamang.264@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Tamang', 'Masters', 51976.0, 182.28, 'Male', '1994-05-26', 'https://randomuser.me/api/portraits/men/53.jpg', 'Sales Executive', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurpreet.gill.265@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurpreet', 'Gill', 'Bachelors', 180253.24, 176.63, 'Male', '1986-01-13', 'https://randomuser.me/api/portraits/men/57.jpg', 'Nurse', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sandhu.266@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sandhu', 'Masters', 47910.14, 170.75, 'Male', '2002-09-19', 'https://randomuser.me/api/portraits/men/98.jpg', 'Marketing Manager', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navya.nair.267@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navya', 'Nair', 'Bachelors', 139472.8, 170.13, 'Female', '1991-04-22', 'https://randomuser.me/api/portraits/women/97.jpg', 'Data Analyst', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sandhu.268@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sandhu', 'Bachelors', 122045.94, 184.9, 'Male', '1999-03-02', 'https://randomuser.me/api/portraits/men/31.jpg', 'Nurse', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.porwal.269@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Porwal', 'PhD', 33185.49, 153.3, 'Female', '1983-01-07', 'https://randomuser.me/api/portraits/women/22.jpg', 'Teacher', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aadhya.verma.270@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aadhya', 'Verma', 'PhD', 141602.15, 169.05, 'Female', '2001-01-20', 'https://randomuser.me/api/portraits/women/11.jpg', 'Banker', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rayan.syed.271@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rayan', 'Syed', 'PhD', 78105.78, 182.76, 'Male', '1990-10-26', 'https://randomuser.me/api/portraits/men/5.jpg', 'Architect', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yusuf.syed.272@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yusuf', 'Syed', 'Bachelors', 76479.52, 164.18, 'Male', '1981-02-10', 'https://randomuser.me/api/portraits/men/58.jpg', 'Teacher', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.sandhu.273@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Sandhu', 'PhD', 92319.97, 182.52, 'Male', '2002-04-07', 'https://randomuser.me/api/portraits/men/20.jpg', 'Pharmacist', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sana.sheikh.274@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sana', 'Sheikh', 'PhD', 53911.02, 165.81, 'Female', '1989-10-28', 'https://randomuser.me/api/portraits/women/54.jpg', 'Sales Executive', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('varun.reddy.275@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Varun', 'Reddy', 'PhD', 113373.05, 184.26, 'Male', '1994-08-03', 'https://randomuser.me/api/portraits/men/3.jpg', 'Teacher', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.singh.276@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Singh', 'Bachelors', 84203.83, 151.21, 'Female', '1993-06-20', 'https://randomuser.me/api/portraits/women/39.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.sidhu.277@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Sidhu', 'Masters', 132315.96, 160.18, 'Female', '1984-11-25', 'https://randomuser.me/api/portraits/women/86.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.tamang.278@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Tamang', 'Bachelors', 114394.19, 150.86, 'Female', '1984-03-10', 'https://randomuser.me/api/portraits/women/51.jpg', 'Teacher', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.fernandes.279@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'Fernandes', 'PhD', 43341.05, 169.52, 'Female', '2004-11-15', 'https://randomuser.me/api/portraits/women/64.jpg', 'Nurse', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.agarwal.280@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Agarwal', 'High School', 199736.72, 159.64, 'Female', '1984-02-27', 'https://randomuser.me/api/portraits/women/60.jpg', 'Designer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('inaya.ahmed.281@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Inaya', 'Ahmed', 'PhD', 91468.11, 166.37, 'Female', '1995-05-23', 'https://randomuser.me/api/portraits/women/41.jpg', 'Architect', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.jain.282@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Jain', 'High School', 191805.56, 157.55, 'Female', '1985-06-09', 'https://randomuser.me/api/portraits/women/41.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kiranpreet.dhillon.283@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kiranpreet', 'Dhillon', 'Bachelors', 137070.42, 161.24, 'Female', '2002-01-13', 'https://randomuser.me/api/portraits/women/67.jpg', 'Consultant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.singh.284@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Singh', 'Bachelors', 75550.47, 153.24, 'Female', '1985-07-18', 'https://randomuser.me/api/portraits/women/87.jpg', 'Marketing Manager', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.dhillon.285@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Dhillon', 'PhD', 73472.43, 163.47, 'Female', '1992-05-07', 'https://randomuser.me/api/portraits/women/3.jpg', 'Teacher', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bilal.sheikh.286@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bilal', 'Sheikh', 'High School', 110934.63, 189.56, 'Male', '1987-07-02', 'https://randomuser.me/api/portraits/men/30.jpg', 'Consultant', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.syed.287@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Syed', 'PhD', 192175.25, 170.57, 'Male', '1982-12-01', 'https://randomuser.me/api/portraits/men/39.jpg', 'Architect', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jennifer.fernandes.288@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jennifer', 'Fernandes', 'Masters', 180913.71, 161.96, 'Female', '1996-11-24', 'https://randomuser.me/api/portraits/women/87.jpg', 'Data Analyst', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('priya.thomas.289@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Priya', 'Thomas', 'PhD', 49066.14, 150.48, 'Female', '1993-01-07', 'https://randomuser.me/api/portraits/women/92.jpg', 'Pharmacist', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.agarwal.290@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Agarwal', 'Bachelors', 52885.07, 157.03, 'Female', '1982-01-12', 'https://randomuser.me/api/portraits/women/97.jpg', 'Nurse', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amir.ali.291@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amir', 'Ali', 'High School', 154677.73, 189.5, 'Male', '1994-03-20', 'https://randomuser.me/api/portraits/men/98.jpg', 'Sales Executive', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.sidhu.292@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Sidhu', 'PhD', 54591.47, 172.54, 'Male', '1997-01-24', 'https://randomuser.me/api/portraits/men/11.jpg', 'Accountant', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.d''souza.293@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'D''Souza', 'High School', 111733.87, 161.43, 'Female', '1988-03-23', 'https://randomuser.me/api/portraits/women/2.jpg', 'Business Owner', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.sandhu.294@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Sandhu', 'Bachelors', 82903.4, 160.91, 'Male', '1993-02-18', 'https://randomuser.me/api/portraits/men/63.jpg', 'Data Analyst', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arhan.ansari.295@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arhan', 'Ansari', 'Bachelors', 117477.34, 173.52, 'Male', '1985-05-22', 'https://randomuser.me/api/portraits/men/12.jpg', 'Architect', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('andrew.pereira.296@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Andrew', 'Pereira', 'Masters', 174581.65, 179.32, 'Male', '1994-06-27', 'https://randomuser.me/api/portraits/men/90.jpg', 'Software Engineer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jennifer.fernandes.297@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jennifer', 'Fernandes', 'Bachelors', 125578.34, 157.21, 'Female', '2004-07-21', 'https://randomuser.me/api/portraits/women/46.jpg', 'Nurse', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.gill.298@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Gill', 'Bachelors', 123209.93, 159.23, 'Female', '1988-03-19', 'https://randomuser.me/api/portraits/women/9.jpg', 'Chef', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.lama.299@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Lama', 'Bachelors', 65443.7, 182.28, 'Male', '1989-03-02', 'https://randomuser.me/api/portraits/men/69.jpg', 'Pharmacist', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('andrew.d''souza.300@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Andrew', 'D''Souza', 'PhD', 69986.09, 183.09, 'Male', '1996-10-23', 'https://randomuser.me/api/portraits/men/64.jpg', 'Teacher', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.sandhu.301@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Sandhu', 'High School', 30118.04, 159.48, 'Female', '1987-02-25', 'https://randomuser.me/api/portraits/women/91.jpg', 'Civil Engineer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ibrahim.syed.302@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ibrahim', 'Syed', 'Masters', 198870.12, 184.92, 'Male', '1985-05-24', 'https://randomuser.me/api/portraits/men/43.jpg', 'Chef', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sarah.pereira.303@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sarah', 'Pereira', 'High School', 172254.09, 166.74, 'Female', '1993-02-28', 'https://randomuser.me/api/portraits/women/84.jpg', 'Consultant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('samuel.rodrigues.304@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Samuel', 'Rodrigues', 'PhD', 189550.33, 167.73, 'Male', '1998-04-09', 'https://randomuser.me/api/portraits/men/35.jpg', 'Data Analyst', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.bhutia.305@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Bhutia', 'Bachelors', 75835.24, 167.0, 'Male', '1994-02-12', 'https://randomuser.me/api/portraits/men/49.jpg', 'Nurse', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.khan.306@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Khan', 'High School', 127719.38, 160.58, 'Male', '2003-06-23', 'https://randomuser.me/api/portraits/men/93.jpg', 'Banker', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('joseph.pereira.307@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Joseph', 'Pereira', 'Bachelors', 169822.13, 187.95, 'Male', '1998-03-14', 'https://randomuser.me/api/portraits/men/49.jpg', 'Chef', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.singh.308@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Singh', 'Bachelors', 137876.39, 174.99, 'Female', '1983-01-19', 'https://randomuser.me/api/portraits/women/84.jpg', 'Entrepreneur', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.lama.309@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Lama', 'PhD', 135099.52, 156.25, 'Female', '2000-04-13', 'https://randomuser.me/api/portraits/women/27.jpg', 'Doctor', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aaradhya.iyer.310@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aaradhya', 'Iyer', 'Masters', 114271.65, 162.41, 'Female', '1990-09-04', 'https://randomuser.me/api/portraits/women/75.jpg', 'Pharmacist', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.jain.311@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Jain', 'Bachelors', 92792.32, 154.64, 'Female', '1983-07-21', 'https://randomuser.me/api/portraits/women/98.jpg', 'Sales Executive', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.sharma.312@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Sharma', 'PhD', 134048.91, 151.17, 'Female', '1984-12-05', 'https://randomuser.me/api/portraits/women/35.jpg', 'Nurse', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('varun.joshi.313@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Varun', 'Joshi', 'Masters', 136626.71, 174.49, 'Male', '1990-06-27', 'https://randomuser.me/api/portraits/men/33.jpg', 'Doctor', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.bhutia.314@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Bhutia', 'PhD', 36424.73, 187.03, 'Male', '1997-11-12', 'https://randomuser.me/api/portraits/men/95.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.brar.315@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Brar', 'High School', 170861.88, 170.76, 'Female', '1981-06-16', 'https://randomuser.me/api/portraits/women/79.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.shah.316@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Shah', 'Masters', 193154.31, 166.31, 'Male', '1999-06-08', 'https://randomuser.me/api/portraits/men/61.jpg', 'Sales Executive', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.iyer.317@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Iyer', 'High School', 38542.34, 162.0, 'Female', '2002-12-28', 'https://randomuser.me/api/portraits/women/28.jpg', 'Lawyer', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.khan.318@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Khan', 'PhD', 140641.26, 169.77, 'Female', '1985-10-14', 'https://randomuser.me/api/portraits/women/78.jpg', 'Entrepreneur', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karthik.nair.319@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karthik', 'Nair', 'High School', 116107.83, 180.39, 'Male', '1985-01-03', 'https://randomuser.me/api/portraits/men/43.jpg', 'Data Analyst', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.tamang.320@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Tamang', 'Masters', 41099.3, 161.83, 'Female', '1988-12-11', 'https://randomuser.me/api/portraits/women/25.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.gurung.321@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Gurung', 'PhD', 178366.61, 155.7, 'Female', '2004-01-17', 'https://randomuser.me/api/portraits/women/91.jpg', 'Business Owner', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.sidhu.322@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Sidhu', 'PhD', 182107.16, 162.54, 'Female', '1999-04-01', 'https://randomuser.me/api/portraits/women/28.jpg', 'Accountant', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.oswal.323@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Oswal', 'Bachelors', 58963.96, 161.09, 'Female', '1982-02-01', 'https://randomuser.me/api/portraits/women/87.jpg', 'Accountant', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.shah.324@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Shah', 'Bachelors', 150848.75, 170.91, 'Female', '1992-05-23', 'https://randomuser.me/api/portraits/women/71.jpg', 'Accountant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('benjamin.fernandes.325@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Benjamin', 'Fernandes', 'Masters', 60648.79, 173.49, 'Male', '2002-04-20', 'https://randomuser.me/api/portraits/men/36.jpg', 'Designer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sandeep.dhillon.326@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sandeep', 'Dhillon', 'Bachelors', 190120.88, 169.93, 'Female', '1985-04-17', 'https://randomuser.me/api/portraits/women/17.jpg', 'Doctor', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayesha.khan.327@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayesha', 'Khan', 'Masters', 109412.19, 161.82, 'Female', '1981-01-05', 'https://randomuser.me/api/portraits/women/90.jpg', 'Doctor', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('luke.rodrigues.328@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Luke', 'Rodrigues', 'High School', 63631.11, 183.19, 'Male', '1987-07-13', 'https://randomuser.me/api/portraits/men/86.jpg', 'Doctor', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.oswal.329@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Oswal', 'High School', 130323.34, 173.3, 'Female', '1992-10-27', 'https://randomuser.me/api/portraits/women/28.jpg', 'Marketing Manager', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.gomes.330@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'Gomes', 'Masters', 39080.45, 161.54, 'Female', '2002-08-02', 'https://randomuser.me/api/portraits/women/28.jpg', 'Software Engineer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.agarwal.331@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Agarwal', 'Masters', 188869.33, 168.43, 'Male', '1990-01-09', 'https://randomuser.me/api/portraits/men/46.jpg', 'Data Analyst', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.jain.332@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Jain', 'Masters', 185345.08, 166.95, 'Female', '1984-04-21', 'https://randomuser.me/api/portraits/women/73.jpg', 'Designer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('james.d''souza.333@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('James', 'D''Souza', 'Masters', 69746.79, 170.77, 'Male', '1981-11-11', 'https://randomuser.me/api/portraits/men/51.jpg', 'Lawyer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('nikhil.gupta.334@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Nikhil', 'Gupta', 'High School', 187968.82, 167.92, 'Male', '1985-01-09', 'https://randomuser.me/api/portraits/men/56.jpg', 'Sales Executive', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.oswal.335@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Oswal', 'Masters', 48135.72, 150.01, 'Female', '1995-09-13', 'https://randomuser.me/api/portraits/women/13.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.sherpa.336@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Sherpa', 'Masters', 102633.36, 166.95, 'Male', '1984-10-06', 'https://randomuser.me/api/portraits/men/11.jpg', 'Accountant', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.bhutia.337@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Bhutia', 'High School', 88677.58, 162.62, 'Male', '2002-08-21', 'https://randomuser.me/api/portraits/men/24.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.agarwal.338@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Agarwal', 'Bachelors', 62668.1, 152.73, 'Female', '2004-10-15', 'https://randomuser.me/api/portraits/women/75.jpg', 'Data Analyst', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.agarwal.339@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Agarwal', 'High School', 168267.56, 179.4, 'Male', '2003-02-01', 'https://randomuser.me/api/portraits/men/41.jpg', 'Sales Executive', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayaan.syed.340@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayaan', 'Syed', 'PhD', 160639.38, 167.45, 'Male', '1998-07-04', 'https://randomuser.me/api/portraits/men/3.jpg', 'Marketing Manager', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.bhutia.341@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Bhutia', 'PhD', 184867.47, 171.74, 'Female', '1997-02-27', 'https://randomuser.me/api/portraits/women/48.jpg', 'Architect', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('grace.d''souza.342@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Grace', 'D''Souza', 'PhD', 44647.36, 150.15, 'Female', '2002-11-19', 'https://randomuser.me/api/portraits/women/97.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.hassan.343@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Hassan', 'High School', 146054.69, 164.68, 'Female', '1990-06-18', 'https://randomuser.me/api/portraits/women/51.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.lama.344@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Lama', 'Bachelors', 55754.27, 174.0, 'Female', '2002-07-02', 'https://randomuser.me/api/portraits/women/48.jpg', 'Consultant', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.jain.345@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Jain', 'Bachelors', 88108.14, 175.94, 'Male', '1981-06-02', 'https://randomuser.me/api/portraits/men/92.jpg', 'Data Analyst', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.lama.346@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Lama', 'Masters', 121346.08, 166.55, 'Female', '1994-12-02', 'https://randomuser.me/api/portraits/women/80.jpg', 'Civil Engineer', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mary.xavier.347@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mary', 'Xavier', 'High School', 97988.46, 160.49, 'Female', '1994-05-05', 'https://randomuser.me/api/portraits/women/37.jpg', 'Chef', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('noor.hussain.348@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Noor', 'Hussain', 'PhD', 43659.19, 172.03, 'Female', '1993-03-08', 'https://randomuser.me/api/portraits/women/40.jpg', 'Entrepreneur', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.sheikh.349@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Sheikh', 'PhD', 141844.6, 162.72, 'Female', '2000-01-06', 'https://randomuser.me/api/portraits/women/45.jpg', 'Accountant', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.agarwal.350@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Agarwal', 'Bachelors', 37090.21, 185.67, 'Male', '1997-05-20', 'https://randomuser.me/api/portraits/men/97.jpg', 'Business Owner', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('akash.patel.351@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Akash', 'Patel', 'High School', 51581.41, 189.94, 'Male', '1989-02-26', 'https://randomuser.me/api/portraits/men/95.jpg', 'Consultant', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.grewal.352@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Grewal', 'Masters', 37607.47, 173.96, 'Female', '1988-02-05', 'https://randomuser.me/api/portraits/women/29.jpg', 'Consultant', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dolma.tamang.353@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dolma', 'Tamang', 'PhD', 145547.95, 158.94, 'Female', '1989-06-12', 'https://randomuser.me/api/portraits/women/59.jpg', 'Sales Executive', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.khan.354@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Khan', 'Bachelors', 143678.03, 178.7, 'Male', '2003-05-27', 'https://randomuser.me/api/portraits/men/64.jpg', 'Business Owner', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.malik.355@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Malik', 'PhD', 104308.42, 161.55, 'Female', '1987-01-28', 'https://randomuser.me/api/portraits/women/13.jpg', 'Sales Executive', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.hussain.356@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Hussain', 'PhD', 143401.39, 181.52, 'Male', '2002-10-08', 'https://randomuser.me/api/portraits/men/17.jpg', 'Sales Executive', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.fernandes.357@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Fernandes', 'Masters', 167874.46, 179.43, 'Male', '1992-11-04', 'https://randomuser.me/api/portraits/men/76.jpg', 'Banker', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayesha.ansari.358@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayesha', 'Ansari', 'PhD', 190185.45, 153.63, 'Female', '2002-02-25', 'https://randomuser.me/api/portraits/women/100.jpg', 'Teacher', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.gurung.359@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Gurung', 'Bachelors', 192335.63, 188.35, 'Male', '1991-11-04', 'https://randomuser.me/api/portraits/men/25.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.sidhu.360@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Sidhu', 'PhD', 65064.04, 162.1, 'Female', '1987-10-21', 'https://randomuser.me/api/portraits/women/90.jpg', 'Marketing Manager', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.dhillon.361@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Dhillon', 'Bachelors', 162925.14, 165.39, 'Female', '1994-01-04', 'https://randomuser.me/api/portraits/women/88.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.porwal.362@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Porwal', 'High School', 46051.97, 171.34, 'Female', '1986-01-04', 'https://randomuser.me/api/portraits/women/8.jpg', 'Entrepreneur', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.oswal.363@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Oswal', 'Masters', 45658.28, 178.87, 'Male', '1994-03-04', 'https://randomuser.me/api/portraits/men/70.jpg', 'Business Owner', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zainab.ansari.364@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zainab', 'Ansari', 'Masters', 79110.15, 158.39, 'Female', '1990-02-13', 'https://randomuser.me/api/portraits/women/33.jpg', 'Architect', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.khan.365@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Khan', 'High School', 185736.16, 170.02, 'Male', '1999-08-22', 'https://randomuser.me/api/portraits/men/39.jpg', 'Designer', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.gill.366@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Gill', 'High School', 134164.7, 158.89, 'Female', '1997-05-25', 'https://randomuser.me/api/portraits/women/21.jpg', 'Lawyer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('daniel.thomas.367@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Daniel', 'Thomas', 'High School', 107172.99, 186.41, 'Male', '1995-07-17', 'https://randomuser.me/api/portraits/men/32.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.oswal.368@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Oswal', 'High School', 124171.31, 177.86, 'Male', '1990-09-20', 'https://randomuser.me/api/portraits/men/100.jpg', 'Architect', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.tamang.369@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Tamang', 'PhD', 37297.79, 166.1, 'Female', '1980-05-23', 'https://randomuser.me/api/portraits/women/58.jpg', 'Sales Executive', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.singh.370@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Singh', 'Masters', 178301.48, 183.2, 'Male', '1983-05-01', 'https://randomuser.me/api/portraits/men/43.jpg', 'Entrepreneur', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('abdullah.sheikh.371@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Abdullah', 'Sheikh', 'PhD', 148243.98, 172.87, 'Male', '1985-07-26', 'https://randomuser.me/api/portraits/men/4.jpg', 'Designer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zain.ali.372@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zain', 'Ali', 'Bachelors', 66857.18, 184.87, 'Male', '2000-09-19', 'https://randomuser.me/api/portraits/men/18.jpg', 'Data Analyst', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.agarwal.373@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Agarwal', 'Bachelors', 61569.33, 172.96, 'Female', '2003-09-27', 'https://randomuser.me/api/portraits/women/84.jpg', 'Marketing Manager', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('luke.rodrigues.374@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Luke', 'Rodrigues', 'PhD', 125507.11, 160.44, 'Male', '1983-03-23', 'https://randomuser.me/api/portraits/men/43.jpg', 'Accountant', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('grace.d''souza.375@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Grace', 'D''Souza', 'High School', 136806.06, 160.35, 'Female', '2000-05-26', 'https://randomuser.me/api/portraits/women/39.jpg', 'Teacher', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zain.ahmed.376@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zain', 'Ahmed', 'PhD', 131657.7, 176.97, 'Male', '2000-01-03', 'https://randomuser.me/api/portraits/men/27.jpg', 'Accountant', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michael.thomas.377@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michael', 'Thomas', 'PhD', 132224.41, 182.17, 'Male', '2001-03-28', 'https://randomuser.me/api/portraits/men/80.jpg', 'Designer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.gurung.378@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Gurung', 'High School', 81406.19, 165.25, 'Female', '2004-10-28', 'https://randomuser.me/api/portraits/women/49.jpg', 'Marketing Manager', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.desai.379@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Desai', 'Masters', 66702.2, 158.85, 'Female', '1996-04-22', 'https://randomuser.me/api/portraits/women/95.jpg', 'Accountant', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zara.syed.380@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zara', 'Syed', 'High School', 181955.69, 159.41, 'Female', '1983-10-26', 'https://randomuser.me/api/portraits/women/83.jpg', 'Teacher', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('varun.reddy.381@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Varun', 'Reddy', 'High School', 199543.67, 167.58, 'Male', '2004-04-10', 'https://randomuser.me/api/portraits/men/6.jpg', 'Entrepreneur', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rayan.ansari.382@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rayan', 'Ansari', 'High School', 109435.86, 173.88, 'Male', '1994-08-10', 'https://randomuser.me/api/portraits/men/51.jpg', 'Nurse', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.gurung.383@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Gurung', 'PhD', 122843.14, 166.54, 'Male', '1985-03-06', 'https://randomuser.me/api/portraits/men/51.jpg', 'Civil Engineer', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.bhutia.384@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Bhutia', 'High School', 109694.06, 173.54, 'Male', '1986-10-09', 'https://randomuser.me/api/portraits/men/37.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.jain.385@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Jain', 'PhD', 196481.82, 171.16, 'Female', '1991-06-01', 'https://randomuser.me/api/portraits/women/55.jpg', 'Marketing Manager', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ruth.fernandes.386@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ruth', 'Fernandes', 'Bachelors', 106433.5, 153.26, 'Female', '1995-09-07', 'https://randomuser.me/api/portraits/women/62.jpg', 'Consultant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.oswal.387@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Oswal', 'Bachelors', 147068.62, 174.03, 'Male', '1982-05-27', 'https://randomuser.me/api/portraits/men/100.jpg', 'Civil Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('akash.verma.388@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Akash', 'Verma', 'High School', 150653.94, 166.14, 'Male', '2003-11-23', 'https://randomuser.me/api/portraits/men/23.jpg', 'Architect', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.oswal.389@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Oswal', 'Bachelors', 105828.21, 170.1, 'Female', '1980-09-24', 'https://randomuser.me/api/portraits/women/23.jpg', 'Doctor', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.jain.390@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Jain', 'Bachelors', 90265.98, 165.49, 'Female', '1992-10-27', 'https://randomuser.me/api/portraits/women/36.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.hussain.391@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Hussain', 'Masters', 165483.02, 161.95, 'Female', '1990-12-27', 'https://randomuser.me/api/portraits/women/84.jpg', 'Designer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.bhutia.392@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Bhutia', 'High School', 170579.78, 175.49, 'Male', '1985-12-16', 'https://randomuser.me/api/portraits/men/61.jpg', 'Architect', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.oswal.393@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Oswal', 'PhD', 74065.89, 150.67, 'Female', '1996-08-18', 'https://randomuser.me/api/portraits/women/68.jpg', 'Accountant', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.singh.394@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Singh', 'Masters', 127273.08, 172.87, 'Female', '1993-02-24', 'https://randomuser.me/api/portraits/women/7.jpg', 'Software Engineer', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zainab.khan.395@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zainab', 'Khan', 'High School', 184311.51, 157.09, 'Female', '1982-03-16', 'https://randomuser.me/api/portraits/women/58.jpg', 'Sales Executive', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pari.reddy.396@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pari', 'Reddy', 'PhD', 69160.32, 159.34, 'Female', '1981-07-06', 'https://randomuser.me/api/portraits/women/50.jpg', 'Nurse', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.oswal.397@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Oswal', 'Bachelors', 104552.94, 172.81, 'Female', '1987-10-01', 'https://randomuser.me/api/portraits/women/95.jpg', 'Banker', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ruth.d''souza.398@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ruth', 'D''Souza', 'Bachelors', 169639.28, 151.09, 'Female', '2000-01-23', 'https://randomuser.me/api/portraits/women/51.jpg', 'Sales Executive', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.bhutia.399@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Bhutia', 'PhD', 153319.31, 154.59, 'Female', '2003-01-27', 'https://randomuser.me/api/portraits/women/10.jpg', 'Marketing Manager', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.ahmed.400@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Ahmed', 'High School', 67625.56, 170.19, 'Male', '1992-06-23', 'https://randomuser.me/api/portraits/men/89.jpg', 'Marketing Manager', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurpreet.sandhu.401@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurpreet', 'Sandhu', 'Bachelors', 70426.01, 185.85, 'Male', '2001-11-19', 'https://randomuser.me/api/portraits/men/83.jpg', 'Banker', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ishita.nair.402@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ishita', 'Nair', 'Bachelors', 120220.57, 151.84, 'Female', '1988-05-23', 'https://randomuser.me/api/portraits/women/38.jpg', 'Teacher', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rachel.gomes.403@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rachel', 'Gomes', 'Bachelors', 53146.09, 154.69, 'Female', '2000-09-09', 'https://randomuser.me/api/portraits/women/78.jpg', 'Pharmacist', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.gomes.404@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Gomes', 'Masters', 100836.69, 173.16, 'Male', '1987-07-14', 'https://randomuser.me/api/portraits/men/69.jpg', 'Civil Engineer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mariam.sheikh.405@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mariam', 'Sheikh', 'Masters', 117556.33, 162.24, 'Female', '1999-07-20', 'https://randomuser.me/api/portraits/women/72.jpg', 'Civil Engineer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pari.sharma.406@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pari', 'Sharma', 'Bachelors', 44280.47, 163.39, 'Female', '1996-08-18', 'https://randomuser.me/api/portraits/women/18.jpg', 'Business Owner', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.sandhu.407@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Sandhu', 'High School', 110210.24, 166.86, 'Female', '1985-11-27', 'https://randomuser.me/api/portraits/women/22.jpg', 'Data Analyst', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('john.gomes.408@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('John', 'Gomes', 'Bachelors', 140943.3, 169.29, 'Male', '1993-06-25', 'https://randomuser.me/api/portraits/men/41.jpg', 'Pharmacist', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arnav.patel.409@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arnav', 'Patel', 'High School', 43830.39, 172.52, 'Male', '1997-11-18', 'https://randomuser.me/api/portraits/men/54.jpg', 'Entrepreneur', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.sidhu.410@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Sidhu', 'PhD', 163117.84, 165.5, 'Female', '1985-05-05', 'https://randomuser.me/api/portraits/women/54.jpg', 'Accountant', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.sharma.411@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Sharma', 'Bachelors', 40070.01, 174.57, 'Male', '1993-01-11', 'https://randomuser.me/api/portraits/men/46.jpg', 'Consultant', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.fernandes.412@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'Fernandes', 'Bachelors', 84996.4, 174.22, 'Female', '1986-11-28', 'https://randomuser.me/api/portraits/women/48.jpg', 'Software Engineer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ahmed.ahmed.413@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ahmed', 'Ahmed', 'Bachelors', 60423.58, 189.46, 'Male', '1982-07-11', 'https://randomuser.me/api/portraits/men/45.jpg', 'Architect', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ibrahim.hassan.414@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ibrahim', 'Hassan', 'Bachelors', 148427.82, 165.71, 'Male', '1983-02-12', 'https://randomuser.me/api/portraits/men/82.jpg', 'Doctor', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.ahmed.415@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Ahmed', 'PhD', 125587.62, 180.64, 'Male', '2000-10-21', 'https://randomuser.me/api/portraits/men/100.jpg', 'Designer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.tamang.416@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Tamang', 'High School', 60773.35, 183.24, 'Male', '1983-09-14', 'https://randomuser.me/api/portraits/men/38.jpg', 'Architect', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.lama.417@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Lama', 'High School', 43359.37, 172.35, 'Female', '1999-06-23', 'https://randomuser.me/api/portraits/women/5.jpg', 'Software Engineer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('abdullah.ali.418@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Abdullah', 'Ali', 'Bachelors', 87668.19, 171.42, 'Male', '1996-05-10', 'https://randomuser.me/api/portraits/men/11.jpg', 'Entrepreneur', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.oswal.419@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Oswal', 'High School', 67092.31, 188.49, 'Male', '1994-12-18', 'https://randomuser.me/api/portraits/men/66.jpg', 'Software Engineer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.kaur.420@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Kaur', 'Bachelors', 179342.05, 160.39, 'Female', '2001-10-08', 'https://randomuser.me/api/portraits/women/4.jpg', 'Nurse', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('priya.rodrigues.421@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Priya', 'Rodrigues', 'PhD', 196612.6, 157.74, 'Female', '1995-12-14', 'https://randomuser.me/api/portraits/women/7.jpg', 'Sales Executive', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.verma.422@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Verma', 'High School', 108653.49, 150.73, 'Female', '1997-02-16', 'https://randomuser.me/api/portraits/women/92.jpg', 'Consultant', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.porwal.423@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Porwal', 'Masters', 168159.12, 160.04, 'Male', '2000-08-26', 'https://randomuser.me/api/portraits/men/49.jpg', 'Banker', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.jain.424@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Jain', 'PhD', 89594.14, 163.53, 'Female', '1999-12-18', 'https://randomuser.me/api/portraits/women/49.jpg', 'Teacher', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.jain.425@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Jain', 'Masters', 144792.97, 168.53, 'Male', '2003-08-09', 'https://randomuser.me/api/portraits/men/76.jpg', 'Civil Engineer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.dhillon.426@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Dhillon', 'Masters', 128249.3, 161.92, 'Female', '1988-04-05', 'https://randomuser.me/api/portraits/women/7.jpg', 'Teacher', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.porwal.427@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Porwal', 'High School', 106789.43, 166.94, 'Male', '1986-01-07', 'https://randomuser.me/api/portraits/men/81.jpg', 'Pharmacist', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yasmin.sheikh.428@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yasmin', 'Sheikh', 'Masters', 52686.41, 160.44, 'Female', '2002-08-14', 'https://randomuser.me/api/portraits/women/74.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.singh.429@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Singh', 'High School', 159318.68, 170.26, 'Male', '1992-12-07', 'https://randomuser.me/api/portraits/men/93.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.tamang.430@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Tamang', 'High School', 179945.64, 177.39, 'Male', '2003-12-13', 'https://randomuser.me/api/portraits/men/91.jpg', 'Lawyer', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('benjamin.pereira.431@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Benjamin', 'Pereira', 'Masters', 193370.09, 175.34, 'Male', '1993-08-21', 'https://randomuser.me/api/portraits/men/7.jpg', 'Architect', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navdeep.brar.432@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navdeep', 'Brar', 'High School', 37139.32, 171.55, 'Male', '1990-06-25', 'https://randomuser.me/api/portraits/men/30.jpg', 'Chef', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.khan.433@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Khan', 'Bachelors', 173135.5, 182.99, 'Male', '2002-05-28', 'https://randomuser.me/api/portraits/men/24.jpg', 'Software Engineer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.khan.434@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Khan', 'Bachelors', 176544.38, 155.71, 'Female', '1990-11-16', 'https://randomuser.me/api/portraits/women/40.jpg', 'Sales Executive', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yasmin.ansari.435@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yasmin', 'Ansari', 'High School', 36434.3, 158.09, 'Female', '2000-12-06', 'https://randomuser.me/api/portraits/women/87.jpg', 'Designer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.sherpa.436@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Sherpa', 'PhD', 131703.41, 188.3, 'Male', '1999-02-09', 'https://randomuser.me/api/portraits/men/50.jpg', 'Teacher', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('david.pereira.437@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('David', 'Pereira', 'Masters', 65509.27, 165.36, 'Male', '1990-05-17', 'https://randomuser.me/api/portraits/men/21.jpg', 'Consultant', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sidhu.438@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sidhu', 'Bachelors', 44041.16, 169.18, 'Female', '1986-03-07', 'https://randomuser.me/api/portraits/women/40.jpg', 'Consultant', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rudra.singh.439@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rudra', 'Singh', 'High School', 37751.83, 177.63, 'Male', '2001-02-02', 'https://randomuser.me/api/portraits/men/53.jpg', 'Entrepreneur', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.khan.440@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Khan', 'High School', 74440.13, 176.64, 'Male', '1981-12-10', 'https://randomuser.me/api/portraits/men/38.jpg', 'Lawyer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.nair.441@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Nair', 'Masters', 105935.45, 160.79, 'Female', '1986-06-12', 'https://randomuser.me/api/portraits/women/48.jpg', 'Teacher', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.d''souza.442@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'D''Souza', 'Masters', 167841.8, 179.19, 'Male', '1988-08-15', 'https://randomuser.me/api/portraits/men/16.jpg', 'Consultant', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('martha.fernandes.443@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Martha', 'Fernandes', 'PhD', 184689.4, 155.97, 'Female', '1985-06-08', 'https://randomuser.me/api/portraits/women/40.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lhamo.bhutia.444@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lhamo', 'Bhutia', 'High School', 94796.72, 152.04, 'Female', '1986-12-28', 'https://randomuser.me/api/portraits/women/30.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.porwal.445@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Porwal', 'High School', 151011.6, 152.74, 'Female', '2002-12-16', 'https://randomuser.me/api/portraits/women/63.jpg', 'Accountant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('andrew.thomas.446@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Andrew', 'Thomas', 'High School', 56895.16, 164.7, 'Male', '1997-10-22', 'https://randomuser.me/api/portraits/men/93.jpg', 'Designer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.pereira.447@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Pereira', 'PhD', 141090.18, 180.09, 'Male', '1992-11-27', 'https://randomuser.me/api/portraits/men/41.jpg', 'Architect', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harleen.dhillon.448@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harleen', 'Dhillon', 'Bachelors', 173050.6, 159.89, 'Female', '1992-02-23', 'https://randomuser.me/api/portraits/women/56.jpg', 'Civil Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dolma.lama.449@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dolma', 'Lama', 'PhD', 89485.1, 173.85, 'Female', '1984-12-15', 'https://randomuser.me/api/portraits/women/58.jpg', 'Software Engineer', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.porwal.450@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Porwal', 'High School', 189149.94, 167.88, 'Male', '1991-05-19', 'https://randomuser.me/api/portraits/men/26.jpg', 'Chef', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.jain.451@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Jain', 'Bachelors', 124955.45, 179.23, 'Male', '1985-03-14', 'https://randomuser.me/api/portraits/men/99.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('elizabeth.xavier.452@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Elizabeth', 'Xavier', 'High School', 124919.96, 172.91, 'Female', '1997-12-26', 'https://randomuser.me/api/portraits/women/49.jpg', 'Architect', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.gurung.453@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Gurung', 'Bachelors', 74045.47, 171.19, 'Male', '1999-03-17', 'https://randomuser.me/api/portraits/men/78.jpg', 'Lawyer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.shah.454@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Shah', 'Masters', 123600.48, 157.4, 'Female', '1984-12-16', 'https://randomuser.me/api/portraits/women/5.jpg', 'Doctor', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.reddy.455@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Reddy', 'Bachelors', 181074.19, 184.77, 'Male', '1988-06-06', 'https://randomuser.me/api/portraits/men/74.jpg', 'Entrepreneur', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pari.reddy.456@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pari', 'Reddy', 'Bachelors', 75062.6, 156.42, 'Female', '1983-03-18', 'https://randomuser.me/api/portraits/women/70.jpg', 'Marketing Manager', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ibrahim.ansari.457@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ibrahim', 'Ansari', 'PhD', 104133.91, 167.85, 'Male', '1993-06-17', 'https://randomuser.me/api/portraits/men/90.jpg', 'Banker', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.tamang.458@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Tamang', 'High School', 50147.35, 179.12, 'Male', '2001-05-14', 'https://randomuser.me/api/portraits/men/21.jpg', 'Entrepreneur', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.bhutia.459@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Bhutia', 'Masters', 117556.87, 158.68, 'Female', '1987-03-16', 'https://randomuser.me/api/portraits/women/84.jpg', 'Chef', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.grewal.460@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Grewal', 'Masters', 173076.45, 152.87, 'Female', '1986-07-08', 'https://randomuser.me/api/portraits/women/21.jpg', 'Chef', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paul.gomes.461@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paul', 'Gomes', 'PhD', 73045.82, 184.89, 'Male', '2003-07-11', 'https://randomuser.me/api/portraits/men/56.jpg', 'Business Owner', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.shah.462@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Shah', 'High School', 75960.34, 163.11, 'Female', '1997-12-09', 'https://randomuser.me/api/portraits/women/83.jpg', 'Accountant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.gill.463@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Gill', 'Bachelors', 50683.58, 189.8, 'Male', '1988-02-06', 'https://randomuser.me/api/portraits/men/82.jpg', 'Banker', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navdeep.gill.464@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navdeep', 'Gill', 'PhD', 175704.19, 186.78, 'Male', '1992-05-26', 'https://randomuser.me/api/portraits/men/48.jpg', 'Business Owner', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('susan.thomas.465@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Susan', 'Thomas', 'Bachelors', 135573.89, 150.51, 'Female', '1996-01-20', 'https://randomuser.me/api/portraits/women/83.jpg', 'Consultant', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.tamang.466@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Tamang', 'PhD', 141948.67, 174.62, 'Female', '2000-01-25', 'https://randomuser.me/api/portraits/women/20.jpg', 'Civil Engineer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('taranjot.sandhu.467@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Taranjot', 'Sandhu', 'High School', 129548.07, 171.72, 'Female', '2002-11-23', 'https://randomuser.me/api/portraits/women/85.jpg', 'Designer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rebecca.pereira.468@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rebecca', 'Pereira', 'PhD', 150514.12, 155.37, 'Female', '1981-01-18', 'https://randomuser.me/api/portraits/women/24.jpg', 'Marketing Manager', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.bhutia.469@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Bhutia', 'Masters', 104899.24, 162.67, 'Female', '1995-07-15', 'https://randomuser.me/api/portraits/women/4.jpg', 'Nurse', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.agarwal.470@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Agarwal', 'High School', 155764.91, 171.93, 'Male', '1998-05-24', 'https://randomuser.me/api/portraits/men/25.jpg', 'Entrepreneur', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.lama.471@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Lama', 'PhD', 160522.04, 181.95, 'Male', '1998-05-16', 'https://randomuser.me/api/portraits/men/100.jpg', 'Marketing Manager', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.grewal.472@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Grewal', 'High School', 167217.85, 177.61, 'Male', '1989-11-05', 'https://randomuser.me/api/portraits/men/64.jpg', 'Chef', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.thomas.473@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Thomas', 'High School', 104433.68, 161.28, 'Male', '1986-12-02', 'https://randomuser.me/api/portraits/men/83.jpg', 'Banker', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.fernandes.474@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'Fernandes', 'PhD', 35818.6, 153.12, 'Female', '1983-04-07', 'https://randomuser.me/api/portraits/women/88.jpg', 'Pharmacist', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditi.nair.475@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditi', 'Nair', 'PhD', 199638.52, 170.34, 'Female', '1989-09-09', 'https://randomuser.me/api/portraits/women/47.jpg', 'Business Owner', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.singh.476@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Singh', 'Bachelors', 55157.56, 170.24, 'Female', '2002-01-25', 'https://randomuser.me/api/portraits/women/36.jpg', 'Data Analyst', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.kaur.477@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Kaur', 'PhD', 129544.09, 179.59, 'Male', '2004-04-05', 'https://randomuser.me/api/portraits/men/13.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ruth.rodrigues.478@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ruth', 'Rodrigues', 'High School', 143631.5, 152.88, 'Female', '1987-12-22', 'https://randomuser.me/api/portraits/women/87.jpg', 'Entrepreneur', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.fernandes.479@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Fernandes', 'PhD', 175175.34, 179.62, 'Male', '1986-04-11', 'https://randomuser.me/api/portraits/men/76.jpg', 'Teacher', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.brar.480@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Brar', 'High School', 61756.04, 172.21, 'Female', '2002-04-12', 'https://randomuser.me/api/portraits/women/77.jpg', 'Banker', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('david.xavier.481@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('David', 'Xavier', 'PhD', 124674.39, 169.04, 'Male', '2002-02-16', 'https://randomuser.me/api/portraits/men/60.jpg', 'Accountant', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.tamang.482@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Tamang', 'PhD', 159140.69, 161.43, 'Female', '1996-02-09', 'https://randomuser.me/api/portraits/women/78.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayesha.ansari.483@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayesha', 'Ansari', 'High School', 62078.64, 152.68, 'Female', '1993-01-09', 'https://randomuser.me/api/portraits/women/13.jpg', 'Doctor', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.porwal.484@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Porwal', 'High School', 89683.99, 175.49, 'Male', '1984-02-01', 'https://randomuser.me/api/portraits/men/44.jpg', 'Architect', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.485@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'Bachelors', 120852.51, 167.81, 'Male', '2003-07-24', 'https://randomuser.me/api/portraits/men/86.jpg', 'Lawyer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sidhu.486@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sidhu', 'PhD', 188754.7, 152.98, 'Female', '2000-07-18', 'https://randomuser.me/api/portraits/women/68.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sneha.singh.487@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sneha', 'Singh', 'High School', 175965.08, 156.17, 'Female', '1995-12-03', 'https://randomuser.me/api/portraits/women/37.jpg', 'Data Analyst', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('nisha.nair.488@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Nisha', 'Nair', 'Bachelors', 165694.41, 170.8, 'Female', '2000-06-18', 'https://randomuser.me/api/portraits/women/4.jpg', 'Doctor', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arhan.ali.489@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arhan', 'Ali', 'Masters', 42663.35, 163.87, 'Male', '1997-12-17', 'https://randomuser.me/api/portraits/men/97.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.oswal.490@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Oswal', 'Bachelors', 125143.31, 159.37, 'Female', '1987-03-06', 'https://randomuser.me/api/portraits/women/5.jpg', 'Accountant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sarah.thomas.491@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sarah', 'Thomas', 'Bachelors', 108968.06, 152.42, 'Female', '1980-04-10', 'https://randomuser.me/api/portraits/women/65.jpg', 'Software Engineer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.joshi.492@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Joshi', 'PhD', 181896.74, 174.96, 'Female', '1985-09-05', 'https://randomuser.me/api/portraits/women/37.jpg', 'Doctor', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rayan.hassan.493@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rayan', 'Hassan', 'PhD', 176793.19, 181.81, 'Male', '2001-12-17', 'https://randomuser.me/api/portraits/men/3.jpg', 'Lawyer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jennifer.rodrigues.494@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jennifer', 'Rodrigues', 'Masters', 105424.6, 168.83, 'Female', '1981-08-15', 'https://randomuser.me/api/portraits/women/19.jpg', 'Architect', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.jain.495@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Jain', 'Bachelors', 182773.21, 160.43, 'Female', '1995-12-26', 'https://randomuser.me/api/portraits/women/28.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lhamo.bhutia.496@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lhamo', 'Bhutia', 'High School', 92011.41, 160.26, 'Female', '1991-12-27', 'https://randomuser.me/api/portraits/women/27.jpg', 'Architect', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zainab.ali.497@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zainab', 'Ali', 'PhD', 150874.22, 173.03, 'Female', '1987-11-14', 'https://randomuser.me/api/portraits/women/50.jpg', 'Nurse', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bilal.hussain.498@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bilal', 'Hussain', 'PhD', 83998.87, 163.85, 'Male', '1993-12-14', 'https://randomuser.me/api/portraits/men/91.jpg', 'Business Owner', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.sidhu.499@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Sidhu', 'PhD', 140645.8, 181.68, 'Male', '1994-09-10', 'https://randomuser.me/api/portraits/men/67.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.sidhu.500@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Sidhu', 'High School', 194905.19, 184.28, 'Male', '1982-06-03', 'https://randomuser.me/api/portraits/men/72.jpg', 'Sales Executive', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.gurung.501@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Gurung', 'Masters', 163171.15, 173.19, 'Female', '1990-09-14', 'https://randomuser.me/api/portraits/women/83.jpg', 'Lawyer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.singh.502@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Singh', 'Bachelors', 84435.78, 167.29, 'Male', '1991-06-21', 'https://randomuser.me/api/portraits/men/72.jpg', 'Doctor', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.porwal.503@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Porwal', 'PhD', 73537.34, 171.84, 'Female', '1983-09-08', 'https://randomuser.me/api/portraits/women/75.jpg', 'Accountant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anika.gupta.504@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anika', 'Gupta', 'High School', 125321.79, 151.09, 'Female', '1986-10-22', 'https://randomuser.me/api/portraits/women/64.jpg', 'Sales Executive', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.oswal.505@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Oswal', 'PhD', 58419.55, 172.61, 'Female', '1999-11-02', 'https://randomuser.me/api/portraits/women/22.jpg', 'Architect', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.shah.506@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Shah', 'Bachelors', 102070.46, 181.22, 'Male', '1994-09-14', 'https://randomuser.me/api/portraits/men/52.jpg', 'Software Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.sidhu.507@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Sidhu', 'Bachelors', 174129.9, 150.36, 'Female', '1982-04-19', 'https://randomuser.me/api/portraits/women/44.jpg', 'Designer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.oswal.508@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Oswal', 'PhD', 138551.52, 170.91, 'Male', '1985-04-19', 'https://randomuser.me/api/portraits/men/63.jpg', 'Sales Executive', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.sharma.509@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Sharma', 'High School', 170912.45, 153.87, 'Female', '2002-03-08', 'https://randomuser.me/api/portraits/women/9.jpg', 'Designer', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.joshi.510@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Joshi', 'Masters', 75102.93, 152.47, 'Female', '2000-07-27', 'https://randomuser.me/api/portraits/women/1.jpg', 'Chef', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.syed.511@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Syed', 'Bachelors', 146588.49, 186.31, 'Male', '1989-01-13', 'https://randomuser.me/api/portraits/men/57.jpg', 'Teacher', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ibrahim.hussain.512@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ibrahim', 'Hussain', 'Masters', 134850.67, 176.01, 'Male', '2002-06-25', 'https://randomuser.me/api/portraits/men/91.jpg', 'Data Analyst', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('andrew.d''souza.513@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Andrew', 'D''Souza', 'Bachelors', 30544.3, 182.18, 'Male', '2000-03-26', 'https://randomuser.me/api/portraits/men/6.jpg', 'Teacher', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harleen.singh.514@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harleen', 'Singh', 'Masters', 58546.65, 174.81, 'Female', '1986-09-09', 'https://randomuser.me/api/portraits/women/67.jpg', 'Architect', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.brar.515@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Brar', 'Bachelors', 101646.91, 159.04, 'Female', '1991-06-08', 'https://randomuser.me/api/portraits/women/76.jpg', 'Pharmacist', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anna.rodrigues.516@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anna', 'Rodrigues', 'Masters', 66431.67, 168.16, 'Female', '1992-12-22', 'https://randomuser.me/api/portraits/women/18.jpg', 'Nurse', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.sandhu.517@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Sandhu', 'PhD', 33474.76, 169.98, 'Male', '1997-07-05', 'https://randomuser.me/api/portraits/men/16.jpg', 'Software Engineer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sandhu.518@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sandhu', 'Bachelors', 59383.12, 184.33, 'Male', '1981-10-24', 'https://randomuser.me/api/portraits/men/72.jpg', 'Marketing Manager', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.sherpa.519@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Sherpa', 'PhD', 69095.32, 187.2, 'Male', '1998-09-08', 'https://randomuser.me/api/portraits/men/7.jpg', 'Civil Engineer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.grewal.520@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Grewal', 'High School', 140795.85, 189.38, 'Male', '1992-12-22', 'https://randomuser.me/api/portraits/men/7.jpg', 'Civil Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.shah.521@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Shah', 'Bachelors', 198405.56, 161.23, 'Female', '1990-10-09', 'https://randomuser.me/api/portraits/women/29.jpg', 'Data Analyst', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ishita.gupta.522@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ishita', 'Gupta', 'Bachelors', 72156.37, 153.99, 'Female', '1997-07-15', 'https://randomuser.me/api/portraits/women/5.jpg', 'Doctor', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.gurung.523@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Gurung', 'PhD', 75307.24, 150.07, 'Female', '2002-08-13', 'https://randomuser.me/api/portraits/women/94.jpg', 'Doctor', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pooja.desai.524@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pooja', 'Desai', 'Bachelors', 134452.02, 174.71, 'Female', '1988-08-04', 'https://randomuser.me/api/portraits/women/20.jpg', 'Banker', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('daniel.fernandes.525@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Daniel', 'Fernandes', 'Bachelors', 189088.76, 177.05, 'Male', '1991-02-11', 'https://randomuser.me/api/portraits/men/50.jpg', 'Accountant', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yash.sharma.526@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yash', 'Sharma', 'High School', 68541.09, 174.03, 'Male', '1982-12-27', 'https://randomuser.me/api/portraits/men/13.jpg', 'Data Analyst', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anika.joshi.527@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anika', 'Joshi', 'Masters', 93401.27, 160.23, 'Female', '2003-08-24', 'https://randomuser.me/api/portraits/women/33.jpg', 'Sales Executive', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.lama.528@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Lama', 'High School', 61456.18, 152.43, 'Female', '1993-07-01', 'https://randomuser.me/api/portraits/women/75.jpg', 'Accountant', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.porwal.529@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Porwal', 'Bachelors', 60549.93, 184.58, 'Male', '1983-02-08', 'https://randomuser.me/api/portraits/men/78.jpg', 'Software Engineer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.gomes.530@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'Gomes', 'Bachelors', 179221.29, 161.89, 'Female', '2003-12-05', 'https://randomuser.me/api/portraits/women/54.jpg', 'Software Engineer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.sharma.531@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Sharma', 'PhD', 37378.65, 152.17, 'Female', '1996-08-08', 'https://randomuser.me/api/portraits/women/49.jpg', 'Nurse', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.hussain.532@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Hussain', 'Masters', 87305.87, 185.24, 'Male', '1995-11-26', 'https://randomuser.me/api/portraits/men/8.jpg', 'Lawyer', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('reyansh.nair.533@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Reyansh', 'Nair', 'Masters', 139779.28, 166.99, 'Male', '1998-02-13', 'https://randomuser.me/api/portraits/men/87.jpg', 'Marketing Manager', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jennifer.d''souza.534@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jennifer', 'D''Souza', 'PhD', 156633.73, 159.85, 'Female', '1999-08-04', 'https://randomuser.me/api/portraits/women/71.jpg', 'Banker', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zara.hassan.535@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zara', 'Hassan', 'PhD', 75094.08, 158.35, 'Female', '1992-06-11', 'https://randomuser.me/api/portraits/women/66.jpg', 'Architect', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('reyansh.patel.536@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Reyansh', 'Patel', 'PhD', 42584.39, 187.19, 'Male', '1992-09-09', 'https://randomuser.me/api/portraits/men/58.jpg', 'Lawyer', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayaan.ansari.537@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayaan', 'Ansari', 'Bachelors', 162106.76, 174.01, 'Male', '1995-11-14', 'https://randomuser.me/api/portraits/men/17.jpg', 'Data Analyst', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('advait.joshi.538@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Advait', 'Joshi', 'Masters', 102807.62, 163.44, 'Male', '1997-08-11', 'https://randomuser.me/api/portraits/men/56.jpg', 'Civil Engineer', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.lama.539@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Lama', 'PhD', 188997.71, 177.49, 'Male', '1995-02-22', 'https://randomuser.me/api/portraits/men/57.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.jain.540@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Jain', 'High School', 152026.36, 187.77, 'Male', '2003-04-25', 'https://randomuser.me/api/portraits/men/67.jpg', 'Entrepreneur', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arhan.khan.541@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arhan', 'Khan', 'Masters', 38740.15, 160.31, 'Male', '1989-12-08', 'https://randomuser.me/api/portraits/men/19.jpg', 'Lawyer', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanvi.joshi.542@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanvi', 'Joshi', 'PhD', 85086.72, 172.45, 'Female', '1989-10-14', 'https://randomuser.me/api/portraits/women/40.jpg', 'Accountant', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('joseph.pereira.543@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Joseph', 'Pereira', 'High School', 145398.37, 164.52, 'Male', '1983-11-28', 'https://randomuser.me/api/portraits/men/72.jpg', 'Doctor', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.sandhu.544@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Sandhu', 'PhD', 59293.33, 159.9, 'Female', '1994-01-17', 'https://randomuser.me/api/portraits/women/88.jpg', 'Chef', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('john.pereira.545@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('John', 'Pereira', 'PhD', 166080.87, 178.45, 'Male', '2000-09-09', 'https://randomuser.me/api/portraits/men/62.jpg', 'Pharmacist', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.pereira.546@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Pereira', 'PhD', 62196.54, 171.88, 'Male', '2002-11-01', 'https://randomuser.me/api/portraits/men/96.jpg', 'Lawyer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navdeep.brar.547@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navdeep', 'Brar', 'Masters', 194274.26, 187.95, 'Male', '1997-10-02', 'https://randomuser.me/api/portraits/men/44.jpg', 'Designer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sandhu.548@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sandhu', 'PhD', 99288.88, 168.26, 'Male', '1983-12-28', 'https://randomuser.me/api/portraits/men/55.jpg', 'Civil Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.gurung.549@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Gurung', 'Masters', 166578.53, 167.38, 'Male', '1997-08-10', 'https://randomuser.me/api/portraits/men/54.jpg', 'Chef', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.gurung.550@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Gurung', 'Bachelors', 173812.64, 158.24, 'Female', '2000-07-18', 'https://randomuser.me/api/portraits/women/12.jpg', 'Nurse', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.gill.551@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Gill', 'Masters', 154985.44, 170.8, 'Male', '1980-12-15', 'https://randomuser.me/api/portraits/men/54.jpg', 'Banker', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.gupta.552@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Gupta', 'PhD', 62712.02, 151.23, 'Female', '1998-04-10', 'https://randomuser.me/api/portraits/women/9.jpg', 'Banker', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paul.d''souza.553@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paul', 'D''Souza', 'High School', 125448.02, 177.74, 'Male', '1992-05-08', 'https://randomuser.me/api/portraits/men/2.jpg', 'Architect', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.rodrigues.554@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Rodrigues', 'Masters', 109338.43, 185.8, 'Male', '1980-09-18', 'https://randomuser.me/api/portraits/men/44.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurbir.singh.555@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurbir', 'Singh', 'Masters', 160806.99, 189.34, 'Male', '1990-11-11', 'https://randomuser.me/api/portraits/men/84.jpg', 'Accountant', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.gurung.556@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Gurung', 'Bachelors', 194168.92, 156.7, 'Female', '1998-04-09', 'https://randomuser.me/api/portraits/women/46.jpg', 'Accountant', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.porwal.557@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Porwal', 'High School', 84648.02, 156.27, 'Female', '2001-03-27', 'https://randomuser.me/api/portraits/women/86.jpg', 'Business Owner', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.sharma.558@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Sharma', 'High School', 131865.47, 165.17, 'Female', '1996-11-03', 'https://randomuser.me/api/portraits/women/17.jpg', 'Teacher', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.singh.559@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Singh', 'PhD', 113988.58, 171.1, 'Female', '1997-12-18', 'https://randomuser.me/api/portraits/women/27.jpg', 'Lawyer', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aaliyah.malik.560@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aaliyah', 'Malik', 'High School', 135079.53, 153.1, 'Female', '2003-09-03', 'https://randomuser.me/api/portraits/women/62.jpg', 'Architect', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hussain.ansari.561@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hussain', 'Ansari', 'Bachelors', 164914.37, 166.27, 'Male', '1995-04-19', 'https://randomuser.me/api/portraits/men/89.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harmeet.gill.562@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harmeet', 'Gill', 'Bachelors', 31750.14, 188.24, 'Male', '1995-11-25', 'https://randomuser.me/api/portraits/men/95.jpg', 'Software Engineer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.hussain.563@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Hussain', 'PhD', 146897.48, 179.98, 'Male', '2003-09-22', 'https://randomuser.me/api/portraits/men/60.jpg', 'Lawyer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayaan.ansari.564@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayaan', 'Ansari', 'Masters', 80042.53, 162.39, 'Male', '1994-04-13', 'https://randomuser.me/api/portraits/men/31.jpg', 'Data Analyst', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.porwal.565@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Porwal', 'Bachelors', 55857.59, 156.19, 'Female', '2002-04-23', 'https://randomuser.me/api/portraits/women/78.jpg', 'Marketing Manager', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ali.sheikh.566@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ali', 'Sheikh', 'High School', 79287.44, 183.53, 'Male', '2003-01-04', 'https://randomuser.me/api/portraits/men/99.jpg', 'Teacher', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.jain.567@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Jain', 'Bachelors', 199751.8, 180.81, 'Male', '2002-04-09', 'https://randomuser.me/api/portraits/men/90.jpg', 'Civil Engineer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michael.gomes.568@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michael', 'Gomes', 'High School', 178416.46, 174.33, 'Male', '2003-08-16', 'https://randomuser.me/api/portraits/men/54.jpg', 'Designer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sarah.thomas.569@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sarah', 'Thomas', 'High School', 75323.4, 167.61, 'Female', '1998-10-03', 'https://randomuser.me/api/portraits/women/27.jpg', 'Sales Executive', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.lama.570@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Lama', 'Masters', 131581.61, 173.76, 'Female', '1999-04-26', 'https://randomuser.me/api/portraits/women/46.jpg', 'Consultant', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mohammed.sheikh.571@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mohammed', 'Sheikh', 'Bachelors', 72448.16, 187.72, 'Male', '2001-01-22', 'https://randomuser.me/api/portraits/men/38.jpg', 'Chef', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navdeep.sandhu.572@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navdeep', 'Sandhu', 'Bachelors', 86523.8, 183.36, 'Male', '1995-08-24', 'https://randomuser.me/api/portraits/men/8.jpg', 'Marketing Manager', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.lama.573@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Lama', 'Masters', 61542.8, 172.89, 'Female', '1993-07-17', 'https://randomuser.me/api/portraits/women/33.jpg', 'Consultant', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.sherpa.574@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Sherpa', 'PhD', 148870.55, 177.74, 'Male', '1980-12-17', 'https://randomuser.me/api/portraits/men/46.jpg', 'Accountant', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michael.gomes.575@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michael', 'Gomes', 'Masters', 34808.89, 184.01, 'Male', '1990-01-12', 'https://randomuser.me/api/portraits/men/52.jpg', 'Teacher', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('avni.gupta.576@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Avni', 'Gupta', 'Masters', 94261.75, 171.1, 'Female', '1986-03-25', 'https://randomuser.me/api/portraits/women/48.jpg', 'Data Analyst', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.joshi.577@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Joshi', 'PhD', 199885.16, 172.17, 'Female', '1980-01-17', 'https://randomuser.me/api/portraits/women/73.jpg', 'Software Engineer', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.oswal.578@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Oswal', 'High School', 163026.68, 160.5, 'Male', '1991-06-18', 'https://randomuser.me/api/portraits/men/69.jpg', 'Business Owner', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.lama.579@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Lama', 'Bachelors', 74971.47, 178.91, 'Male', '1993-02-20', 'https://randomuser.me/api/portraits/men/84.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.malik.580@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Malik', 'High School', 171378.47, 173.36, 'Male', '1988-04-27', 'https://randomuser.me/api/portraits/men/97.jpg', 'Marketing Manager', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hiba.khan.581@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hiba', 'Khan', 'Bachelors', 119969.13, 171.46, 'Female', '2004-06-07', 'https://randomuser.me/api/portraits/women/21.jpg', 'Accountant', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('joseph.fernandes.582@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Joseph', 'Fernandes', 'Bachelors', 150103.74, 165.51, 'Male', '2000-02-11', 'https://randomuser.me/api/portraits/men/49.jpg', 'Entrepreneur', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pooja.nair.583@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pooja', 'Nair', 'Bachelors', 154558.24, 166.24, 'Female', '1992-05-09', 'https://randomuser.me/api/portraits/women/94.jpg', 'Teacher', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.thomas.584@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Thomas', 'High School', 155336.52, 189.93, 'Male', '2003-04-09', 'https://randomuser.me/api/portraits/men/89.jpg', 'Software Engineer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.585@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'PhD', 106959.14, 189.68, 'Male', '1991-09-01', 'https://randomuser.me/api/portraits/men/54.jpg', 'Software Engineer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.tamang.586@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Tamang', 'Bachelors', 165755.62, 171.55, 'Male', '2000-05-17', 'https://randomuser.me/api/portraits/men/27.jpg', 'Entrepreneur', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.oswal.587@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Oswal', 'Bachelors', 143774.34, 186.82, 'Male', '1987-02-09', 'https://randomuser.me/api/portraits/men/12.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('james.rodrigues.588@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('James', 'Rodrigues', 'Bachelors', 187043.15, 184.04, 'Male', '1987-03-08', 'https://randomuser.me/api/portraits/men/75.jpg', 'Civil Engineer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('christopher.rodrigues.589@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Christopher', 'Rodrigues', 'Bachelors', 125366.97, 184.41, 'Male', '2001-09-04', 'https://randomuser.me/api/portraits/men/100.jpg', 'Banker', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zara.syed.590@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zara', 'Syed', 'Masters', 72663.32, 170.56, 'Female', '1985-01-25', 'https://randomuser.me/api/portraits/women/5.jpg', 'Consultant', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.bhutia.591@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Bhutia', 'Masters', 38104.69, 163.21, 'Female', '1982-08-16', 'https://randomuser.me/api/portraits/women/18.jpg', 'Architect', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.brar.592@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Brar', 'Masters', 67428.08, 175.49, 'Male', '2001-07-24', 'https://randomuser.me/api/portraits/men/15.jpg', 'Software Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yash.sharma.593@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yash', 'Sharma', 'Masters', 59632.32, 166.29, 'Male', '1986-04-07', 'https://randomuser.me/api/portraits/men/62.jpg', 'Teacher', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dev.desai.594@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dev', 'Desai', 'Bachelors', 125955.87, 168.69, 'Male', '1996-12-19', 'https://randomuser.me/api/portraits/men/10.jpg', 'Civil Engineer', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rudra.sharma.595@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rudra', 'Sharma', 'PhD', 44593.36, 169.71, 'Male', '1981-11-23', 'https://randomuser.me/api/portraits/men/74.jpg', 'Nurse', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.singh.596@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Singh', 'High School', 186227.59, 168.03, 'Female', '1989-05-01', 'https://randomuser.me/api/portraits/women/30.jpg', 'Lawyer', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.sherpa.597@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Sherpa', 'PhD', 133122.03, 171.28, 'Male', '2004-11-11', 'https://randomuser.me/api/portraits/men/28.jpg', 'Doctor', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.agarwal.598@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Agarwal', 'PhD', 166039.39, 178.86, 'Male', '1981-12-04', 'https://randomuser.me/api/portraits/men/44.jpg', 'Business Owner', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('john.thomas.599@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('John', 'Thomas', 'PhD', 89048.83, 168.27, 'Male', '1994-04-26', 'https://randomuser.me/api/portraits/men/61.jpg', 'Business Owner', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('priya.d''souza.600@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Priya', 'D''Souza', 'PhD', 105027.9, 159.12, 'Female', '1989-05-14', 'https://randomuser.me/api/portraits/women/13.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aaradhya.joshi.601@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aaradhya', 'Joshi', 'Bachelors', 128270.95, 159.45, 'Female', '1990-03-13', 'https://randomuser.me/api/portraits/women/76.jpg', 'Nurse', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurpreet.sidhu.602@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurpreet', 'Sidhu', 'Masters', 110840.81, 189.02, 'Male', '1983-03-26', 'https://randomuser.me/api/portraits/men/100.jpg', 'Software Engineer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amarjeet.grewal.603@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amarjeet', 'Grewal', 'Masters', 108219.36, 172.8, 'Male', '1997-11-07', 'https://randomuser.me/api/portraits/men/34.jpg', 'Data Analyst', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.bhutia.604@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Bhutia', 'Masters', 181679.84, 171.28, 'Male', '2004-10-02', 'https://randomuser.me/api/portraits/men/60.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.gurung.605@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Gurung', 'PhD', 132246.68, 172.53, 'Female', '1998-06-14', 'https://randomuser.me/api/portraits/women/87.jpg', 'Marketing Manager', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.agarwal.606@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Agarwal', 'High School', 142342.04, 164.61, 'Male', '1980-10-10', 'https://randomuser.me/api/portraits/men/80.jpg', 'Lawyer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.shah.607@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Shah', 'High School', 61330.68, 155.6, 'Female', '1985-09-05', 'https://randomuser.me/api/portraits/women/97.jpg', 'Pharmacist', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('siya.gupta.608@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Siya', 'Gupta', 'High School', 30862.4, 152.57, 'Female', '2002-12-08', 'https://randomuser.me/api/portraits/women/28.jpg', 'Architect', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.porwal.609@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Porwal', 'PhD', 108137.52, 172.97, 'Male', '1981-11-13', 'https://randomuser.me/api/portraits/men/90.jpg', 'Pharmacist', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.ali.610@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Ali', 'PhD', 41094.71, 157.32, 'Female', '1984-12-03', 'https://randomuser.me/api/portraits/women/99.jpg', 'Banker', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.singh.611@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Singh', 'High School', 85639.08, 162.99, 'Male', '1984-02-15', 'https://randomuser.me/api/portraits/men/22.jpg', 'Civil Engineer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.shah.612@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Shah', 'High School', 161058.65, 157.46, 'Female', '1980-09-15', 'https://randomuser.me/api/portraits/women/15.jpg', 'Architect', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amir.syed.613@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amir', 'Syed', 'Bachelors', 38918.19, 189.03, 'Male', '2004-09-26', 'https://randomuser.me/api/portraits/men/83.jpg', 'Designer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.gill.614@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Gill', 'Bachelors', 90437.37, 155.22, 'Female', '1994-09-18', 'https://randomuser.me/api/portraits/women/65.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.gurung.615@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Gurung', 'Masters', 78036.24, 183.71, 'Male', '1996-05-19', 'https://randomuser.me/api/portraits/men/78.jpg', 'Sales Executive', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('samuel.d''souza.616@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Samuel', 'D''Souza', 'PhD', 162456.83, 164.78, 'Male', '1990-05-18', 'https://randomuser.me/api/portraits/men/32.jpg', 'Civil Engineer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayaan.syed.617@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayaan', 'Syed', 'PhD', 138812.82, 184.35, 'Male', '1995-06-27', 'https://randomuser.me/api/portraits/men/49.jpg', 'Software Engineer', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('joseph.fernandes.618@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Joseph', 'Fernandes', 'PhD', 175731.68, 185.23, 'Male', '1997-07-08', 'https://randomuser.me/api/portraits/men/28.jpg', 'Marketing Manager', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.gurung.619@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Gurung', 'Masters', 58663.41, 166.22, 'Male', '1993-05-02', 'https://randomuser.me/api/portraits/men/23.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kunal.joshi.620@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kunal', 'Joshi', 'PhD', 198370.49, 176.58, 'Male', '1985-01-17', 'https://randomuser.me/api/portraits/men/86.jpg', 'Teacher', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.hassan.621@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Hassan', 'Bachelors', 77463.91, 177.06, 'Male', '1994-12-21', 'https://randomuser.me/api/portraits/men/20.jpg', 'Teacher', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.sherpa.622@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Sherpa', 'High School', 42478.38, 183.73, 'Male', '2004-05-04', 'https://randomuser.me/api/portraits/men/22.jpg', 'Nurse', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('param.gupta.623@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Param', 'Gupta', 'PhD', 187436.06, 174.58, 'Male', '1998-02-14', 'https://randomuser.me/api/portraits/men/25.jpg', 'Designer', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.sharma.624@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Sharma', 'High School', 49522.79, 172.58, 'Female', '2004-12-25', 'https://randomuser.me/api/portraits/women/76.jpg', 'Entrepreneur', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.joshi.625@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Joshi', 'Bachelors', 39913.8, 150.8, 'Female', '1984-07-13', 'https://randomuser.me/api/portraits/women/62.jpg', 'Teacher', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kuldeep.sidhu.626@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kuldeep', 'Sidhu', 'PhD', 40238.94, 174.41, 'Male', '1996-04-01', 'https://randomuser.me/api/portraits/men/48.jpg', 'Banker', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kuldeep.dhillon.627@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kuldeep', 'Dhillon', 'Bachelors', 101179.42, 177.16, 'Male', '1985-09-18', 'https://randomuser.me/api/portraits/men/84.jpg', 'Doctor', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('laila.hassan.628@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Laila', 'Hassan', 'PhD', 33791.46, 174.67, 'Female', '1984-09-24', 'https://randomuser.me/api/portraits/women/60.jpg', 'Accountant', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.nair.629@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Nair', 'High School', 199470.62, 168.58, 'Female', '1994-11-25', 'https://randomuser.me/api/portraits/women/18.jpg', 'Doctor', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('daniel.pereira.630@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Daniel', 'Pereira', 'High School', 77445.43, 166.52, 'Male', '1991-06-13', 'https://randomuser.me/api/portraits/men/67.jpg', 'Chef', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.tamang.631@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Tamang', 'Bachelors', 53485.55, 188.96, 'Male', '1985-01-16', 'https://randomuser.me/api/portraits/men/89.jpg', 'Lawyer', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.gomes.632@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Gomes', 'High School', 73758.31, 181.49, 'Male', '1989-07-14', 'https://randomuser.me/api/portraits/men/34.jpg', 'Lawyer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mary.thomas.633@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mary', 'Thomas', 'Masters', 83116.8, 165.14, 'Female', '1981-02-15', 'https://randomuser.me/api/portraits/women/23.jpg', 'Banker', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.ahmed.634@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Ahmed', 'PhD', 175793.76, 163.67, 'Female', '1996-03-18', 'https://randomuser.me/api/portraits/women/66.jpg', 'Marketing Manager', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.grewal.635@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Grewal', 'High School', 162997.93, 181.51, 'Male', '2001-11-10', 'https://randomuser.me/api/portraits/men/70.jpg', 'Banker', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lhamo.gurung.636@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lhamo', 'Gurung', 'Masters', 190300.78, 169.72, 'Female', '1985-05-01', 'https://randomuser.me/api/portraits/women/51.jpg', 'Civil Engineer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.bhutia.637@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Bhutia', 'PhD', 132746.15, 175.07, 'Male', '1995-07-16', 'https://randomuser.me/api/portraits/men/12.jpg', 'Banker', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.porwal.638@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Porwal', 'High School', 176425.87, 184.68, 'Male', '1994-11-07', 'https://randomuser.me/api/portraits/men/16.jpg', 'Nurse', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.bhutia.639@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Bhutia', 'Masters', 51890.23, 172.41, 'Female', '1989-08-04', 'https://randomuser.me/api/portraits/women/67.jpg', 'Pharmacist', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.malik.640@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Malik', 'Bachelors', 50835.75, 160.98, 'Male', '1996-09-06', 'https://randomuser.me/api/portraits/men/38.jpg', 'Banker', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('safiya.ali.641@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Safiya', 'Ali', 'Bachelors', 122910.58, 163.45, 'Female', '1985-07-02', 'https://randomuser.me/api/portraits/women/94.jpg', 'Nurse', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ansh.desai.642@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ansh', 'Desai', 'Bachelors', 160710.81, 161.7, 'Male', '1982-05-12', 'https://randomuser.me/api/portraits/men/91.jpg', 'Chef', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.pereira.643@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'Pereira', 'Bachelors', 65370.83, 162.88, 'Female', '1988-09-26', 'https://randomuser.me/api/portraits/women/14.jpg', 'Architect', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dhruv.joshi.644@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dhruv', 'Joshi', 'PhD', 108235.02, 160.17, 'Male', '1996-04-13', 'https://randomuser.me/api/portraits/men/76.jpg', 'Banker', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('priya.d''souza.645@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Priya', 'D''Souza', 'Masters', 98893.54, 155.66, 'Female', '1981-12-11', 'https://randomuser.me/api/portraits/women/47.jpg', 'Chef', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('james.rodrigues.646@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('James', 'Rodrigues', 'High School', 148608.97, 187.58, 'Male', '1982-11-28', 'https://randomuser.me/api/portraits/men/52.jpg', 'Civil Engineer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.thomas.647@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'Thomas', 'Masters', 65290.09, 167.97, 'Female', '1986-11-19', 'https://randomuser.me/api/portraits/women/88.jpg', 'Consultant', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.ahmed.648@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Ahmed', 'Masters', 131477.54, 156.43, 'Female', '1989-08-02', 'https://randomuser.me/api/portraits/women/69.jpg', 'Civil Engineer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurpreet.sandhu.649@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurpreet', 'Sandhu', 'Masters', 78470.63, 160.28, 'Male', '1992-05-27', 'https://randomuser.me/api/portraits/men/13.jpg', 'Marketing Manager', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.reddy.650@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Reddy', 'Masters', 129992.72, 169.82, 'Female', '1985-11-09', 'https://randomuser.me/api/portraits/women/2.jpg', 'Accountant', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navdeep.sidhu.651@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navdeep', 'Sidhu', 'High School', 64240.62, 165.14, 'Male', '1990-06-27', 'https://randomuser.me/api/portraits/men/5.jpg', 'Accountant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.sidhu.652@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Sidhu', 'PhD', 72966.33, 171.37, 'Male', '1986-05-17', 'https://randomuser.me/api/portraits/men/50.jpg', 'Designer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('varun.sharma.653@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Varun', 'Sharma', 'Bachelors', 102234.82, 187.36, 'Male', '2004-12-18', 'https://randomuser.me/api/portraits/men/44.jpg', 'Designer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('susan.fernandes.654@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Susan', 'Fernandes', 'High School', 128626.92, 163.23, 'Female', '1986-11-09', 'https://randomuser.me/api/portraits/women/86.jpg', 'Teacher', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('omar.ahmed.655@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Omar', 'Ahmed', 'High School', 63553.61, 171.16, 'Male', '1994-04-03', 'https://randomuser.me/api/portraits/men/39.jpg', 'Business Owner', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('susan.rodrigues.656@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Susan', 'Rodrigues', 'PhD', 73293.52, 173.67, 'Female', '1982-02-19', 'https://randomuser.me/api/portraits/women/6.jpg', 'Business Owner', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.oswal.657@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Oswal', 'PhD', 79316.7, 166.33, 'Male', '1990-01-05', 'https://randomuser.me/api/portraits/men/74.jpg', 'Data Analyst', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.jain.658@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Jain', 'High School', 186002.37, 170.48, 'Female', '1985-08-14', 'https://randomuser.me/api/portraits/women/5.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.singh.659@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Singh', 'High School', 58260.46, 154.7, 'Female', '1999-09-11', 'https://randomuser.me/api/portraits/women/66.jpg', 'Business Owner', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.tamang.660@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Tamang', 'PhD', 79959.0, 185.13, 'Male', '2003-01-07', 'https://randomuser.me/api/portraits/men/54.jpg', 'Marketing Manager', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rohan.iyer.661@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rohan', 'Iyer', 'Masters', 90108.4, 176.67, 'Male', '1989-04-06', 'https://randomuser.me/api/portraits/men/29.jpg', 'Chef', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.tamang.662@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Tamang', 'High School', 167443.17, 179.2, 'Male', '1989-05-20', 'https://randomuser.me/api/portraits/men/92.jpg', 'Architect', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('advait.patel.663@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Advait', 'Patel', 'High School', 70881.27, 184.75, 'Male', '1984-06-07', 'https://randomuser.me/api/portraits/men/49.jpg', 'Marketing Manager', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.xavier.664@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Xavier', 'Masters', 188734.27, 175.87, 'Male', '1998-12-07', 'https://randomuser.me/api/portraits/men/96.jpg', 'Designer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.tamang.665@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Tamang', 'High School', 53980.35, 167.18, 'Male', '1983-07-16', 'https://randomuser.me/api/portraits/men/2.jpg', 'Accountant', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.sharma.666@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Sharma', 'PhD', 170455.9, 184.32, 'Male', '1997-05-19', 'https://randomuser.me/api/portraits/men/57.jpg', 'Doctor', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanish.patel.667@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanish', 'Patel', 'Bachelors', 82002.43, 180.54, 'Male', '1998-01-14', 'https://randomuser.me/api/portraits/men/78.jpg', 'Architect', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanish.joshi.668@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanish', 'Joshi', 'High School', 114968.02, 186.94, 'Male', '1983-12-13', 'https://randomuser.me/api/portraits/men/88.jpg', 'Teacher', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.tamang.669@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Tamang', 'High School', 152812.06, 182.09, 'Male', '1985-07-08', 'https://randomuser.me/api/portraits/men/98.jpg', 'Marketing Manager', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('angel.d''souza.670@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Angel', 'D''Souza', 'Bachelors', 113724.49, 161.08, 'Female', '1988-04-11', 'https://randomuser.me/api/portraits/women/93.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.lama.671@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Lama', 'PhD', 64967.5, 187.6, 'Male', '1997-08-16', 'https://randomuser.me/api/portraits/men/6.jpg', 'Banker', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.thomas.672@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Thomas', 'Bachelors', 148668.55, 167.49, 'Male', '1986-11-05', 'https://randomuser.me/api/portraits/men/69.jpg', 'Accountant', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('david.d''souza.673@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('David', 'D''Souza', 'Masters', 48839.46, 174.21, 'Male', '1991-12-06', 'https://randomuser.me/api/portraits/men/65.jpg', 'Designer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.nair.674@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Nair', 'High School', 193963.59, 155.42, 'Female', '1997-02-06', 'https://randomuser.me/api/portraits/women/21.jpg', 'Pharmacist', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hassan.hussain.675@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hassan', 'Hussain', 'PhD', 42995.37, 177.1, 'Male', '1984-07-12', 'https://randomuser.me/api/portraits/men/73.jpg', 'Chef', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.patel.676@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Patel', 'Bachelors', 89624.22, 161.57, 'Female', '2001-02-24', 'https://randomuser.me/api/portraits/women/83.jpg', 'Doctor', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.syed.677@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Syed', 'Masters', 198765.1, 164.93, 'Female', '1985-12-20', 'https://randomuser.me/api/portraits/women/44.jpg', 'Software Engineer', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.lama.678@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Lama', 'Bachelors', 171499.71, 151.1, 'Female', '1988-03-17', 'https://randomuser.me/api/portraits/women/49.jpg', 'Chef', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harleen.sidhu.679@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harleen', 'Sidhu', 'Masters', 171887.86, 156.64, 'Female', '2000-11-04', 'https://randomuser.me/api/portraits/women/52.jpg', 'Consultant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rachel.gomes.680@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rachel', 'Gomes', 'PhD', 150884.74, 170.97, 'Female', '1990-12-14', 'https://randomuser.me/api/portraits/women/66.jpg', 'Marketing Manager', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.nair.681@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Nair', 'Bachelors', 120581.95, 166.8, 'Male', '1981-02-17', 'https://randomuser.me/api/portraits/men/42.jpg', 'Business Owner', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.jain.682@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Jain', 'Bachelors', 153793.59, 175.67, 'Male', '1987-04-10', 'https://randomuser.me/api/portraits/men/46.jpg', 'Data Analyst', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.gill.683@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Gill', 'Masters', 109090.55, 163.34, 'Female', '1981-04-24', 'https://randomuser.me/api/portraits/women/36.jpg', 'Civil Engineer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.brar.684@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Brar', 'Bachelors', 186525.27, 158.68, 'Female', '1983-06-14', 'https://randomuser.me/api/portraits/women/25.jpg', 'Designer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.sidhu.685@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Sidhu', 'Masters', 47133.6, 162.73, 'Female', '1999-07-13', 'https://randomuser.me/api/portraits/women/1.jpg', 'Pharmacist', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ansh.singh.686@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ansh', 'Singh', 'PhD', 57530.14, 174.55, 'Male', '1993-09-04', 'https://randomuser.me/api/portraits/men/8.jpg', 'Sales Executive', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dolma.tamang.687@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dolma', 'Tamang', 'PhD', 36463.38, 173.52, 'Female', '1995-12-15', 'https://randomuser.me/api/portraits/women/15.jpg', 'Data Analyst', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('joshua.thomas.688@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Joshua', 'Thomas', 'High School', 75639.69, 182.65, 'Male', '2004-07-17', 'https://randomuser.me/api/portraits/men/71.jpg', 'Accountant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('taranjot.sidhu.689@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Taranjot', 'Sidhu', 'PhD', 54822.71, 169.02, 'Female', '1988-08-27', 'https://randomuser.me/api/portraits/women/56.jpg', 'Designer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('omar.syed.690@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Omar', 'Syed', 'High School', 52481.41, 189.11, 'Male', '1997-12-23', 'https://randomuser.me/api/portraits/men/26.jpg', 'Marketing Manager', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.ali.691@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Ali', 'High School', 75482.89, 160.18, 'Female', '1989-07-21', 'https://randomuser.me/api/portraits/women/18.jpg', 'Marketing Manager', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hiba.ali.692@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hiba', 'Ali', 'Bachelors', 152327.3, 153.97, 'Female', '1999-02-04', 'https://randomuser.me/api/portraits/women/37.jpg', 'Architect', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rachel.rodrigues.693@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rachel', 'Rodrigues', 'High School', 123481.48, 174.7, 'Female', '1992-11-05', 'https://randomuser.me/api/portraits/women/87.jpg', 'Lawyer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.bhutia.694@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Bhutia', 'High School', 152069.71, 174.4, 'Male', '1987-05-13', 'https://randomuser.me/api/portraits/men/96.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.sharma.695@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Sharma', 'PhD', 117092.06, 171.07, 'Female', '1992-06-15', 'https://randomuser.me/api/portraits/women/81.jpg', 'Doctor', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.gurung.696@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Gurung', 'PhD', 155286.49, 160.43, 'Male', '1993-04-17', 'https://randomuser.me/api/portraits/men/4.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pooja.iyer.697@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pooja', 'Iyer', 'Masters', 192327.16, 160.27, 'Female', '1996-05-20', 'https://randomuser.me/api/portraits/women/4.jpg', 'Civil Engineer', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.dhillon.698@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Dhillon', 'Masters', 63895.09, 153.21, 'Female', '1982-03-14', 'https://randomuser.me/api/portraits/women/23.jpg', 'Sales Executive', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.shah.699@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Shah', 'High School', 108926.46, 180.39, 'Male', '1984-11-19', 'https://randomuser.me/api/portraits/men/1.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.gurung.700@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Gurung', 'PhD', 125599.89, 189.19, 'Male', '1982-03-12', 'https://randomuser.me/api/portraits/men/30.jpg', 'Consultant', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kuldeep.gill.701@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kuldeep', 'Gill', 'High School', 32305.8, 182.7, 'Male', '1983-04-19', 'https://randomuser.me/api/portraits/men/39.jpg', 'Banker', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sana.hassan.702@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sana', 'Hassan', 'Masters', 68774.19, 150.31, 'Female', '1982-08-08', 'https://randomuser.me/api/portraits/women/11.jpg', 'Architect', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.703@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'High School', 103211.04, 185.63, 'Male', '1996-08-02', 'https://randomuser.me/api/portraits/men/83.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.sherpa.704@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Sherpa', 'PhD', 179013.5, 187.38, 'Male', '1983-08-24', 'https://randomuser.me/api/portraits/men/75.jpg', 'Software Engineer', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.agarwal.705@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Agarwal', 'Masters', 101319.64, 163.08, 'Female', '1997-05-10', 'https://randomuser.me/api/portraits/women/61.jpg', 'Data Analyst', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.tamang.706@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Tamang', 'Masters', 42023.38, 165.12, 'Female', '1984-11-21', 'https://randomuser.me/api/portraits/women/96.jpg', 'Business Owner', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.ahmed.707@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Ahmed', 'Masters', 80638.63, 156.51, 'Female', '1980-05-08', 'https://randomuser.me/api/portraits/women/64.jpg', 'Data Analyst', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishi.nair.708@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishi', 'Nair', 'High School', 188081.04, 181.31, 'Male', '1990-01-21', 'https://randomuser.me/api/portraits/men/50.jpg', 'Business Owner', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.khan.709@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Khan', 'Bachelors', 105630.18, 161.98, 'Male', '1983-12-03', 'https://randomuser.me/api/portraits/men/63.jpg', 'Banker', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aarav.iyer.710@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aarav', 'Iyer', 'PhD', 54442.64, 160.97, 'Male', '1984-06-11', 'https://randomuser.me/api/portraits/men/44.jpg', 'Marketing Manager', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.brar.711@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Brar', 'PhD', 104411.12, 156.99, 'Female', '2004-10-22', 'https://randomuser.me/api/portraits/women/18.jpg', 'Software Engineer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.porwal.712@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Porwal', 'Masters', 30038.96, 174.57, 'Male', '1986-02-08', 'https://randomuser.me/api/portraits/men/95.jpg', 'Entrepreneur', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.lama.713@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Lama', 'Bachelors', 177505.62, 156.34, 'Female', '1990-11-01', 'https://randomuser.me/api/portraits/women/73.jpg', 'Data Analyst', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ibrahim.malik.714@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ibrahim', 'Malik', 'Masters', 167571.63, 171.24, 'Male', '2004-06-04', 'https://randomuser.me/api/portraits/men/12.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.agarwal.715@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Agarwal', 'PhD', 120796.61, 185.83, 'Male', '1989-12-18', 'https://randomuser.me/api/portraits/men/58.jpg', 'Banker', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.brar.716@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Brar', 'High School', 142587.23, 165.26, 'Male', '1988-02-16', 'https://randomuser.me/api/portraits/men/10.jpg', 'Doctor', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.bhutia.717@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Bhutia', 'Bachelors', 132642.91, 172.25, 'Male', '1986-08-08', 'https://randomuser.me/api/portraits/men/97.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.sherpa.718@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Sherpa', 'Bachelors', 126524.02, 177.64, 'Male', '1989-09-18', 'https://randomuser.me/api/portraits/men/80.jpg', 'Sales Executive', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harleen.grewal.719@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harleen', 'Grewal', 'PhD', 189865.4, 159.01, 'Female', '1997-05-19', 'https://randomuser.me/api/portraits/women/69.jpg', 'Accountant', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.thomas.720@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Thomas', 'Masters', 184602.37, 186.58, 'Male', '1992-08-08', 'https://randomuser.me/api/portraits/men/12.jpg', 'Architect', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.oswal.721@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Oswal', 'High School', 114256.76, 174.03, 'Male', '2001-07-19', 'https://randomuser.me/api/portraits/men/51.jpg', 'Software Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.pereira.722@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'Pereira', 'High School', 133380.85, 153.05, 'Female', '1991-11-03', 'https://randomuser.me/api/portraits/women/54.jpg', 'Consultant', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.oswal.723@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Oswal', 'Bachelors', 170091.62, 161.81, 'Female', '2001-11-07', 'https://randomuser.me/api/portraits/women/26.jpg', 'Marketing Manager', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.syed.724@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Syed', 'Bachelors', 58921.16, 166.08, 'Female', '2001-01-19', 'https://randomuser.me/api/portraits/women/89.jpg', 'Doctor', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.shah.725@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Shah', 'High School', 72923.42, 170.45, 'Female', '1981-11-04', 'https://randomuser.me/api/portraits/women/28.jpg', 'Banker', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.gill.726@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Gill', 'PhD', 131193.14, 156.29, 'Female', '2000-11-18', 'https://randomuser.me/api/portraits/women/75.jpg', 'Lawyer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.jain.727@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Jain', 'Bachelors', 44121.8, 173.6, 'Male', '1982-09-08', 'https://randomuser.me/api/portraits/men/24.jpg', 'Business Owner', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zainab.hussain.728@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zainab', 'Hussain', 'Masters', 133253.07, 150.89, 'Female', '1990-12-04', 'https://randomuser.me/api/portraits/women/79.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.shah.729@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Shah', 'Bachelors', 33352.91, 188.84, 'Male', '1993-09-08', 'https://randomuser.me/api/portraits/men/31.jpg', 'Sales Executive', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sidhu.730@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sidhu', 'Masters', 110150.48, 155.14, 'Female', '1990-10-25', 'https://randomuser.me/api/portraits/women/95.jpg', 'Lawyer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('fatima.hassan.731@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Fatima', 'Hassan', 'High School', 43841.67, 173.95, 'Female', '1985-05-21', 'https://randomuser.me/api/portraits/women/27.jpg', 'Doctor', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.lama.732@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Lama', 'PhD', 57317.55, 184.66, 'Male', '1986-06-23', 'https://randomuser.me/api/portraits/men/18.jpg', 'Nurse', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.jain.733@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Jain', 'High School', 81385.75, 168.2, 'Female', '1985-07-16', 'https://randomuser.me/api/portraits/women/88.jpg', 'Doctor', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aisha.sheikh.734@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aisha', 'Sheikh', 'Bachelors', 143858.47, 153.98, 'Female', '2000-06-28', 'https://randomuser.me/api/portraits/women/7.jpg', 'Entrepreneur', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hiba.ali.735@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hiba', 'Ali', 'PhD', 88817.46, 160.88, 'Female', '1992-10-06', 'https://randomuser.me/api/portraits/women/5.jpg', 'Business Owner', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.shah.736@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Shah', 'Masters', 188087.21, 158.8, 'Female', '1986-03-13', 'https://randomuser.me/api/portraits/women/53.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditi.verma.737@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditi', 'Verma', 'Bachelors', 183444.11, 172.66, 'Female', '1997-04-27', 'https://randomuser.me/api/portraits/women/16.jpg', 'Architect', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaskaran.singh.738@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaskaran', 'Singh', 'High School', 91918.57, 166.3, 'Male', '1998-11-14', 'https://randomuser.me/api/portraits/men/27.jpg', 'Data Analyst', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paramjit.brar.739@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paramjit', 'Brar', 'High School', 197453.91, 182.74, 'Male', '1995-09-22', 'https://randomuser.me/api/portraits/men/30.jpg', 'Data Analyst', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sandeep.brar.740@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sandeep', 'Brar', 'Bachelors', 151706.38, 163.85, 'Female', '1990-03-25', 'https://randomuser.me/api/portraits/women/33.jpg', 'Doctor', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.jain.741@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Jain', 'Bachelors', 128744.92, 154.67, 'Female', '1992-08-20', 'https://randomuser.me/api/portraits/women/54.jpg', 'Teacher', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.brar.742@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Brar', 'Masters', 131061.1, 171.93, 'Female', '1994-08-12', 'https://randomuser.me/api/portraits/women/14.jpg', 'Consultant', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.thomas.743@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Thomas', 'PhD', 147281.11, 186.98, 'Male', '1986-07-19', 'https://randomuser.me/api/portraits/men/20.jpg', 'Data Analyst', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.singh.744@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Singh', 'High School', 30470.36, 177.19, 'Male', '2003-07-17', 'https://randomuser.me/api/portraits/men/16.jpg', 'Business Owner', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.745@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'Bachelors', 174647.2, 171.08, 'Male', '1986-10-03', 'https://randomuser.me/api/portraits/men/36.jpg', 'Sales Executive', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('james.xavier.746@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('James', 'Xavier', 'Bachelors', 169362.99, 179.3, 'Male', '1996-05-20', 'https://randomuser.me/api/portraits/men/73.jpg', 'Chef', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hannah.gomes.747@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hannah', 'Gomes', 'Masters', 44436.47, 157.63, 'Female', '1991-06-15', 'https://randomuser.me/api/portraits/women/51.jpg', 'Business Owner', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paul.pereira.748@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paul', 'Pereira', 'High School', 167078.02, 188.51, 'Male', '1980-01-12', 'https://randomuser.me/api/portraits/men/75.jpg', 'Civil Engineer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.jain.749@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Jain', 'Masters', 194881.88, 176.19, 'Male', '2002-05-23', 'https://randomuser.me/api/portraits/men/26.jpg', 'Civil Engineer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.singh.750@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Singh', 'Bachelors', 153597.05, 164.94, 'Female', '2002-01-04', 'https://randomuser.me/api/portraits/women/56.jpg', 'Entrepreneur', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('safiya.ansari.751@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Safiya', 'Ansari', 'PhD', 158895.75, 162.57, 'Female', '2003-11-07', 'https://randomuser.me/api/portraits/women/92.jpg', 'Data Analyst', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('john.thomas.752@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('John', 'Thomas', 'Bachelors', 149057.66, 163.08, 'Male', '1986-10-25', 'https://randomuser.me/api/portraits/men/89.jpg', 'Consultant', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.gurung.753@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Gurung', 'PhD', 121854.37, 183.22, 'Male', '1998-09-08', 'https://randomuser.me/api/portraits/men/33.jpg', 'Data Analyst', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.jain.754@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Jain', 'Masters', 117388.64, 159.48, 'Female', '1987-04-16', 'https://randomuser.me/api/portraits/women/100.jpg', 'Lawyer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('taranjot.kaur.755@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Taranjot', 'Kaur', 'High School', 168314.41, 172.61, 'Female', '2000-06-19', 'https://randomuser.me/api/portraits/women/86.jpg', 'Consultant', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.sherpa.756@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Sherpa', 'High School', 125753.39, 181.63, 'Male', '1999-12-08', 'https://randomuser.me/api/portraits/men/40.jpg', 'Consultant', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.singh.757@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Singh', 'Masters', 131989.8, 174.04, 'Female', '1980-09-20', 'https://randomuser.me/api/portraits/women/14.jpg', 'Architect', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.bhutia.758@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Bhutia', 'Masters', 102029.06, 160.67, 'Male', '1996-06-07', 'https://randomuser.me/api/portraits/men/1.jpg', 'Software Engineer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.reddy.759@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Reddy', 'Bachelors', 174257.84, 159.36, 'Female', '2004-08-07', 'https://randomuser.me/api/portraits/women/100.jpg', 'Banker', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.gill.760@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Gill', 'Masters', 84364.18, 151.21, 'Female', '1991-08-02', 'https://randomuser.me/api/portraits/women/45.jpg', 'Lawyer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanvi.gupta.761@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanvi', 'Gupta', 'Bachelors', 178003.53, 169.74, 'Female', '1983-01-25', 'https://randomuser.me/api/portraits/women/40.jpg', 'Accountant', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mariam.syed.762@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mariam', 'Syed', 'Masters', 170672.76, 165.52, 'Female', '1997-06-22', 'https://randomuser.me/api/portraits/women/29.jpg', 'Chef', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.lama.763@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Lama', 'High School', 64321.02, 169.67, 'Male', '1981-11-23', 'https://randomuser.me/api/portraits/men/94.jpg', 'Software Engineer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harmeet.gill.764@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harmeet', 'Gill', 'High School', 141421.48, 181.53, 'Male', '1991-02-04', 'https://randomuser.me/api/portraits/men/42.jpg', 'Nurse', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kiaan.singh.765@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kiaan', 'Singh', 'High School', 146933.5, 183.1, 'Male', '1996-12-07', 'https://randomuser.me/api/portraits/men/85.jpg', 'Banker', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.agarwal.766@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Agarwal', 'High School', 138221.17, 158.63, 'Female', '1981-01-23', 'https://randomuser.me/api/portraits/women/90.jpg', 'Civil Engineer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('noor.hussain.767@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Noor', 'Hussain', 'Masters', 109044.64, 173.42, 'Female', '1991-06-12', 'https://randomuser.me/api/portraits/women/54.jpg', 'Architect', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.jain.768@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Jain', 'Masters', 126941.03, 159.74, 'Female', '1982-04-21', 'https://randomuser.me/api/portraits/women/15.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dolma.bhutia.769@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dolma', 'Bhutia', 'High School', 33945.43, 162.99, 'Female', '1989-08-14', 'https://randomuser.me/api/portraits/women/11.jpg', 'Banker', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.jain.770@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Jain', 'PhD', 128091.44, 179.3, 'Male', '2004-11-27', 'https://randomuser.me/api/portraits/men/68.jpg', 'Teacher', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('riya.porwal.771@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Riya', 'Porwal', 'High School', 45114.99, 168.09, 'Female', '1991-11-08', 'https://randomuser.me/api/portraits/women/65.jpg', 'Data Analyst', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.gomes.772@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'Gomes', 'Masters', 167504.07, 168.23, 'Female', '1990-01-25', 'https://randomuser.me/api/portraits/women/14.jpg', 'Lawyer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.brar.773@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Brar', 'Masters', 125991.61, 154.65, 'Female', '1997-03-17', 'https://randomuser.me/api/portraits/women/94.jpg', 'Chef', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('grace.d''souza.774@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Grace', 'D''Souza', 'Masters', 41600.45, 161.02, 'Female', '1994-12-24', 'https://randomuser.me/api/portraits/women/83.jpg', 'Entrepreneur', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kiranpreet.grewal.775@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kiranpreet', 'Grewal', 'High School', 156513.19, 166.86, 'Female', '1983-02-02', 'https://randomuser.me/api/portraits/women/37.jpg', 'Architect', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.jain.776@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Jain', 'Bachelors', 197264.34, 165.09, 'Male', '1994-01-16', 'https://randomuser.me/api/portraits/men/97.jpg', 'Banker', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mira.agarwal.777@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mira', 'Agarwal', 'High School', 139240.92, 166.6, 'Female', '1994-12-26', 'https://randomuser.me/api/portraits/women/89.jpg', 'Designer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.singh.778@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Singh', 'Masters', 79249.42, 156.2, 'Female', '2000-07-27', 'https://randomuser.me/api/portraits/women/97.jpg', 'Lawyer', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arjun.joshi.779@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arjun', 'Joshi', 'High School', 65906.42, 176.66, 'Male', '1981-06-02', 'https://randomuser.me/api/portraits/men/31.jpg', 'Architect', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mary.d''souza.780@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mary', 'D''Souza', 'PhD', 183225.38, 167.35, 'Female', '2000-04-14', 'https://randomuser.me/api/portraits/women/83.jpg', 'Teacher', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.jain.781@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Jain', 'Bachelors', 79180.5, 168.9, 'Female', '1986-07-26', 'https://randomuser.me/api/portraits/women/31.jpg', 'Sales Executive', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('susan.rodrigues.782@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Susan', 'Rodrigues', 'High School', 140655.85, 165.49, 'Female', '1984-09-18', 'https://randomuser.me/api/portraits/women/4.jpg', 'Lawyer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aaradhya.reddy.783@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aaradhya', 'Reddy', 'PhD', 115178.86, 169.31, 'Female', '1996-04-25', 'https://randomuser.me/api/portraits/women/90.jpg', 'Chef', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.gurung.784@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Gurung', 'PhD', 45912.44, 166.09, 'Female', '1982-08-08', 'https://randomuser.me/api/portraits/women/3.jpg', 'Business Owner', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.agarwal.785@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Agarwal', 'Masters', 128067.18, 176.58, 'Male', '1999-09-12', 'https://randomuser.me/api/portraits/men/44.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.brar.786@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Brar', 'Bachelors', 79128.93, 168.22, 'Female', '1981-09-24', 'https://randomuser.me/api/portraits/women/65.jpg', 'Banker', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.gill.787@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Gill', 'Masters', 190867.43, 174.12, 'Female', '1984-10-21', 'https://randomuser.me/api/portraits/women/68.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.tamang.788@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Tamang', 'High School', 41989.06, 170.96, 'Female', '1990-10-05', 'https://randomuser.me/api/portraits/women/63.jpg', 'Doctor', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('maryam.sheikh.789@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Maryam', 'Sheikh', 'Bachelors', 39551.53, 162.93, 'Female', '1997-12-11', 'https://randomuser.me/api/portraits/women/21.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.sandhu.790@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Sandhu', 'PhD', 56800.94, 186.83, 'Male', '1987-02-17', 'https://randomuser.me/api/portraits/men/68.jpg', 'Designer', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hiba.khan.791@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hiba', 'Khan', 'Bachelors', 158839.05, 160.53, 'Female', '1980-02-26', 'https://randomuser.me/api/portraits/women/70.jpg', 'Banker', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shreya.desai.792@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shreya', 'Desai', 'High School', 184102.65, 165.28, 'Female', '1985-04-26', 'https://randomuser.me/api/portraits/women/7.jpg', 'Software Engineer', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arjun.joshi.793@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arjun', 'Joshi', 'Bachelors', 116539.51, 170.49, 'Male', '1994-10-28', 'https://randomuser.me/api/portraits/men/80.jpg', 'Pharmacist', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.porwal.794@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Porwal', 'Bachelors', 137807.04, 160.32, 'Female', '1988-02-07', 'https://randomuser.me/api/portraits/women/41.jpg', 'Banker', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.lama.795@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Lama', 'Masters', 135945.98, 168.89, 'Female', '1988-08-20', 'https://randomuser.me/api/portraits/women/31.jpg', 'Designer', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.iyer.796@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Iyer', 'PhD', 88010.1, 160.21, 'Female', '2003-04-02', 'https://randomuser.me/api/portraits/women/16.jpg', 'Pharmacist', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.sandhu.797@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Sandhu', 'Bachelors', 115178.45, 153.1, 'Female', '1991-06-20', 'https://randomuser.me/api/portraits/women/68.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ruth.gomes.798@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ruth', 'Gomes', 'PhD', 150720.96, 173.74, 'Female', '1982-10-04', 'https://randomuser.me/api/portraits/women/45.jpg', 'Nurse', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.brar.799@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Brar', 'High School', 176839.39, 170.72, 'Female', '1987-01-13', 'https://randomuser.me/api/portraits/women/35.jpg', 'Doctor', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.bhutia.800@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Bhutia', 'PhD', 150784.5, 156.49, 'Female', '1992-09-06', 'https://randomuser.me/api/portraits/women/21.jpg', 'Pharmacist', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.jain.801@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Jain', 'High School', 182468.02, 188.55, 'Male', '1991-05-11', 'https://randomuser.me/api/portraits/men/95.jpg', 'Consultant', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('arjun.verma.802@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Arjun', 'Verma', 'Masters', 162292.31, 168.78, 'Male', '1991-08-11', 'https://randomuser.me/api/portraits/men/87.jpg', 'Entrepreneur', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('elizabeth.rodrigues.803@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Elizabeth', 'Rodrigues', 'PhD', 77757.44, 164.43, 'Female', '1998-10-12', 'https://randomuser.me/api/portraits/women/13.jpg', 'Designer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.porwal.804@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Porwal', 'PhD', 184685.84, 181.25, 'Male', '1981-11-26', 'https://randomuser.me/api/portraits/men/45.jpg', 'Chef', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zainab.khan.805@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zainab', 'Khan', 'Masters', 41162.29, 154.6, 'Female', '2002-08-04', 'https://randomuser.me/api/portraits/women/31.jpg', 'Lawyer', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dev.desai.806@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dev', 'Desai', 'Masters', 150831.22, 166.4, 'Male', '1997-04-19', 'https://randomuser.me/api/portraits/men/99.jpg', 'Designer', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.gurung.807@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Gurung', 'High School', 115985.43, 150.81, 'Female', '1994-07-21', 'https://randomuser.me/api/portraits/women/15.jpg', 'Business Owner', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('inaya.ahmed.808@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Inaya', 'Ahmed', 'Bachelors', 75842.93, 157.67, 'Female', '1996-03-27', 'https://randomuser.me/api/portraits/women/33.jpg', 'Teacher', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('thomas.thomas.809@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Thomas', 'Thomas', 'Masters', 54542.92, 178.3, 'Male', '2002-07-26', 'https://randomuser.me/api/portraits/men/52.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.tamang.810@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Tamang', 'High School', 42806.6, 153.15, 'Female', '1983-01-04', 'https://randomuser.me/api/portraits/women/38.jpg', 'Architect', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.dhillon.811@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Dhillon', 'Bachelors', 57357.97, 167.89, 'Male', '1994-12-17', 'https://randomuser.me/api/portraits/men/97.jpg', 'Teacher', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.jain.812@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Jain', 'Masters', 98642.29, 160.36, 'Male', '2000-02-21', 'https://randomuser.me/api/portraits/men/97.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amandeep.sandhu.813@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amandeep', 'Sandhu', 'PhD', 139604.33, 161.14, 'Female', '2000-03-14', 'https://randomuser.me/api/portraits/women/60.jpg', 'Consultant', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('peter.gomes.814@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Peter', 'Gomes', 'PhD', 41286.56, 176.54, 'Male', '1998-01-17', 'https://randomuser.me/api/portraits/men/13.jpg', 'Banker', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.syed.815@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Syed', 'Masters', 104916.88, 162.75, 'Male', '2004-10-11', 'https://randomuser.me/api/portraits/men/75.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anna.rodrigues.816@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anna', 'Rodrigues', 'Masters', 37096.05, 158.88, 'Female', '1995-09-12', 'https://randomuser.me/api/portraits/women/30.jpg', 'Lawyer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.tamang.817@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Tamang', 'Bachelors', 131674.74, 182.17, 'Male', '1982-11-14', 'https://randomuser.me/api/portraits/men/75.jpg', 'Lawyer', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navya.sharma.818@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navya', 'Sharma', 'PhD', 100121.52, 150.42, 'Female', '1985-09-24', 'https://randomuser.me/api/portraits/women/82.jpg', 'Banker', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.xavier.819@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'Xavier', 'PhD', 63339.12, 174.73, 'Female', '1999-08-05', 'https://randomuser.me/api/portraits/women/50.jpg', 'Entrepreneur', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('laila.hussain.820@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Laila', 'Hussain', 'Masters', 106060.19, 161.15, 'Female', '1985-10-17', 'https://randomuser.me/api/portraits/women/95.jpg', 'Software Engineer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('noor.malik.821@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Noor', 'Malik', 'PhD', 165437.41, 166.47, 'Female', '1982-09-12', 'https://randomuser.me/api/portraits/women/35.jpg', 'Nurse', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('shanaya.verma.822@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Shanaya', 'Verma', 'PhD', 199616.5, 168.5, 'Female', '2002-08-02', 'https://randomuser.me/api/portraits/women/54.jpg', 'Pharmacist', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kunal.gupta.823@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kunal', 'Gupta', 'High School', 111691.43, 182.26, 'Male', '1983-06-20', 'https://randomuser.me/api/portraits/men/10.jpg', 'Pharmacist', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michelle.pereira.824@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michelle', 'Pereira', 'High School', 189962.31, 165.73, 'Female', '1996-08-19', 'https://randomuser.me/api/portraits/women/39.jpg', 'Accountant', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('daniel.gomes.825@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Daniel', 'Gomes', 'Masters', 36325.93, 173.25, 'Male', '1996-11-24', 'https://randomuser.me/api/portraits/men/65.jpg', 'Nurse', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.bhutia.826@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Bhutia', 'Bachelors', 137095.62, 162.24, 'Male', '1993-10-16', 'https://randomuser.me/api/portraits/men/15.jpg', 'Civil Engineer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.porwal.827@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Porwal', 'Bachelors', 146473.55, 162.35, 'Male', '2003-09-18', 'https://randomuser.me/api/portraits/men/47.jpg', 'Teacher', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.bhutia.828@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Bhutia', 'Masters', 196235.83, 164.27, 'Female', '1991-03-12', 'https://randomuser.me/api/portraits/women/15.jpg', 'Entrepreneur', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.singh.829@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Singh', 'Bachelors', 196205.46, 162.14, 'Male', '1980-06-24', 'https://randomuser.me/api/portraits/men/43.jpg', 'Doctor', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanvi.gupta.830@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanvi', 'Gupta', 'Bachelors', 143517.75, 160.68, 'Female', '2001-02-03', 'https://randomuser.me/api/portraits/women/27.jpg', 'Teacher', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.tamang.831@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Tamang', 'PhD', 178054.17, 160.27, 'Female', '2002-09-28', 'https://randomuser.me/api/portraits/women/63.jpg', 'Data Analyst', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('varun.patel.832@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Varun', 'Patel', 'PhD', 192042.4, 168.66, 'Male', '1991-06-13', 'https://randomuser.me/api/portraits/men/98.jpg', 'Chef', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.gurung.833@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Gurung', 'Bachelors', 126524.26, 172.73, 'Male', '1994-01-17', 'https://randomuser.me/api/portraits/men/24.jpg', 'Accountant', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michael.thomas.834@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michael', 'Thomas', 'PhD', 62218.81, 165.8, 'Male', '1996-03-14', 'https://randomuser.me/api/portraits/men/56.jpg', 'Designer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.gurung.835@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Gurung', 'High School', 48556.85, 176.25, 'Male', '1997-10-02', 'https://randomuser.me/api/portraits/men/74.jpg', 'Teacher', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.porwal.836@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Porwal', 'PhD', 199156.31, 170.75, 'Male', '1987-01-21', 'https://randomuser.me/api/portraits/men/1.jpg', 'Designer', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.agarwal.837@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Agarwal', 'PhD', 189285.02, 152.9, 'Female', '1995-01-15', 'https://randomuser.me/api/portraits/women/80.jpg', 'Entrepreneur', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lhamo.sherpa.838@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lhamo', 'Sherpa', 'Masters', 181368.2, 172.06, 'Female', '1981-08-27', 'https://randomuser.me/api/portraits/women/26.jpg', 'Doctor', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurbir.kaur.839@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurbir', 'Kaur', 'Masters', 78435.79, 189.92, 'Male', '2001-01-01', 'https://randomuser.me/api/portraits/men/45.jpg', 'Teacher', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('james.fernandes.840@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('James', 'Fernandes', 'Bachelors', 76878.46, 162.06, 'Male', '1996-06-08', 'https://randomuser.me/api/portraits/men/12.jpg', 'Doctor', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prabhjot.sandhu.841@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prabhjot', 'Sandhu', 'Bachelors', 143156.82, 155.49, 'Female', '1990-01-17', 'https://randomuser.me/api/portraits/women/57.jpg', 'Software Engineer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.gill.842@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Gill', 'PhD', 131814.11, 181.67, 'Male', '1986-08-13', 'https://randomuser.me/api/portraits/men/34.jpg', 'Marketing Manager', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.ansari.843@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Ansari', 'PhD', 71040.53, 183.84, 'Male', '1989-07-23', 'https://randomuser.me/api/portraits/men/13.jpg', 'Accountant', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananya.agarwal.844@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananya', 'Agarwal', 'Bachelors', 90005.17, 155.02, 'Female', '1987-09-10', 'https://randomuser.me/api/portraits/women/53.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.porwal.845@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Porwal', 'PhD', 161656.59, 179.84, 'Male', '1981-05-17', 'https://randomuser.me/api/portraits/men/4.jpg', 'Lawyer', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.gurung.846@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Gurung', 'PhD', 183132.67, 187.12, 'Male', '1993-06-17', 'https://randomuser.me/api/portraits/men/51.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ali.ali.847@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ali', 'Ali', 'High School', 103668.0, 177.8, 'Male', '1989-11-24', 'https://randomuser.me/api/portraits/men/85.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mary.thomas.848@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mary', 'Thomas', 'Bachelors', 102547.74, 162.67, 'Female', '1990-01-03', 'https://randomuser.me/api/portraits/women/27.jpg', 'Banker', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.singh.849@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Singh', 'Masters', 70335.19, 169.39, 'Female', '1991-03-02', 'https://randomuser.me/api/portraits/women/45.jpg', 'Business Owner', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.sheikh.850@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Sheikh', 'High School', 192683.86, 175.65, 'Male', '2004-04-03', 'https://randomuser.me/api/portraits/men/34.jpg', 'Banker', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('naman.shah.851@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Naman', 'Shah', 'Bachelors', 58427.71, 175.93, 'Male', '1987-02-17', 'https://randomuser.me/api/portraits/men/15.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zainab.ansari.852@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zainab', 'Ansari', 'Masters', 159463.33, 150.09, 'Female', '1996-01-04', 'https://randomuser.me/api/portraits/women/75.jpg', 'Software Engineer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.joshi.853@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Joshi', 'Bachelors', 48858.46, 162.2, 'Female', '1996-07-04', 'https://randomuser.me/api/portraits/women/60.jpg', 'Architect', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.jain.854@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Jain', 'Masters', 159136.05, 178.6, 'Male', '1995-10-27', 'https://randomuser.me/api/portraits/men/86.jpg', 'Business Owner', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.lama.855@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Lama', 'High School', 40959.05, 165.84, 'Female', '1997-02-17', 'https://randomuser.me/api/portraits/women/67.jpg', 'Consultant', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.sherpa.856@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Sherpa', 'PhD', 164866.1, 162.28, 'Female', '1998-06-12', 'https://randomuser.me/api/portraits/women/57.jpg', 'Data Analyst', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ananda.bhutia.857@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ananda', 'Bhutia', 'High School', 98243.27, 166.49, 'Male', '1997-08-25', 'https://randomuser.me/api/portraits/men/82.jpg', 'Consultant', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.desai.858@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Desai', 'High School', 143522.2, 162.18, 'Female', '1995-07-21', 'https://randomuser.me/api/portraits/women/62.jpg', 'Designer', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.gomes.859@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'Gomes', 'Bachelors', 118993.36, 167.0, 'Female', '1994-11-13', 'https://randomuser.me/api/portraits/women/75.jpg', 'Data Analyst', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lhamo.lama.860@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lhamo', 'Lama', 'PhD', 91980.64, 173.35, 'Female', '1987-04-25', 'https://randomuser.me/api/portraits/women/81.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rebecca.gomes.861@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rebecca', 'Gomes', 'High School', 179422.92, 154.32, 'Female', '1994-09-05', 'https://randomuser.me/api/portraits/women/36.jpg', 'Sales Executive', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('luke.gomes.862@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Luke', 'Gomes', 'Masters', 112944.41, 187.6, 'Male', '2002-10-25', 'https://randomuser.me/api/portraits/men/29.jpg', 'Consultant', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.singh.863@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Singh', 'Masters', 116331.92, 166.02, 'Female', '1998-11-22', 'https://randomuser.me/api/portraits/women/71.jpg', 'Data Analyst', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.agarwal.864@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Agarwal', 'High School', 115271.97, 169.58, 'Female', '1990-11-27', 'https://randomuser.me/api/portraits/women/6.jpg', 'Software Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ayaan.sheikh.865@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ayaan', 'Sheikh', 'PhD', 101477.41, 166.14, 'Male', '1993-11-03', 'https://randomuser.me/api/portraits/men/25.jpg', 'Marketing Manager', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.shah.866@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Shah', 'High School', 57799.96, 189.16, 'Male', '2002-09-09', 'https://randomuser.me/api/portraits/men/45.jpg', 'Consultant', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rebecca.d''souza.867@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rebecca', 'D''Souza', 'High School', 30618.55, 151.58, 'Female', '1998-09-27', 'https://randomuser.me/api/portraits/women/75.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.singh.868@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Singh', 'Bachelors', 42402.25, 169.87, 'Female', '1990-12-01', 'https://randomuser.me/api/portraits/women/69.jpg', 'Chef', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.agarwal.869@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Agarwal', 'Bachelors', 163945.73, 182.12, 'Male', '1991-01-15', 'https://randomuser.me/api/portraits/men/63.jpg', 'Lawyer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tanvi.patel.870@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tanvi', 'Patel', 'High School', 147237.14, 151.91, 'Female', '1983-09-21', 'https://randomuser.me/api/portraits/women/46.jpg', 'Banker', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('david.fernandes.871@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('David', 'Fernandes', 'High School', 33983.68, 175.76, 'Male', '1988-07-19', 'https://randomuser.me/api/portraits/men/94.jpg', 'Accountant', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amir.syed.872@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amir', 'Syed', 'High School', 60575.66, 161.67, 'Male', '1998-09-07', 'https://randomuser.me/api/portraits/men/73.jpg', 'Teacher', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.gill.873@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Gill', 'PhD', 59595.88, 164.29, 'Male', '1986-02-07', 'https://randomuser.me/api/portraits/men/39.jpg', 'Business Owner', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.grewal.874@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Grewal', 'Masters', 78319.18, 171.44, 'Female', '1991-06-23', 'https://randomuser.me/api/portraits/women/5.jpg', 'Architect', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kuldeep.kaur.875@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kuldeep', 'Kaur', 'Bachelors', 77489.0, 171.9, 'Male', '1982-05-18', 'https://randomuser.me/api/portraits/men/57.jpg', 'Designer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.iyer.876@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Iyer', 'PhD', 47683.66, 157.03, 'Female', '1990-11-17', 'https://randomuser.me/api/portraits/women/100.jpg', 'Teacher', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('imran.hussain.877@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Imran', 'Hussain', 'Masters', 98832.96, 174.12, 'Male', '1995-01-25', 'https://randomuser.me/api/portraits/men/16.jpg', 'Banker', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.tamang.878@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Tamang', 'Masters', 64250.18, 160.0, 'Female', '1991-09-26', 'https://randomuser.me/api/portraits/women/16.jpg', 'Accountant', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.singh.879@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Singh', 'PhD', 40862.55, 160.6, 'Female', '1993-05-16', 'https://randomuser.me/api/portraits/women/56.jpg', 'Architect', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('paul.thomas.880@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Paul', 'Thomas', 'Masters', 52860.49, 189.49, 'Male', '1986-04-14', 'https://randomuser.me/api/portraits/men/75.jpg', 'Designer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yusuf.ansari.881@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yusuf', 'Ansari', 'High School', 94707.63, 172.96, 'Male', '1990-12-27', 'https://randomuser.me/api/portraits/men/2.jpg', 'Banker', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('daniel.xavier.882@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Daniel', 'Xavier', 'High School', 179711.48, 176.67, 'Male', '1984-12-12', 'https://randomuser.me/api/portraits/men/62.jpg', 'Chef', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('darsh.singh.883@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Darsh', 'Singh', 'Masters', 125076.85, 185.27, 'Male', '1992-06-14', 'https://randomuser.me/api/portraits/men/20.jpg', 'Entrepreneur', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.kaur.884@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Kaur', 'High School', 48035.87, 182.71, 'Male', '1986-11-03', 'https://randomuser.me/api/portraits/men/99.jpg', 'Sales Executive', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.fernandes.885@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Fernandes', 'High School', 176893.88, 177.45, 'Male', '1982-09-16', 'https://randomuser.me/api/portraits/men/88.jpg', 'Civil Engineer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('idris.hassan.886@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Idris', 'Hassan', 'PhD', 193847.35, 177.93, 'Male', '1998-12-07', 'https://randomuser.me/api/portraits/men/96.jpg', 'Teacher', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.sharma.887@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Sharma', 'Masters', 147069.97, 172.47, 'Female', '2001-11-12', 'https://randomuser.me/api/portraits/women/39.jpg', 'Architect', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.888@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'Masters', 54297.65, 168.0, 'Male', '1994-01-17', 'https://randomuser.me/api/portraits/men/17.jpg', 'Data Analyst', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasleen.sidhu.889@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasleen', 'Sidhu', 'Masters', 119610.16, 153.56, 'Female', '1999-09-23', 'https://randomuser.me/api/portraits/women/20.jpg', 'Entrepreneur', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sarah.gomes.890@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sarah', 'Gomes', 'PhD', 82228.66, 152.93, 'Female', '2000-08-20', 'https://randomuser.me/api/portraits/women/82.jpg', 'Doctor', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.bhutia.891@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Bhutia', 'PhD', 126665.87, 165.07, 'Male', '2000-02-13', 'https://randomuser.me/api/portraits/men/91.jpg', 'Civil Engineer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.sherpa.892@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Sherpa', 'Masters', 140070.73, 177.96, 'Male', '1984-10-12', 'https://randomuser.me/api/portraits/men/86.jpg', 'Sales Executive', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vihaan.shah.893@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vihaan', 'Shah', 'Bachelors', 102468.39, 183.15, 'Male', '1993-12-26', 'https://randomuser.me/api/portraits/men/58.jpg', 'Marketing Manager', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('susan.xavier.894@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Susan', 'Xavier', 'Masters', 125466.14, 157.05, 'Female', '1981-10-08', 'https://randomuser.me/api/portraits/women/56.jpg', 'Business Owner', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.jain.895@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Jain', 'Bachelors', 185078.12, 166.79, 'Female', '1994-05-13', 'https://randomuser.me/api/portraits/women/98.jpg', 'Entrepreneur', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.lama.896@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Lama', 'Masters', 147562.27, 184.96, 'Male', '1984-04-02', 'https://randomuser.me/api/portraits/men/48.jpg', 'Nurse', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khadija.ansari.897@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khadija', 'Ansari', 'Bachelors', 178007.61, 158.68, 'Female', '1984-10-18', 'https://randomuser.me/api/portraits/women/32.jpg', 'Designer', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.kaur.898@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Kaur', 'Bachelors', 152644.7, 171.94, 'Male', '1990-12-01', 'https://randomuser.me/api/portraits/men/72.jpg', 'Architect', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ali.khan.899@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ali', 'Khan', 'Bachelors', 137253.56, 173.4, 'Male', '1996-08-07', 'https://randomuser.me/api/portraits/men/78.jpg', 'Marketing Manager', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.khan.900@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Khan', 'Masters', 131149.6, 160.81, 'Male', '1997-12-03', 'https://randomuser.me/api/portraits/men/42.jpg', 'Chef', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditi.iyer.901@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditi', 'Iyer', 'Masters', 131548.32, 166.78, 'Female', '1982-08-20', 'https://randomuser.me/api/portraits/women/50.jpg', 'Pharmacist', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.lama.902@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Lama', 'Masters', 179170.62, 185.07, 'Male', '1984-07-26', 'https://randomuser.me/api/portraits/men/78.jpg', 'Marketing Manager', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('simran.sandhu.903@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Simran', 'Sandhu', 'PhD', 63315.8, 184.32, 'Male', '1994-08-03', 'https://randomuser.me/api/portraits/men/20.jpg', 'Nurse', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('inaya.malik.904@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Inaya', 'Malik', 'Masters', 34442.47, 161.71, 'Female', '1980-07-28', 'https://randomuser.me/api/portraits/women/75.jpg', 'Entrepreneur', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.gurung.905@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Gurung', 'Bachelors', 98296.92, 172.35, 'Female', '1995-10-11', 'https://randomuser.me/api/portraits/women/64.jpg', 'Data Analyst', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.sharma.906@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Sharma', 'PhD', 190834.9, 160.03, 'Female', '2000-01-14', 'https://randomuser.me/api/portraits/women/55.jpg', 'Pharmacist', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.d''souza.907@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'D''Souza', 'PhD', 40719.74, 170.48, 'Female', '1981-11-15', 'https://randomuser.me/api/portraits/women/7.jpg', 'Sales Executive', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.kaur.908@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Kaur', 'Bachelors', 67279.63, 173.38, 'Female', '1997-09-16', 'https://randomuser.me/api/portraits/women/27.jpg', 'Nurse', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sarah.d''souza.909@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sarah', 'D''Souza', 'PhD', 164496.78, 170.3, 'Female', '1998-01-16', 'https://randomuser.me/api/portraits/women/8.jpg', 'Sales Executive', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anna.fernandes.910@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anna', 'Fernandes', 'High School', 43840.06, 161.58, 'Female', '1987-12-27', 'https://randomuser.me/api/portraits/women/55.jpg', 'Pharmacist', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aisha.hussain.911@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aisha', 'Hussain', 'High School', 118427.25, 173.24, 'Female', '1982-06-25', 'https://randomuser.me/api/portraits/women/57.jpg', 'Accountant', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('noor.hassan.912@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Noor', 'Hassan', 'PhD', 93975.51, 174.66, 'Female', '1984-11-24', 'https://randomuser.me/api/portraits/women/94.jpg', 'Marketing Manager', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.jain.913@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Jain', 'PhD', 157543.41, 168.72, 'Male', '2003-04-24', 'https://randomuser.me/api/portraits/men/99.jpg', 'Architect', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.gurung.914@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Gurung', 'PhD', 197446.95, 160.72, 'Female', '2004-09-15', 'https://randomuser.me/api/portraits/women/21.jpg', 'Sales Executive', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ramandeep.singh.915@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ramandeep', 'Singh', 'Bachelors', 60177.06, 170.54, 'Female', '1987-09-21', 'https://randomuser.me/api/portraits/women/71.jpg', 'Civil Engineer', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.xavier.916@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Xavier', 'Bachelors', 163616.71, 177.02, 'Male', '1991-03-18', 'https://randomuser.me/api/portraits/men/99.jpg', 'Sales Executive', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('krishna.nair.917@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Krishna', 'Nair', 'Bachelors', 82096.73, 169.21, 'Male', '1986-07-11', 'https://randomuser.me/api/portraits/men/67.jpg', 'Doctor', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('randeep.sidhu.918@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Randeep', 'Sidhu', 'High School', 72703.79, 170.12, 'Male', '1981-04-27', 'https://randomuser.me/api/portraits/men/86.jpg', 'Data Analyst', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurpreet.sidhu.919@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurpreet', 'Sidhu', 'Bachelors', 124307.8, 160.78, 'Male', '2000-11-05', 'https://randomuser.me/api/portraits/men/60.jpg', 'Lawyer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.shah.920@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Shah', 'High School', 120513.82, 170.79, 'Female', '1999-06-06', 'https://randomuser.me/api/portraits/women/75.jpg', 'Business Owner', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('abdullah.ansari.921@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Abdullah', 'Ansari', 'High School', 61137.87, 188.64, 'Male', '1999-10-05', 'https://randomuser.me/api/portraits/men/63.jpg', 'Sales Executive', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navya.gupta.922@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navya', 'Gupta', 'Bachelors', 119918.68, 165.51, 'Female', '2004-10-21', 'https://randomuser.me/api/portraits/women/49.jpg', 'Civil Engineer', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aaradhya.reddy.923@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aaradhya', 'Reddy', 'PhD', 131904.49, 173.11, 'Female', '2002-10-01', 'https://randomuser.me/api/portraits/women/59.jpg', 'Banker', 'Hindu', 'Reddy', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('amarjeet.kaur.924@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Amarjeet', 'Kaur', 'PhD', 166302.76, 171.81, 'Male', '1986-05-23', 'https://randomuser.me/api/portraits/men/32.jpg', 'Lawyer', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.agarwal.925@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Agarwal', 'High School', 81772.93, 172.92, 'Male', '2003-05-20', 'https://randomuser.me/api/portraits/men/77.jpg', 'Civil Engineer', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.oswal.926@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Oswal', 'High School', 107664.32, 155.57, 'Female', '1989-05-15', 'https://randomuser.me/api/portraits/women/86.jpg', 'Data Analyst', 'Jain', 'Oswal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.gurung.927@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Gurung', 'Bachelors', 127143.9, 172.08, 'Female', '1980-09-24', 'https://randomuser.me/api/portraits/women/48.jpg', 'Entrepreneur', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('matthew.pereira.928@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Matthew', 'Pereira', 'PhD', 37090.22, 177.54, 'Male', '2003-07-08', 'https://randomuser.me/api/portraits/men/93.jpg', 'Designer', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('parth.shah.929@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Parth', 'Shah', 'PhD', 82399.31, 170.34, 'Male', '1989-05-13', 'https://randomuser.me/api/portraits/men/57.jpg', 'Teacher', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('priya.fernandes.930@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Priya', 'Fernandes', 'PhD', 73410.79, 161.06, 'Female', '1983-01-19', 'https://randomuser.me/api/portraits/women/57.jpg', 'Entrepreneur', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mark.xavier.931@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mark', 'Xavier', 'High School', 166067.3, 189.52, 'Male', '1985-08-23', 'https://randomuser.me/api/portraits/men/77.jpg', 'Business Owner', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.hassan.932@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Hassan', 'High School', 165203.55, 154.46, 'Female', '1988-07-23', 'https://randomuser.me/api/portraits/women/75.jpg', 'Civil Engineer', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('angel.rodrigues.933@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Angel', 'Rodrigues', 'PhD', 163703.41, 156.17, 'Female', '1996-08-22', 'https://randomuser.me/api/portraits/women/57.jpg', 'Designer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bilal.sheikh.934@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bilal', 'Sheikh', 'PhD', 125317.52, 184.0, 'Male', '1981-01-08', 'https://randomuser.me/api/portraits/men/31.jpg', 'Marketing Manager', 'Muslim', 'Pathan', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yasmin.sheikh.935@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yasmin', 'Sheikh', 'PhD', 77565.35, 172.49, 'Female', '1993-11-27', 'https://randomuser.me/api/portraits/women/41.jpg', 'Data Analyst', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.lama.936@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Lama', 'Masters', 122194.21, 172.54, 'Male', '2004-01-28', 'https://randomuser.me/api/portraits/men/13.jpg', 'Nurse', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sana.ansari.937@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sana', 'Ansari', 'High School', 61055.32, 154.81, 'Female', '1986-10-25', 'https://randomuser.me/api/portraits/women/52.jpg', 'Consultant', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dekyi.bhutia.938@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dekyi', 'Bhutia', 'Bachelors', 43335.24, 173.3, 'Female', '1996-07-12', 'https://randomuser.me/api/portraits/women/12.jpg', 'Chef', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.jain.939@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Jain', 'PhD', 193259.88, 174.13, 'Male', '1999-07-27', 'https://randomuser.me/api/portraits/men/60.jpg', 'Nurse', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.syed.940@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Syed', 'Bachelors', 157091.92, 181.74, 'Male', '1997-02-21', 'https://randomuser.me/api/portraits/men/34.jpg', 'Designer', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khushi.porwal.941@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khushi', 'Porwal', 'Bachelors', 106913.26, 168.57, 'Female', '1981-07-25', 'https://randomuser.me/api/portraits/women/75.jpg', 'Consultant', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('kavya.gupta.942@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Kavya', 'Gupta', 'High School', 161815.96, 164.71, 'Female', '2000-12-15', 'https://randomuser.me/api/portraits/women/24.jpg', 'Pharmacist', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('dharmesh.tamang.943@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Dharmesh', 'Tamang', 'Bachelors', 63798.13, 177.01, 'Male', '1990-12-15', 'https://randomuser.me/api/portraits/men/7.jpg', 'Pharmacist', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ali.ansari.944@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ali', 'Ansari', 'Masters', 195112.6, 174.18, 'Male', '1989-12-05', 'https://randomuser.me/api/portraits/men/75.jpg', 'Civil Engineer', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aisha.ansari.945@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aisha', 'Ansari', 'High School', 128050.4, 155.57, 'Female', '2000-04-13', 'https://randomuser.me/api/portraits/women/1.jpg', 'Architect', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('diya.shah.946@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Diya', 'Shah', 'High School', 132773.41, 165.2, 'Female', '1994-07-09', 'https://randomuser.me/api/portraits/women/6.jpg', 'Architect', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('hiba.ali.947@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Hiba', 'Ali', 'PhD', 58167.61, 168.82, 'Female', '1985-02-09', 'https://randomuser.me/api/portraits/women/97.jpg', 'Lawyer', 'Muslim', 'Syed', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.sandhu.948@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Sandhu', 'Bachelors', 112275.09, 189.44, 'Male', '1980-01-24', 'https://randomuser.me/api/portraits/men/94.jpg', 'Business Owner', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('laksh.reddy.949@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Laksh', 'Reddy', 'Bachelors', 114167.66, 173.19, 'Male', '1998-02-21', 'https://randomuser.me/api/portraits/men/6.jpg', 'Teacher', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('bodhi.tamang.950@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Bodhi', 'Tamang', 'Bachelors', 115135.83, 184.16, 'Male', '1980-07-10', 'https://randomuser.me/api/portraits/men/53.jpg', 'Architect', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rajveer.grewal.951@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rajveer', 'Grewal', 'PhD', 103092.07, 167.7, 'Male', '1987-04-14', 'https://randomuser.me/api/portraits/men/32.jpg', 'Pharmacist', 'Sikh', 'Kamboj', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('khadija.ahmed.952@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Khadija', 'Ahmed', 'Bachelors', 112386.02, 158.66, 'Female', '1999-08-12', 'https://randomuser.me/api/portraits/women/76.jpg', 'Chef', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.patel.953@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Patel', 'High School', 161949.0, 167.05, 'Female', '1990-02-01', 'https://randomuser.me/api/portraits/women/34.jpg', 'Sales Executive', 'Hindu', 'Kayastha', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('grace.gomes.954@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Grace', 'Gomes', 'High School', 34559.63, 174.28, 'Female', '1987-02-16', 'https://randomuser.me/api/portraits/women/13.jpg', 'Civil Engineer', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gurleen.brar.955@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gurleen', 'Brar', 'High School', 116869.03, 150.76, 'Female', '2003-10-17', 'https://randomuser.me/api/portraits/women/63.jpg', 'Lawyer', 'Sikh', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('atharv.joshi.956@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Atharv', 'Joshi', 'High School', 30524.99, 166.78, 'Male', '1984-02-05', 'https://randomuser.me/api/portraits/men/54.jpg', 'Chef', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harmeet.dhillon.957@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harmeet', 'Dhillon', 'PhD', 151727.12, 176.5, 'Male', '1997-08-08', 'https://randomuser.me/api/portraits/men/58.jpg', 'Teacher', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditi.iyer.958@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditi', 'Iyer', 'High School', 159727.78, 168.57, 'Female', '1997-12-23', 'https://randomuser.me/api/portraits/women/42.jpg', 'Sales Executive', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pranav.nair.959@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pranav', 'Nair', 'High School', 76433.5, 175.07, 'Male', '1994-10-02', 'https://randomuser.me/api/portraits/men/46.jpg', 'Teacher', 'Hindu', 'Rajput', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('prisha.jain.960@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Prisha', 'Jain', 'High School', 94638.11, 173.43, 'Female', '1988-02-13', 'https://randomuser.me/api/portraits/women/59.jpg', 'Lawyer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karim.hussain.961@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karim', 'Hussain', 'Bachelors', 106133.86, 170.63, 'Male', '1989-02-01', 'https://randomuser.me/api/portraits/men/27.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.shah.962@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Shah', 'PhD', 160133.1, 189.07, 'Male', '1994-06-05', 'https://randomuser.me/api/portraits/men/18.jpg', 'Nurse', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jasmine.fernandes.963@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jasmine', 'Fernandes', 'Masters', 104073.33, 152.39, 'Female', '1991-01-12', 'https://randomuser.me/api/portraits/women/61.jpg', 'Teacher', 'Christian', 'Latin Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pihu.sharma.964@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pihu', 'Sharma', 'PhD', 164368.99, 159.34, 'Female', '1998-11-20', 'https://randomuser.me/api/portraits/women/4.jpg', 'Architect', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('john.d''souza.965@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('John', 'D''Souza', 'High School', 171966.07, 186.72, 'Male', '2003-01-01', 'https://randomuser.me/api/portraits/men/97.jpg', 'Software Engineer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('aditya.porwal.966@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Aditya', 'Porwal', 'Masters', 91091.59, 183.26, 'Male', '1982-09-24', 'https://randomuser.me/api/portraits/men/93.jpg', 'Nurse', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mahavir.agarwal.967@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mahavir', 'Agarwal', 'PhD', 155820.55, 185.92, 'Male', '2000-11-13', 'https://randomuser.me/api/portraits/men/34.jpg', 'Doctor', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('karma.gurung.968@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Karma', 'Gurung', 'High School', 108032.95, 181.64, 'Male', '1989-03-17', 'https://randomuser.me/api/portraits/men/65.jpg', 'Sales Executive', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('anika.sharma.969@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Anika', 'Sharma', 'High School', 159186.26, 153.47, 'Female', '2001-10-11', 'https://randomuser.me/api/portraits/women/85.jpg', 'Designer', 'Hindu', 'Brahmin', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('saanvi.porwal.970@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Saanvi', 'Porwal', 'High School', 81470.96, 161.79, 'Female', '1988-01-01', 'https://randomuser.me/api/portraits/women/7.jpg', 'Entrepreneur', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pooja.singh.971@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pooja', 'Singh', 'High School', 128763.26, 156.15, 'Female', '1999-08-15', 'https://randomuser.me/api/portraits/women/100.jpg', 'Consultant', 'Hindu', 'Jat', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.porwal.972@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Porwal', 'Masters', 85816.71, 162.13, 'Male', '1995-04-19', 'https://randomuser.me/api/portraits/men/72.jpg', 'Civil Engineer', 'Jain', 'Shrimal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ishita.nair.973@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ishita', 'Nair', 'Bachelors', 134285.82, 164.33, 'Female', '1996-07-06', 'https://randomuser.me/api/portraits/women/66.jpg', 'Entrepreneur', 'Hindu', 'Nair', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yusuf.malik.974@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yusuf', 'Malik', 'Bachelors', 170487.68, 176.29, 'Male', '2001-03-07', 'https://randomuser.me/api/portraits/men/6.jpg', 'Consultant', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('john.fernandes.975@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('John', 'Fernandes', 'High School', 168664.06, 177.98, 'Male', '1988-05-28', 'https://randomuser.me/api/portraits/men/42.jpg', 'Marketing Manager', 'Christian', 'Roman Catholic', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('advik.reddy.976@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Advik', 'Reddy', 'Masters', 133532.55, 182.11, 'Male', '1989-08-23', 'https://randomuser.me/api/portraits/men/64.jpg', 'Teacher', 'Hindu', 'Vaishya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('pema.sherpa.977@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Pema', 'Sherpa', 'Masters', 132263.63, 155.54, 'Female', '1985-12-02', 'https://randomuser.me/api/portraits/women/34.jpg', 'Lawyer', 'Buddhist', 'Bhotiya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('param.desai.978@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Param', 'Desai', 'Bachelors', 174731.14, 167.77, 'Male', '1995-04-18', 'https://randomuser.me/api/portraits/men/23.jpg', 'Banker', 'Hindu', 'Kshatriya', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('harpreet.grewal.979@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Harpreet', 'Grewal', 'High School', 86538.4, 162.8, 'Male', '1981-03-07', 'https://randomuser.me/api/portraits/men/26.jpg', 'Banker', 'Sikh', 'Ramgarhia', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sara.malik.980@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sara', 'Malik', 'PhD', 117084.78, 158.68, 'Female', '1986-12-22', 'https://randomuser.me/api/portraits/women/91.jpg', 'Consultant', 'Muslim', 'Qureshi', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tsering.sherpa.981@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tsering', 'Sherpa', 'High School', 177259.08, 161.17, 'Female', '1984-03-27', 'https://randomuser.me/api/portraits/women/17.jpg', 'Designer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yangchen.tamang.982@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yangchen', 'Tamang', 'Bachelors', 95907.74, 164.95, 'Female', '1994-10-11', 'https://randomuser.me/api/portraits/women/72.jpg', 'Accountant', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('esther.thomas.983@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Esther', 'Thomas', 'PhD', 153846.03, 153.46, 'Female', '1994-01-08', 'https://randomuser.me/api/portraits/women/11.jpg', 'Banker', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('michael.fernandes.984@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Michael', 'Fernandes', 'Bachelors', 154545.65, 161.61, 'Male', '1987-05-28', 'https://randomuser.me/api/portraits/men/61.jpg', 'Designer', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.lama.985@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Lama', 'Bachelors', 167281.87, 164.1, 'Male', '1980-01-12', 'https://randomuser.me/api/portraits/men/25.jpg', 'Chef', 'Buddhist', 'Chamar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('lobsang.tamang.986@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Lobsang', 'Tamang', 'PhD', 120782.97, 182.42, 'Male', '1997-07-02', 'https://randomuser.me/api/portraits/men/90.jpg', 'Architect', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tenzin.gurung.987@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tenzin', 'Gurung', 'High School', 108688.31, 168.67, 'Male', '1989-01-16', 'https://randomuser.me/api/portraits/men/21.jpg', 'Pharmacist', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('manpreet.dhillon.988@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Manpreet', 'Dhillon', 'PhD', 143593.55, 157.42, 'Female', '1987-12-08', 'https://randomuser.me/api/portraits/women/88.jpg', 'Doctor', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ruth.pereira.989@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ruth', 'Pereira', 'PhD', 39186.0, 155.93, 'Female', '1998-08-23', 'https://randomuser.me/api/portraits/women/65.jpg', 'Lawyer', 'Christian', 'Syrian Christian', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('tara.sherpa.990@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Tara', 'Sherpa', 'PhD', 71075.33, 162.25, 'Female', '2001-09-19', 'https://randomuser.me/api/portraits/women/82.jpg', 'Software Engineer', 'Buddhist', 'Mahar', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('gautam.tamang.991@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Gautam', 'Tamang', 'Masters', 154039.3, 184.68, 'Male', '1996-10-10', 'https://randomuser.me/api/portraits/men/48.jpg', 'Civil Engineer', 'Buddhist', 'Tamang', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('jaspreet.kaur.992@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Jaspreet', 'Kaur', 'PhD', 125954.23, 174.31, 'Female', '1990-12-15', 'https://randomuser.me/api/portraits/women/47.jpg', 'Data Analyst', 'Sikh', 'Arora', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('mohammed.hussain.993@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Mohammed', 'Hussain', 'Bachelors', 96799.31, 170.7, 'Male', '1987-02-18', 'https://randomuser.me/api/portraits/men/97.jpg', 'Chef', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('rishabh.oswal.994@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Rishabh', 'Oswal', 'High School', 136099.61, 175.65, 'Male', '1997-01-26', 'https://randomuser.me/api/portraits/men/99.jpg', 'Software Engineer', 'Jain', 'Porwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('sarah.xavier.995@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Sarah', 'Xavier', 'Masters', 100573.1, 154.01, 'Female', '1992-09-10', 'https://randomuser.me/api/portraits/women/46.jpg', 'Teacher', 'Christian', 'Protestant', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('zara.khan.996@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Zara', 'Khan', 'Bachelors', 197276.9, 164.28, 'Female', '1986-07-23', 'https://randomuser.me/api/portraits/women/47.jpg', 'Banker', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('ahmed.hussain.997@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Ahmed', 'Hussain', 'Masters', 116752.42, 178.67, 'Male', '2000-03-19', 'https://randomuser.me/api/portraits/men/93.jpg', 'Doctor', 'Muslim', 'Ansari', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('vivaan.porwal.998@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Vivaan', 'Porwal', 'High School', 72779.3, 168.05, 'Male', '2004-06-22', 'https://randomuser.me/api/portraits/men/34.jpg', 'Nurse', 'Jain', 'Agarwal', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('yasmin.khan.999@yahoo.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Yasmin', 'Khan', 'Bachelors', 93301.19, 173.36, 'Female', '1981-06-28', 'https://randomuser.me/api/portraits/women/49.jpg', 'Banker', 'Muslim', 'Sheikh', v_user_id);

    INSERT INTO users (email, password, subscription_id) VALUES ('navleen.gill.1000@gmail.com', '$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e', v_free_subscription_id) RETURNING user_id INTO v_user_id;
    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ('Navleen', 'Gill', 'Masters', 41532.06, 169.12, 'Female', '1995-10-01', 'https://randomuser.me/api/portraits/women/83.jpg', 'Designer', 'Sikh', 'Jat', v_user_id);

END $$;;
