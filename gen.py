import requests
import json
import random
import string
import threading
import time

# Load configuration from config.json
with open("config.json", "r") as f:
    config = json.load(f)

# Load proxies from proxies.txt
with open("proxies.txt", "r") as f:
    proxies = f.readlines()

# Load usernames from usernames.txt
with open("usernames.txt", "r") as f:
    usernames = f.readlines()

# Load tokens from tokens.txt
with open("tokens.txt", "r") as f:
    tokens = f.readlines()

# Load accounts from accounts.txt
with open("accounts.txt", "r") as f:
    accounts = f.readlines()

# Define a function to generate a new account
def generate_account():
    # Choose a random proxy
    proxy = random.choice(proxies).strip()

    # Choose a random username
    username = random.choice(usernames).strip()

    # Choose a random token
    token = random.choice(tokens).strip()

    # Choose a random account
    account = random.choice(accounts).strip()

    # Create a new account
    url = "https://discord.com/api/v9/auth/register"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36",
        "Content-Type": "application/json"
    }
    data = {
        "captcha_key": config["capmonster_key"],
        "invite_code": config["invite_code"],
        "password": config["password"],
        "username": username,
        "token": token,
        "account": account
    }
    response = requests.post(url, headers=headers, json=data, proxies={"http": proxy, "https": proxy})

    # Check if the account was created successfully
    if response.status_code == 201:
        print(f"Account created successfully: {username}")
    else:
        print(f"Failed to create account: {username}")

# Define a function to start the account generator
def start_generator():
    # Create a new thread for each account
    threads = []
    for i in range(config["num_accounts"]):
        thread = threading.Thread(target=generate_account)
        threads.append(thread)
        thread.start()

    # Wait for all threads to finish
    for thread in threads:
        thread.join()

# Start the account generator
start_generator()
