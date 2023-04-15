# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


API DOCUMENTATION: 

Authentication Required? : NO

Retrieve all customers at bank:
  Request: GET - localhost:3000/api/v1/customers
  Required Parameters: None 
  Response: { 
    customers: [{
        "id":1,
        "name":"James",
        "created_at":"2023-04-15T01:16:22.697Z",
        "updated_at":"2023-04-15T01:16:22.697Z"
        }]
      }

Retrieve specific customer at bank: 
  Request: GET - localhost:3000/api/v1/customers/{customer_id}
  Required Parameters: customer_id (integer)
  Response: { 
    customer: {
        "id":1,
        "name":"James",
        "created_at":"2023-04-15T01:16:22.697Z",
        "updated_at":"2023-04-15T01:16:22.697Z"
        }
      }

Retrieve Balance/Account Info for specific account:
  Request: GET - localhost:3000/api/v1/customers/{customer_id}/accounts/{account_id}
  Required Parameters: customer_id (integer), account_id (integer)
  Response:  { 
    account_info: { 
      id: 1, 
      customer_id: 1,  
      balance: 1000, 
      created_at: "2023-04-15T01:16:22.730Z", 
      updated_at: "2023-04-15T01:16:22.730Z" 
      } 
    } 

Create New Account for customer:
  Request: POST - localhost:3000/api/v1/customers/{customer_id}/accounts
  Required Parameters: customer_id (integer), "name": (string), "amount": (integer)
  response: {
    "account_info": {
        id: 14,
        customer_id: 1,
        balance: 450,
        created_at: "2023-04-15T02:39:13.920Z",
        updated_at: "2023-04-15T02:39:13.920Z"
    },
    "balance": 450
}

Retrieve transfer history for given account:
  Request: GET - Localhost:3000/api/v1/customers/{customer_id}/accounts/{account_id}/transfers
  Required Parameters: customer_id (integer), account_id (integer)
  Response: {"transfers":[{id:1,amount:150,recipient_account_id:2,account_id:1,created_at:"2023-04-15T01:16:22.751Z",updated_at:"2023-04-15T01:16:22.751Z"}]}

Initiate a transfer between 2 accounts: 
  Request: POST - Localhost:3000/api/v1/customers/{customer_id}/accounts/{account_id}/transfers
  Required Parameters: customer_id (integer), account_id (integer), amount (integer), recipient_account_id (integer)
  Response: {
    new_transfer:{
      id:5,amount:50,
      recipient_account_id:2,
      account_id:1 ,
      created_at:"2023-04-15T02:52:44.749Z",
      updated_at:"2023-04-15T02:52:44.749Z"
      }
    }
