import random
import string

def get_random_password(letters_count, digits_count):
    letters = ''.join((random.choice(string.ascii_letters) for i in range(int(letters_count))))
    digits = ''.join((random.choice(string.digits) for i in range(int(digits_count))))

    # Convert resultant string to list and shuffle it to mix letters and digits
    sample_list = list(letters + digits)
    sample_list.append("A")
    random.shuffle(sample_list)
    # convert list to string
    final_string = ''.join(sample_list)
    return final_string

def get_random_username(length):
    # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(int(length)))
    return result_str

