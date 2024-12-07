import sqlite3
from os import system

db_path = 'records.db'

def main():
    choice = main_menu()

    if choice == 1:
        search()
    elif choice == 2:
        report()
    else:
        log('Program exited in main.')
        exit('Goodbye!')
    
    #main()

def search():
    log('Searching for a patient')

    print('\nPlease select a search method:')
    print('1. Search by first name')
    print('2. Search by last name')
    print('3. Search by date of birth')
    print('4. Search by phone number')
    print('5. Back to main menu')

    while True:
        try:
            choice = int(input('Enter the number of your choice: '))
            if choice in range(1, 6):
                break
            else:
                print('Please enter a valid choice.')
        except ValueError:
            print('Please enter a valid input.')
            search()
            return
    
    if choice >= 5:
        main()
        return

    search_term = input('Enter your search term: ')

    results = None
    if choice == 1:
        results = get(f"SELECT * FROM patients WHERE FirstName LIKE '{search_term}%'")
    elif choice == 2:
        results = get(f"SELECT * FROM patients WHERE LastName LIKE '{search_term}%'")
    elif choice == 3:
        results = get(f"SELECT * FROM patients WHERE DateOfBirth = '{search_term}'")
    elif choice == 4:
        results = get(f"SELECT * FROM patients WHERE Phone = '{search_term}'")

    if not results:
        print('No results found.')
        search()
        return
    format_list_patients(results)

def format_list_patients(patient):
    print(f'\n{'PIN':<4}| {'First Name':<15}| {'Middle Name':<15}| {'Last Name':<15}| {'DOB':<10}')
    print('-------------------------------------------------------------------------')
    for p in patient:
        print(f'{p[0]:<4}| {p[1]:<15}| {p[2] if p[2] else '':<15}| {p[3]:<15}| {p[4]:<10}')

    choice = input('Enter the PIN you would like to view: ')
    patient = get(f"SELECT * FROM patients WHERE PIN = {choice}")
    format_patient(patient[0])
    
    reset()

def reset():
    input('\nPress Enter to return to the main menu.')
    main()

def format_patient(patient):
    clear()
    middle_name = patient[2] if patient[2] else ''

    print(f'PIN: {patient[0]}')
    print(f'First Name: {patient[1]:<15}\tMiddle Name: {middle_name:<15}\tLast Name: {patient[3]:<15}')
    print(f'Date of Birth: {patient[4]:<15}\tGender: {patient[5]}')
    print(f'Phone Number: {patient[6]}')
    print(f'Address: {patient[7]}')
    patient_conditions = get(f"SELECT * FROM Patient_Conditions WHERE PIN = {patient[0]}")
    if patient_conditions:
        print(f'\n{'Patient Conditions':<20}| {'Date of Diagnosis':<10}')
        print('----------------------------------------------')
        for condition in patient_conditions:
            print(f'{condition[1]:<20}| {condition[2]:<10}')
    
    patient_allergies = get(f"SELECT * FROM Patient_Allergies WHERE PIN = {patient[0]}")
    if patient_allergies:
        print(f'\n{'Patient Allergies':<20}| {'Last Updated':<10}')
        print('----------------------------------------------')
        for allergy in patient_allergies:
            print(f'{allergy[1]:<20}| {allergy[2]:<10}')

def clear():
    system('cls')

def report():
    print('\nWhat report do you want to run?')
    print('1. List of all patients')
    print('2. List of all patient conditions')
    print('3. List of all patient allergies')
    print('4. Back to main menu')

    while True:
        try:
            choice = int(input('Enter the number of your choice: '))
            if choice in range(1, 5):
                break
            else:
                print('Please enter a valid choice.')
        except ValueError:
            print('Please enter a valid input.')
            search()
            return

    results = None
    if choice == 1:
        results = get(f"SELECT * FROM patients")
    elif choice == 2:
        results = get(f"SELECT DISTINCT ConditionName, Description FROM Conditions NATURAL JOIN Patient_Conditions")
    elif choice == 3:
        results = get(f"SELECT DISTINCT AllergyName FROM Patient_Allergies")
    else:
        main()
        return

    if not results:
        print('No results found.')
        reset()
        return
    
    if choice == 1:
        format_list_patients(results)
    elif choice == 2:
        print(f'\n{'Condition Name':<25}: {'Description'}')
        print('------------------------------------------------------------')
        for condition in results:
            print(f'{condition[0]:<25}: {condition[1]}')
    elif choice == 3:
        print('\nAllergy Name')
        print('------------')
        for allergy in results:
            print(allergy[0])
    
    reset()

def main_menu():
    clear()
    print('What would you like to do?')
    print('1. Search for a patient')
    print('2. Run a report')
    print('3. Exit')

    while True:
        try:
            choice = int(input('Enter the number of your choice: '))
            if choice in range(1, 4):
                return choice
            else:
                print('Please enter a valid choice.')
        except ValueError:
            print('Please enter a valid input.')
            input('Press Enter to continue.')
            return main_menu()

def get(str : str):
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        cursor.execute(str)
        ret = cursor.fetchall()

        conn.close()
    except sqlite3.Error as e:
        exit(f"Error connecting to database: {e}")
    
    log('Database -get- connection closed.')
    return ret

# Initialize a flag to check if the function has been called
is_first_call = True
def log(message):
    global is_first_call
    
    # Open the file in the correct mode
    mode = 'w' if is_first_call else 'a'
    
    # Write the message to the file
    with open('log.txt', mode) as log_file:
        log_file.write(message + '\n')
    
    # Mark that the function has been called
    if is_first_call:
        is_first_call = False

if __name__ == '__main__':
    main()  