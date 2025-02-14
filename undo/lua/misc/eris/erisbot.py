# ~/.config/nvim/lua/my_chatbot_plugin/chatbot.py

# Your chatbot code here

def main():
    while True:
        user_input = input("You: ")
        if user_input.lower() in ["exit", "quit"]:
            break
        response = f"Eris: {user_input[::-1]}"  # Example response: reversing the input
        print(response)

if __name__ == "__main__":
    main()

