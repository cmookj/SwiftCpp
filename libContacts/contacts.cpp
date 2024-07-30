//
//  contacts.cpp
//  CppBridgeTest
//
//  Created by Changmook Chun on 2023-02-27.
//

#include "contacts.hpp"

#include <iostream>

contact::contact (const std::string& name, const std::string& address, const uint64_t phone_number)
    : _name{name}
    , _address{address}
    , _phone_number{phone_number} {
  std::cout << "New contact"
            << "\n\tName: " << _name << "\n\tAddress: " << _address
            << "\n\tPhone number: " << _phone_number << std::endl;
}

const std::string&
contact::name() const {
  return _name;
}

const std::string&
contact::address() const {
  return _address;
}

uint64_t
contact::phone_number() const {
  return _phone_number;
}

void
contact::set_name (const std::string& n) {
  _name = n;
  std::cout << "Name: " << _name << std::endl;
}

void
contact::set_address (const std::string& a) {
  _address = a;
  std::cout << "Address: " << _address << std::endl;
}

void
contact::set_phone_number (const uint64_t n) {
  _phone_number = n;
  std::cout << "Phone number: " << _phone_number << std::endl;
}

std::size_t
contacts::size() const {
  return _people.size();
}

contact&
contacts::operator[] (const std::size_t idx) {
  return const_cast<contact&> (static_cast<const contacts&> (*this)[idx]);
}

const contact&
contacts::operator[] (const std::size_t idx) const {
  if (0 <= idx && idx < _people.size()) return _people[idx];
  else throw std::runtime_error ("Out of range");
}

void
contacts::new_contact (
    const std::string& name,
    const std::string& address,
    const uint64_t     phone_number
) {
  _people.push_back (contact{name, address, phone_number});
}
