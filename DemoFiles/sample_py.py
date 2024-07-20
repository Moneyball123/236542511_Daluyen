# Simple login system in Python

# Predefined username and password pairs
users = {
    "user1": "password123",
    "user2": "mypassword"
}

def login():
    print("Welcome! Please Sign in")

    # Prompt for username and password
    username = input("Enter username: ")
    password = input("Enter password: ")

    # Check if the username exists and the password matches
    if username in users and users[username] == password:
        print("Login successful!")
    else:
        print("Invalid username or password.")

# Run the login function
if __name__ == "__main__":
    login()
