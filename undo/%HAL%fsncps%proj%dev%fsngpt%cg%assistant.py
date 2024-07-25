Vim�UnDo� |�(��.^ nѷ!b�gȯc��<G"C���]f   �   4            if user_input.lower() in ['help', 'assis   _   3                       f��>    _�                             ����                                                                                                                                                                                                                                                                                                                                      �           V       f��Y    �                   �               �              �   	import os   import json   import random   import textwrap   from openai import OpenAI       # Initialize OpenAI client   4client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))       class OpenAIAssistant:   2    def __init__(self, config_file="config.json"):   %        self.load_config(config_file)   M        self.conversation = [{"role": "system", "content": self.system_info}]   <        self.add_message("assistant", self.greeting_message)          '    def load_config(self, config_file):   ,        with open(config_file, 'r') as file:   $            config = json.load(file)   5            self.model = config.get("model", "gpt-4")   =            self.temperature = config.get("temperature", 0.7)   ;            self.max_tokens = config.get("max_tokens", 150)   1            self.top_p = config.get("top_p", 1.0)   G            self.presence_penalty = config.get("presence_penalty", 0.0)   I            self.frequency_penalty = config.get("frequency_penalty", 0.0)   <            self.user_name = config.get("user_name", "User")   K            self.assistant_name = config.get("assistant_name", "Assistant")   h            self.greeting_message = config.get("greeting_message", "Hello! How can I assist you today?")   >            self.focus_topics = config.get("focus_topics", [])   J            self.system_info = config.get("system_info", "Unknown system")   B            self.stop_sequences = config.get("stop_sequences", [])   B            self.custom_prompts = config.get("custom_prompts", {})   N            self.general_instructions = config.get("general_instructions", "")   \            self.error_handling_instructions = config.get("error_handling_instructions", "")   D            self.response_length = config.get("response_length", "")   Z            self.task_specific_instructions = config.get("task_specific_instructions", {})          �    def set_parameters(self, model=None, temperature=None, user_name=None, assistant_name=None, greeting_message=None, focus_topics=None, system_info=None):           if model:               self.model = model   #        if temperature is not None:   *            self.temperature = temperature           if user_name:   &            self.user_name = user_name           if assistant_name:   0            self.assistant_name = assistant_name           if greeting_message:   4            self.greeting_message = greeting_message           if focus_topics:   ,            self.focus_topics = focus_topics           if system_info:   *            self.system_info = system_info          )    def add_message(self, role, content):   D        self.conversation.append({"role": role, "content": content})              def get_response(self):   2        response = client.chat.completions.create(               model=self.model,   '            messages=self.conversation,   )            temperature=self.temperature,   '            max_tokens=self.max_tokens,               top_p=self.top_p,   3            presence_penalty=self.presence_penalty,   5            frequency_penalty=self.frequency_penalty,   $            stop=self.stop_sequences   	        )   2        return response.choices[0].message.content          >    def save_conversation(self, filename="data/prompts.json"):   )        with open(filename, 'w') as file:   8            json.dump(self.conversation, file, indent=4)       >    def load_conversation(self, filename="data/prompts.json"):   )        with open(filename, 'r') as file:   /            self.conversation = json.load(file)       (    def format_response(self, response):   >        # Use textwrap to format the response for the terminal   0        wrapper = textwrap.TextWrapper(width=80)   3        formatted_response = wrapper.fill(response)              A        # Additional formatting for code blocks and bullet points   ]        formatted_response = formatted_response.replace('```', '\n```').replace('* ', '\n* ')              !        return formatted_response              def chat(self):   $        print(self.greeting_message)           while True:   5            user_input = input(f"{self.user_name}: ")   6            if user_input.lower() in ['exit', 'quit']:   !                print("Goodbye!")                   break                  8            if user_input.lower() in ['help', 'assist']:   q                help_message = random.choice(self.custom_prompts.get("help_messages", ["How can I assist you?"]))   #                print(help_message)                   continue       .            # Add user message to conversation   0            self.add_message("user", user_input)       O            # Add system-level instructions to guide the assistant contextually   A            self.add_message("system", self.general_instructions)   H            self.add_message("system", self.error_handling_instructions)   <            self.add_message("system", self.response_length)   d            self.add_message("system", self.task_specific_instructions.get("computer_problems", ""))   h            self.add_message("system", self.task_specific_instructions.get("motivational_messages", ""))       0            # Get and print assistant's response   *            response = self.get_response()   ?            formatted_response = self.format_response(response)   A            print(f"{self.assistant_name}: {formatted_response}")   3            self.add_message("assistant", response)       if __name__ == "__main__":   !    assistant = OpenAIAssistant()       *    # Load previous conversation if needed       try:   %        assistant.load_conversation()       except FileNotFoundError:           pass           # Start interactive chat       assistant.chat()           # Save conversation   !    assistant.save_conversation()    5��            �                      	             �                    #                       �      5�_�                            ����                                                                                                                                                                                                                                                                                                                            $                      v        f��u    �   ^              4            if user_input.lower() in ['help', 'assis�   _            �                   �               �               $   	import os   import json   import random   import textwrap   from openai import OpenAI       # Initialize OpenAI client   4client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))       class OpenAIAssistant:   2    def __init__(self, config_file="config.json"):   %        self.load_config(config_file)   M        self.conversation = [{"role": "system", "content": self.system_info}]   <        self.add_message("assistant", self.greeting_message)          '    def load_config(self, config_file):   ,        with open(config_file, 'r') as file:   $            config = json.load(file)   5            self.model = config.get("model", "gpt-4")   =            self.temperature = config.get("temperature", 0.7)   ;            self.max_tokens = config.get("max_tokens", 150)   1            self.top_p = config.get("top_p", 1.0)   G            self.presence_penalty = config.get("presence_penalty", 0.0)   I            self.frequency_penalty = config.get("frequency_penalty", 0.0)   <            self.user_name = config.get("user_name", "User")   K            self.assistant_name = config.get("assistant_name", "Assistant")   h            self.greeting_message = config.get("greeting_message", "Hello! How can I assist you today?")   >            self.focus_topics = config.get("focus_topics", [])   J            self.system_info = config.get("system_info", "Unknown system")   B            self.stop_sequences = config.get("stop_sequences", [])   B            self.custom_prompts = config.get("custom_prompts", {})   N            self.general_instructions = config.get("general_instructions", "")   \            self.error_handling_instructions = config.get("error_handling_instructions", "")   D            self.response_length = config.get("response_length", "")   S            self.task_specific_instructions = config.get("task_specific_instruction    5��            #                       �              �                    ^   4                   �      �    ^   4           #       �              A      5�_�                             ����                                                                                                                                                                                                                                                                                                                                      �           V       f��=    �   ^              4            if user_input.lower() in ['help', 'assis�   _            �                   �               �              �   	import os   import json   import random   import textwrap   from openai import OpenAI       # Initialize OpenAI client   4client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))       class OpenAIAssistant:   2    def __init__(self, config_file="config.json"):   %        self.load_config(config_file)   M        self.conversation = [{"role": "system", "content": self.system_info}]   <        self.add_message("assistant", self.greeting_message)          '    def load_config(self, config_file):   ,        with open(config_file, 'r') as file:   $            config = json.load(file)   5            self.model = config.get("model", "gpt-4")   =            self.temperature = config.get("temperature", 0.7)   ;            self.max_tokens = config.get("max_tokens", 150)   1            self.top_p = config.get("top_p", 1.0)   G            self.presence_penalty = config.get("presence_penalty", 0.0)   I            self.frequency_penalty = config.get("frequency_penalty", 0.0)   <            self.user_name = config.get("user_name", "User")   K            self.assistant_name = config.get("assistant_name", "Assistant")   h            self.greeting_message = config.get("greeting_message", "Hello! How can I assist you today?")   >            self.focus_topics = config.get("focus_topics", [])   J            self.system_info = config.get("system_info", "Unknown system")   B            self.stop_sequences = config.get("stop_sequences", [])   B            self.custom_prompts = config.get("custom_prompts", {})   N            self.general_instructions = config.get("general_instructions", "")   \            self.error_handling_instructions = config.get("error_handling_instructions", "")   D            self.response_length = config.get("response_length", "")   Z            self.task_specific_instructions = config.get("task_specific_instructions", {})          �    def set_parameters(self, model=None, temperature=None, user_name=None, assistant_name=None, greeting_message=None, focus_topics=None, system_info=None):           if model:               self.model = model   #        if temperature is not None:   *            self.temperature = temperature           if user_name:   &            self.user_name = user_name           if assistant_name:   0            self.assistant_name = assistant_name           if greeting_message:   4            self.greeting_message = greeting_message           if focus_topics:   ,            self.focus_topics = focus_topics           if system_info:   *            self.system_info = system_info          )    def add_message(self, role, content):   D        self.conversation.append({"role": role, "content": content})              def get_response(self):   2        response = client.chat.completions.create(               model=self.model,   '            messages=self.conversation,   )            temperature=self.temperature,   '            max_tokens=self.max_tokens,               top_p=self.top_p,   3            presence_penalty=self.presence_penalty,   5            frequency_penalty=self.frequency_penalty,   $            stop=self.stop_sequences   	        )   2        return response.choices[0].message.content          >    def save_conversation(self, filename="data/prompts.json"):   )        with open(filename, 'w') as file:   8            json.dump(self.conversation, file, indent=4)       >    def load_conversation(self, filename="data/prompts.json"):   )        with open(filename, 'r') as file:   /            self.conversation = json.load(file)       (    def format_response(self, response):   >        # Use textwrap to format the response for the terminal   b        wrapper = textwrap.TextWrapper(width=80, break_long_words=False, replace_whitespace=False)   3        formatted_response = wrapper.fill(response)              A        # Additional formatting for code blocks and bullet points   ]        formatted_response = formatted_response.replace('```', '\n```').replace('* ', '\n* ')              !        return formatted_response              def chat(self):   $        print(self.greeting_message)           while True:   5            user_input = input(f"{self.user_name}: ")   6            if user_input.lower() in ['exit', 'quit']:   !                print("Goodbye!")                   break                  8            if user_input.lower() in ['help', 'assist']:   q                help_message = random.choice(self.custom_prompts.get("help_messages", ["How can I assist you?"]))   #                print(help_message)                   continue       .            # Add user message to conversation   0            self.add_message("user", user_input)       O            # Add system-level instructions to guide the assistant contextually   A            self.add_message("system", self.general_instructions)   H            self.add_message("system", self.error_handling_instructions)   <            self.add_message("system", self.response_length)   d            self.add_message("system", self.task_specific_instructions.get("computer_problems", ""))   h            self.add_message("system", self.task_specific_instructions.get("motivational_messages", ""))       0            # Get and print assistant's response   *            response = self.get_response()   ?            formatted_response = self.format_response(response)   A            print(f"{self.assistant_name}: {formatted_response}")   3            self.add_message("assistant", response)       if __name__ == "__main__":   !    assistant = OpenAIAssistant()       *    # Load previous conversation if needed       try:   %        assistant.load_conversation()       except FileNotFoundError:           pass           # Start interactive chat       assistant.chat()           # Save conversation   !    assistant.save_conversation()    5��            �                      ;             �                    ^   4                   �      �    ^   4           #       �              A      5��