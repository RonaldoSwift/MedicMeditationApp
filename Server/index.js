const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");

const middlewares = jsonServer.defaults();
const loginResponse = require("./response/login_response_200_OK.json");
const signUpResponse = require("./response/enviarCodigo_response_200_OK.json");
const verificationResponse = require("./response/registrarUsuario_response_200_OK.json");
const errorResponse = require("./Response/error_Response_404.json");
const dbjson = require("./db.json");


server.use(middlewares);
server.use(jsonServer.bodyParser); // Sirve para interpretar el request 

// AUTHENTICATION ENDPOINTS

server.post("/login", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {
        console.log("request: " + JSON.stringify(req.body));

        console.log("El correo es = "+ req.body.email);
        if (req.body.email == "") {
            res.status(403).jsonp(errorResponse)
            return
        }
        if (req.body.pasword == "")  {
            res.status(401).jsonp(errorResponse)
            return
        }
        
        let filterUsers = dbjson.users.filter ( (user) =>
            user.email == req.body.email
        );

        if (filterUsers.length == 0) {
            res.status(403).jsonp(errorResponse)
        } else {
            res.status(202).jsonp(loginResponse);
        }
    }, delay);
});

// por ahora 
server.post("/enviarCodigo", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {
        console.log("request: " + JSON.stringify(req.body));

        if (req.body.email == "") {
            res.status(401).jsonp(errorResponse)
            return
        }

        res.status(202).jsonp(signUpResponse);

    }, delay);
});

server.post("/registrarUsuario", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {
        console.log("request: " + JSON.stringify(req.body));

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

