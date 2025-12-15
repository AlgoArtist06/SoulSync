#!/usr/bin/env python3
import subprocess
import sys

# Install bcrypt if needed
try:
    import bcrypt
except ImportError:
    print("Installing bcrypt...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "bcrypt"])
    import bcrypt

# Generate hash for password123
password = b'password123'
hashed = bcrypt.hashpw(password, bcrypt.gensalt(10))

print("="*60)
print("BCrypt Hash Generator for SoulSync")
print("="*60)
print(f"Password: password123")
print(f"Hash: {hashed.decode('utf-8')}")
print(f"Length: {len(hashed.decode('utf-8'))} characters")
print("="*60)
print("\nCopy this hash to generate_profiles.py:")
print(f'return "{hashed.decode("utf-8")}"')
print("="*60)
