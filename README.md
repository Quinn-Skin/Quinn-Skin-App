# Quinn-Skin-App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description

It is not easy that we all need to navigate our lives with the quarantine situation around the globe -- disrupted workout routine, balancing work and school life to prevent burnouts, and all those irregular breakouts popped up overnight is probably the last thing we want before all these zoom meetings. Don’t we all want to take good care of ourselves and present our best face in front of others?

Quinn is a mobile app to recommend clean skincare products for men. Users take a five-question survey regarding their skin concerns, and the app will recommend them a curated selection of products, such as some essentials for men: facial cleanser, moisturizer,and suncare.

At Quinn, our goal is to help you build a healthy and easy-to-follow skincare routine. No more confusion and frustration. Want a glowy skin for your next zoom meeting? Come and join Quinn!

### App Evaluation
- **Category:** Skincare, Wellness,and Social
- **Mobile:** The MVP version of Quinn recommends products by taking the survey answers as inputs and incorporating a content-based recommender model at the backend to understand their skincare needs better. After taking the survey, users will receive details on the recommended product, such as product description, product image, price, and a product link to the e-commerce site. Eventually, Quinn aims to add product reviews, calendar-based skin monitoring, experience, or other social sharing functions into the app.

- **Story:** Users start by answering a five-question survey,including skin concern, skin type, products, and budget. Quinn provides users a detailed page on the recommended product. Users could then choose to click on 'take the survey' to search for another product or click on the 'visit product' link to purchase the product on an e-commerce site.

- **Market:** Quinn targets men's skincare market. According to our research and experiences, the men's skincare market is largely untapped and has a great market potential post-COVID. Shopping for men's skincare products are confusing and overwhelming to many people, even to girls. We see Quinn as a solution for various users, not just skincare junkies looking for products for their skin, but also women looking for skincare products for the important males in their life!

- **Habit:** We see Quinn's usage peaks around the holiday season when people are shopping for their families, friends, and loved ones. We also project a higher use around anniversaries, birthdays, and the change of seasons (subjected to an individual user)

- **Scope:** The main feature for Quinn is to provide product recommendations. Currently, it will present the recommended product one at a time. We hope to expand it to offer an entire three-product routine all at once in the future without having users taking the survey over and over again. And add the features mentioned in the mobile section above. 

## Product Spec
### 1. User Stories 

**Required Must-have Stories**

* About page explaining what Quinn is and the process of using it (**in progress**)
* A simple five-question survey where users select answers (no written response and sharing personal information required) (**completed**)
* A recommended product page, including product name, description, price, image and a link to view on product e-commerce site (**in progress 80% done **)
* Go back to take the survey button for users to search for more products (**in progress**)


**Optional Nice-to-have Stories**

* create a user profile and login/logout function
* add product reviews for the recommended products to keep users longers within the Quinn App instead of diverting to other sites for product information
* output multiple recommended products all at once to create a skincare regimen for users
* a skin diary -- a calendar and upload selfie function where users could use it to track their skin changes
* social sharing function which allows users to share the recommended products to their circles


### 2. Screen Archetypes

* About Quinn - the introduction of Quinn Skin
* Survey screens - one question per question for five in total
   * users select either one or multiple answers based on the questions by tabbing the screen
* Product recommendation screen - provides product details
   * the recommender model will offer a relevant product based on the survey
   * user then can click on retake the survey button to go back


### 3. Navigation

**Tab Navigation** 
* Survey selection 
* Navigating to the next question
* Take the survey again
* Visit product details link directs users t the e-commerce site


**Flow Navigation** 
* Introducing Quinn and how the process works 
* Taking the five-question survey 
* Providing a recommended product 
* retaking the survey if needed OR leave the app

## Wireframes
<img src="http://g.recordit.co/wH3ZriSZws.gif" width=800><br>

## Schema 
### Models
#### GET

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | productId     | String   | return recommended product id from the recommender model |
   | productName   | String   | full product name |
   | imageURL      | String   | product image url |
   | description   | String   | product description |
   | price         | Integer  | product price |
   | productURL    | String   | product link to e-commerce site |
   
   
### Networking
#### List of network requests by screen

   - Survey Screen
      - (Create/POST) send a POST request with user input data gatered through the survey to the API
   - Recommended Product Screen
      - (Read/GET) Receive the recommended product inference result
      - (Read/GET) Receive a product description 
      - (Read/GET) Receive a product image URL
      - (Read/GET) Receive the product price
      - (Read/GET) Receive the product URl directed to the e-commerce site
      
   Note: the team deployed the following API endpoints to Heroku t retrive product details and to get recommender model inference
   1. product details: https://quinn-server.herokuapp.com/products/:id
   2. recommende inference : https://quinn-model.herokuapp.com/productid
   
    
    
      
 

      
