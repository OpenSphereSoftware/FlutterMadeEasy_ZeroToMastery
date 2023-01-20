import 'dart:io';

class Contact {
  String name;
  String email;
  String phone;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
  });

  String stringFormat() {
    return 'Name: $name, Email: $email, Phone: $phone';
  }
}

class ContactsAdministrator {
  List<Contact> contacts = [];

  void add() {
    print('Enter contact details:');
    print('Name:');
    String name = stdin.readLineSync() ?? '';
    print('Email:');
    String email = stdin.readLineSync() ?? '';
    print('Phone:');
    String phone = stdin.readLineSync() ?? '';

    Contact newContact = Contact(
      name: name,
      email: email,
      phone: phone,
    );
    contacts.add(newContact);
    print('Contact added successfully');
  }

  void display() {
    if (contacts.isEmpty) {
      print('No contacts available');
    } else {
      for (int i = 0; i < contacts.length; i++) {
        print('Index: ${i + 1}, ${contacts[i].stringFormat()}');
      }
    }
  }

  void delete() {
    if (contacts.isEmpty) {
      print('No contacts available');
    } else {
      print('\n\nCurrent Contacts:');
      display();
      print('\n\nEnter the index of the contact to delete:');
      int index = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
      index -= 1;
      if (index >= 0 && index < contacts.length) {
        contacts.removeAt(index);
        print('Contact deleted successfully');
      } else {
        print('Invalid index');
      }
    }
  }
}

void printMenu() {
  print('Contacts Manager');
  print('1. Add contact');
  print('2. Display contacts');
  print('3. Delete contact');
  print('4. Exit');
  print('Enter your choice:');
}

void main() {
  ContactsAdministrator contact = ContactsAdministrator();
  for (;;) {
    printMenu();
    int choice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    switch (choice) {
      case 1:
        contact.add();
        break;
      case 2:
        contact.display();
        break;
      case 3:
        contact.delete();
        break;
      case 4:
        exit(0);
      default:
        print('Invalid choice');
    }
  }
}
