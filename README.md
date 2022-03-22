# Shelflife

A mobile application version of the PWA Shelflife.

## Goal of the project

- To provide Shelflife users with a mobile app experience of the retailer app that works seamlessly on both android and ios.
- To implement native features such as notifications as part of the mobile experience.
- To decouple the retailer interface as much as possible from our larger ecosystem of SL users.
- To improve user retention unto the service.
- To make Shelf life more accessible to our users.

## Plan of action 
- Build out the current retailer user interface using flutter.
- Implement the core business logic in relation to how the retailer app should behave.
- Integrate a SL specific REST API to communicate with our backend infrastructure.
- Integrate the mobile app with our current CI/CD tool set to run integration tests etc.
- Acceptance testing which can be done concurrently as the core features of the app are built.
- Deploy the app in beta phase for select users to test and gain feedback to increment on work done.
- Deploy a stable build of the app unto the play store.

## Highlevel SL API requirements
`GET` methods
- /auth/username:password
- /user/:fsid
- /subscriptions/:fsid
- /deliveries/:fsid
- /stock-counts/:fsid
- /invoice/:fsid
- /recommendations/:market

`POST` methods
- /topup/ => sends order request to order DB in request body 
- /subscription => sends a modified subscription object to integrated data
- /user/ => modify user properties like display name & email

Also external API access to SL's intercom

### Development methodology to be used is 

## Progress made so far
- [x] Working bottom navigation bar for five main screens 
- [x] Implemented initial UI components needed for Home, Products, Finance, Deliveries and Count screen.
- [x] Topup UI and logic workflow is currently being worked on.

## Screeshots of current UI
<p align="center">
  <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/home.png?raw=false" width="30%">
   <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/product.png?raw=false" width="30%">
   <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/finance.png?raw=false" width="30%">
</p>

<p align="center">
  <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/deliveries.png?raw=false" width="30%">
   <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/delivery-view.png?raw=false" width="30%">
  <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/topup-selection.png?raw=false" width="30%">
</p>

<p align="center">
  
   <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/topup-confirm.png?raw=false" width="30%">
   <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/topup-modal.png?raw=false" width="30%">
  <img src="https://github.com/ngbede/shelflife/blob/main/assets/screenshots/topup-final.png?raw=false" width="30%">
</p>





