## User Stories

- As a guest I should be able to sign up with name, email and password.
- As a guest I should be able to sign in with email and password.
- As a first registered user in the system, I become a Lunches Admin.

- As a user I can edit my profile
- As a user I can see a weekdays on the dashboard page
- As a user, when I click on the weekday(today or days in the past), I can see menu ­ list of items with prices.
- As a user, when I choose items from menu, I can only choose one item from the first course, one item from the main course and one drink. Total 3 items.
- As a user I can press Submit button to process my order.

- As a Lunches Admin, I can browse registered users.
- As a Lunches Admin, I can browse days and see users’ orders there.
- As a Lunches Admin, I can add items in menu only for today by adding a name and price.
- As a Lunches Admin, on the date page I can see the list of orders and total launch cost for today.

- As a system, I should be able to provide list of the orders for today with details for each person through RESTful JSON API endpoint. 
- As a system, I should have a secure API.

## Data

**User**

_has_many : orders_
- email 
- password
- name
- admin

**Product**

_has_many : menus_
- name
- course

**Menu**

_belongs_to : product_
_belongs_to : organizations_
- price
- period_from
- period_to

**Organizations**

_has_many : menus_
- name

**Order**

_belongs_to : user_
_has_many : order_product_
- date

**OrderProducts**

_belongs_to : order_
_belongs_to : menu_

## Pages 
- Welcome Page (welcome#index)
- Dashboard Page (welcome#dashboard)
- Profile Edit (users#edit)
- New Order (order#new)
- My Orders (order#show)

**admin namespace**
- Users list(users#index)
- Orders list(order#index)
- New menu(menu#new)

## Additional 

**tasks**
- Add organizations 
- Add registration through Google Apps 
- Auto Suggest for menu items 
- Weekly Menus 

**js libraries**
- typeahead