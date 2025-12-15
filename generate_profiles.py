import random
from datetime import datetime
import bcrypt

# Configuration
NUM_PROFILES = 1000
OUTPUT_FILE = "seed_data.sql"

# Data pools
GENDERS = ["Male", "Female"]
RELIGIONS = ["Hindu", "Muslim", "Christian", "Sikh", "Buddhist", "Jain"]
EDUCATION_LEVELS = ["High School", "Bachelors", "Masters", "PhD"]

# Religion-specific first names
HINDU_MALE_NAMES = [
    "Aarav", "Vivaan", "Aditya", "Vihaan", "Arjun", "Sai", "Arnav", "Krishna", "Ishaan",
    "Shaurya", "Atharv", "Advik", "Pranav", "Dhruv", "Aryan", "Yash", "Advait", "Shlok", "Rudra",
    "Reyansh", "Kabir", "Param", "Ansh", "Tanish", "Darsh", "Laksh", "Madhav", "Kiaan",
    "Rohan", "Rishi", "Karthik", "Nikhil", "Rahul", "Akash", "Varun", "Kunal", "Dev"
]

HINDU_FEMALE_NAMES = [
    "Saanvi", "Aadhya", "Diya", "Pihu", "Ananya", "Navya", "Pari", "Aaradhya",
    "Anika", "Myra", "Avni", "Prisha", "Riya", "Ishita", "Sneha", "Tanvi", "Kavya",
    "Siya", "Aditi", "Khushi", "Shanaya", "Mira", "Nisha", "Pooja", "Shreya", "Tara"
]

MUSLIM_MALE_NAMES = [
    "Mohammed", "Ahmed", "Ali", "Hassan", "Hussain", "Omar", "Bilal", "Ibrahim", "Yusuf",
    "Abdullah", "Zain", "Rayan", "Ayaan", "Amir", "Arhan", "Idris", "Imran", "Karim"
]

MUSLIM_FEMALE_NAMES = [
    "Fatima", "Aisha", "Zainab", "Maryam", "Khadija", "Sara", "Amina", "Laila", "Noor",
    "Hiba", "Safiya", "Yasmin", "Aaliyah", "Inaya", "Mariam", "Sana", "Zara", "Ayesha"
]

CHRISTIAN_MALE_NAMES = [
    "John", "David", "Joseph", "James", "Daniel", "Michael", "Thomas", "Paul", "Peter",
    "Samuel", "Matthew", "Mark", "Luke", "Andrew", "Benjamin", "Joshua", "Christopher"
]

CHRISTIAN_FEMALE_NAMES = [
    "Mary", "Sarah", "Anna", "Elizabeth", "Grace", "Ruth", "Esther", "Hannah", "Rebecca",
    "Rachel", "Martha", "Priya", "Susan", "Angel", "Michelle", "Jasmine", "Jennifer"
]

SIKH_MALE_NAMES = [
    "Harpreet", "Gurpreet", "Amarjeet", "Jaspreet", "Manpreet", "Navdeep", "Simran",
    "Rajveer", "Jaskaran", "Paramjit", "Gurbir", "Harmeet", "Kuldeep", "Randeep"
]

SIKH_FEMALE_NAMES = [
    "Simran", "Harleen", "Jasleen", "Navleen", "Manpreet", "Jaspreet", "Gurleen",
    "Amandeep", "Kiranpreet", "Prabhjot", "Ramandeep", "Sandeep", "Taranjot"
]

BUDDHIST_MALE_NAMES = ["Ananda", "Bodhi", "Dharmesh", "Gautam", "Karma", "Tenzin", "Lobsang"]
BUDDHIST_FEMALE_NAMES = ["Dolma", "Tara", "Pema", "Yangchen", "Dekyi", "Lhamo", "Tsering"]

JAIN_MALE_NAMES = ["Mahavir", "Rishabh", "Parth", "Aditya", "Naman", "Vihaan", "Vivaan"]
JAIN_FEMALE_NAMES = ["Ananya", "Diya", "Khushi", "Mira", "Prisha", "Riya", "Saanvi"]

LAST_NAMES = {
    "Hindu": ["Sharma", "Verma", "Singh", "Patel", "Gupta", "Desai", "Reddy", "Nair", "Iyer", "Joshi"],
    "Muslim": ["Khan", "Ali", "Ahmed", "Hassan", "Hussain", "Malik", "Sheikh", "Syed", "Ansari"],
    "Christian": ["D'Souza", "Fernandes", "Pereira", "Rodrigues", "Gomes", "Xavier", "Thomas"],
    "Sikh": ["Singh", "Kaur", "Gill", "Dhillon", "Sandhu", "Sidhu", "Brar", "Grewal"],
    "Buddhist": ["Tamang", "Gurung", "Lama", "Sherpa", "Bhutia"],
    "Jain": ["Jain", "Shah", "Agarwal", "Oswal", "Porwal"]
}

OCCUPATIONS = [
    "Software Engineer", "Doctor", "Teacher", "Business Owner", "Accountant", "Lawyer", "Architect",
    "Nurse", "Marketing Manager", "Sales Executive", "Data Analyst", "Civil Engineer",
    "Pharmacist", "Banker", "Consultant", "Designer", "Chef", "Entrepreneur"
]

HINDU_CASTES = ["Brahmin", "Kshatriya", "Vaishya", "Kayastha", "Rajput", "Jat", "Reddy", "Nair"]
MUSLIM_CASTES = ["Syed", "Sheikh", "Pathan", "Ansari", "Qureshi"]
CHRISTIAN_CASTES = ["Roman Catholic", "Protestant", "Latin Catholic", "Syrian Christian"]
SIKH_CASTES = ["Jat", "Kamboj", "Ramgarhia", "Arora"]
BUDDHIST_CASTES = ["Mahar", "Chamar", "Bhotiya", "Tamang"]
JAIN_CASTES = ["Agarwal", "Oswal", "Porwal", "Shrimal"]

def get_caste_for_religion(religion):
    caste_map = {
        "Hindu": HINDU_CASTES, "Muslim": MUSLIM_CASTES, "Christian": CHRISTIAN_CASTES,
        "Sikh": SIKH_CASTES, "Buddhist": BUDDHIST_CASTES, "Jain": JAIN_CASTES
    }
    return random.choice(caste_map.get(religion, ["General"]))

def get_name_for_religion_gender(religion, gender):
    name_map = {
        "Hindu": {"Male": HINDU_MALE_NAMES, "Female": HINDU_FEMALE_NAMES},
        "Muslim": {"Male": MUSLIM_MALE_NAMES, "Female": MUSLIM_FEMALE_NAMES},
        "Christian": {"Male": CHRISTIAN_MALE_NAMES, "Female": CHRISTIAN_FEMALE_NAMES},
        "Sikh": {"Male": SIKH_MALE_NAMES, "Female": SIKH_FEMALE_NAMES},
        "Buddhist": {"Male": BUDDHIST_MALE_NAMES, "Female": BUDDHIST_FEMALE_NAMES},
        "Jain": {"Male": JAIN_MALE_NAMES, "Female": JAIN_FEMALE_NAMES}
    }
    return random.choice(name_map.get(religion, {}).get(gender, HINDU_MALE_NAMES))

def get_last_name_for_religion(religion):
    return random.choice(LAST_NAMES.get(religion, LAST_NAMES["Hindu"]))

def generate_dob():
    current_year = datetime.now().year
    birth_year = current_year - random.randint(21, 45)
    return f"{birth_year}-{random.randint(1,12):02d}-{random.randint(1,28):02d}"

def generate_email(first_name, last_name, index):
    return f"{first_name.lower()}.{last_name.lower()}.{index}@{random.choice(['gmail.com', 'yahoo.com'])}"

def hash_password():
    # Valid BCrypt hash for 'password123'
    return "$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e"

def generate_photo_url(gender, index):
    seed = random.randint(1, 100)
    return f"https://randomuser.me/api/portraits/{('men' if gender == 'Male' else 'women')}/{seed}.jpg"

def generate_profiles(num_profiles):
    profiles_data = []
    for i in range(1, num_profiles + 1):
        gender = random.choice(GENDERS)
        religion = random.choice(RELIGIONS)
        first_name = get_name_for_religion_gender(religion, gender)
        last_name = get_last_name_for_religion(religion)
        
        profiles_data.append({
            'email': generate_email(first_name, last_name, i),
            'password': hash_password(),
            'first_name': first_name,
            'last_name': last_name,
            'dob': generate_dob(),
            'gender': gender,
            'education': random.choice(EDUCATION_LEVELS),
            'monthly_income': round(random.uniform(30000, 200000), 2),
            'height': round(random.uniform(160, 190) if gender == "Male" else random.uniform(150, 175), 2),
            'occupation': random.choice(OCCUPATIONS),
            'religion': religion,
            'caste': get_caste_for_religion(religion),
            'photo_url': generate_photo_url(gender, i)
        })
    return profiles_data

def escape_sql(value):
    if isinstance(value, str):
        return value.replace("'", "''")
    return value

def create_sql_file(profiles_data, output_file):
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("-- SoulSync Database Seed Data\n")
        f.write(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write("DO $$\nDECLARE\n    v_user_id BIGINT;\n    v_free_subscription_id BIGINT;\nBEGIN\n")
        f.write("    SELECT subscription_id INTO v_free_subscription_id FROM subscriptions WHERE subscription_name = 'FREE' LIMIT 1;\n\n")
        
        for idx, p in enumerate(profiles_data, 1):
            f.write(f"    INSERT INTO users (email, password, subscription_id) VALUES ('{escape_sql(p['email'])}', '{escape_sql(p['password'])}', v_free_subscription_id) RETURNING user_id INTO v_user_id;\n")
            f.write(f"    INSERT INTO profiles (first_name, last_name, education, monthly_income, height, gender, dob, photo_url, occupation, religion, caste, user_id) VALUES ")
            f.write(f"('{escape_sql(p['first_name'])}', '{escape_sql(p['last_name'])}', '{escape_sql(p['education'])}', {p['monthly_income']}, {p['height']}, '{escape_sql(p['gender'])}', '{p['dob']}', '{escape_sql(p['photo_url'])}', '{escape_sql(p['occupation'])}', '{escape_sql(p['religion'])}', '{escape_sql(p['caste'])}', v_user_id);\n\n")
            
        f.write("END $$;\n")

if __name__ == "__main__":
    print("Generating profiles...")
    profiles = generate_profiles(NUM_PROFILES)
    create_sql_file(profiles, OUTPUT_FILE)
    print(f"Done! Created {OUTPUT_FILE}")
