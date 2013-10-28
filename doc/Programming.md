# Programming

This is a stub for us to document our programming decisions.  This is not required for submission 3.2.

## Basic coding

For now, I'm going to document code and thoughts I used for scaffolding here:

creating the users 

creating the grocery items model:
rails generate scaffold grocery_item description:string shared:boolean number_needed:integer max_price:decimal

creating the grocery_list model:
rails generate scaffold grocery_list name:string due:datetime

creating the user's model:
rails generate scaffold users email:string password_digest:string name:string


* note sure if we need anything else on the grocery list

## Modularity

### Code

### Specifications

## Verification

### Runtime assertions

### Unit tests

## Security

### Code
