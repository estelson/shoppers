# shoppers

A new Flutter project.

## Getting Started

* Configure Stripe Backend project and populate Firestore databases
  * Create service_key.json
    * You need to create a private key from firebase. Goto project settings --> service accounts --> click on Generate new private key. Place the downloaded file under files/ folder with name service_key.json
    * Copy backend-stripe-main project from https://github.com/techTutorialsYTube/backend-stripe to root Shoppers project
    * Go to backend-stripe folder and execute in terminal: npm install
    * Execute uploader.js script to populate Firestore database
  * After this, configure Firestore rules