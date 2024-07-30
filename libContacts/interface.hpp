//
//  interface.h
//  Contacts
//
//  Created by Changmook Chun on 2023-02-28.
//

#ifndef interface_hpp
#define interface_hpp

/* The classes below are exported */
#pragma GCC visibility push(default)

// #ifdef __cplusplus
// extern "C" {
// #endif

int
createContacts ();

void
addContact (const char*, const char*, const unsigned long long);

int
countContacts ();

const char*
nameAt (const unsigned);

const char*
addressAt (const unsigned);

unsigned long long
phoneNumberAt (const unsigned);

void
setNameAt (const unsigned, const char*);

void
setAddressAt (const unsigned, const char*);

void
setPhoneNumberAt (const unsigned, const unsigned long long);

// #ifdef __cplusplus
// }
// #endif

#pragma GCC visibility pop
#endif /* c_interface_h */
