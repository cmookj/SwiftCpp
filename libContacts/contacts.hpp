//
//  contacts.hpp
//  CppBridgeTest
//
//  Created by Changmook Chun on 2023-02-27.
//

#ifndef contacts_hpp
#define contacts_hpp

#include <string>
#include <vector>

class contact {
public:
  contact (const std::string&, const std::string&, const uint64_t);

  const std::string&
  name () const;

  const std::string&
  address () const;

  uint64_t
  phone_number () const;

  void
  set_name (const std::string&);

  void
  set_address (const std::string&);

  void
  set_phone_number (const uint64_t);

private:
  std::string _name;
  std::string _address;
  uint64_t    _phone_number;
};

class contacts {
public:
  contacts() = default;

  std::size_t
  size () const;

  contact&
  operator[] (const std::size_t);

  const contact&
  operator[] (const std::size_t) const;

  void
  new_contact (const std::string&, const std::string&, const uint64_t);

private:
  std::vector<contact> _people;
};

#endif /* contacts_hpp */
