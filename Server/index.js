const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");

const middlewares = jsonServer.defaults();
const loginResponse = require("./response/login_response_200_OK.json");
const signUpResponse = require("./response/signUp_response_200_OK.json");
const verificationResponse = require("./response/verification_response_200_OK.json");
const dbjson = require("./db.json");

// AUTHENTICATION ENDPOINTS

server.post("/login", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {

        res.status(202).jsonp(loginResponse);
        
    }, delay);
});

server.post("/signUp", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {

        res.status(202).jsonp(signUpResponse);
        
    }, delay);
});

server.post("/verification", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {

        res.status(202).jsonp(verificationResponse);
        
    }, delay);
});

// USER MIDDLEWARE
// Es la capa intermedia entre endpoints de authentication y todos los demas endpoints
server.use((req, res, next) => {
    console.log("token " + req.query.apiKey);

    if (req.query.apiKey.length === 0) {
        res.status(401).jsonp({
            status: "error",
            data: null,
            message: "Token is incorrect",
        });
    } else {
        //Not a post request. Let db.json handle it
        next();
    }
});
// LOS DEMAS ENDPOINTS

//Server
server.use(router);
server.listen(8011, () => {
    console.log("JSON Server is running");
});

