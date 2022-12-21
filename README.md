# Amazon Clone 
> Hello world! This is the project’s summary that describes the project plain and simple, limited to the space available.

> This is a Full Stack Mobile application and my second experience to learn and code with Flutter Framework as main project goal by cloning simple amazon ecommerce.

**[USER STORIES](#user-stories) • [IMPLEMENTATION](#implementation) • [INSTALLATION](#installation)**

## Stacks
#### Frontend: 
- Flutter
#### Backend:
- NodeJS, MongoDB

<a id="user-stories"></a>
## User Stories:
#### &nbsp; &nbsp; &nbsp; As User:

- I want to add products to my cart anytime I want.
- I want to search and filter products by name or category.
- I want to view all my orders.
- I want to submit and finalize my order.

#### &nbsp; &nbsp; &nbsp; As an Admin:

- I want to be able to view all products.
- I want to be able to view add products.
- I want to be able to view delete any product.
- I want to be able to view all orders.
- I want to be able to view products sold by categories statistics and total earnings.

<br></br>
<a id="implementation"></a>

## Implementation
---------------
### User:
---------------
| Login | SignUp | Home | Category |
| ------- | ------------ | -------- | --------- |
|![login](./readme_assets/user/login.png)| ![signup](./readme_assets/user/signup.png)|![home](./readme_assets/user/home.png)|![category](./readme_assets/user/category.png)|

| Search Input | Search Screen | Product Details | Add Review/To Cart |
| ------- | ------------ | -------- | --------- |
|![search_input](./readme_assets/user/search_1.png)| ![search_screen](./readme_assets/user/search_2.png)|![product_details](./readme_assets/user/product_details.png)|![product_details2](./readme_assets/user/product_details_2.png)|

| Cart | Increment Quantity Cart | Submit Order | My Orders |
| ------- | ------------ | -------- | --------- |
|![cart](./readme_assets/user/cart_1.png)| ![cart_2](./readme_assets/user/cart_2.png)|![order](./readme_assets/user/submit_address.png)|![my_orders](./readme_assets/user/my_orders.png)|

<br></br>
---------------

### Admin
---------------
| All Products | Delete Product | Add Product | Statistics |
| ------- | ------------ | -------- | --------- |
|![products](./readme_assets/admin/all_products.png)| ![delete_product](./readme_assets/admin/delete_product.png)|![add_product](./readme_assets/admin/add_product.png)|![stats](./readme_assets/admin/stats.png)|

| All Orders | 
| ------- |
|![stats](./readme_assets/admin/all_orders.png)| 

<br></br>
<a id="installation"></a>

## Installation
1. Clone the repo
   ```sh
   git clone https://github.com/mohammadammash/amazon_clone.git
   ```
2. Navigate to the backend folder and run the following commands:
   ```sh
   npm install
   #[After npm install terminates successfully]:
  -Copy '.env.example' file and rename it to '.env' and fill the empty variables
   #[Finally run your server]
   npm start
   ```
3. Navigate to the frontend folder and run following commands:
   ```sh
   flutter pub get
   #[Navigate to src/networks/base.ts and replace base url by current local IPv4:Port]
   run with or without debugging on your emulator
   ```
4. Enjoy your tour🎉.