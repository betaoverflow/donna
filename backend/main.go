package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"webwiz.com/donna/routes/callback"
	"webwiz.com/donna/routes/login"
	"webwiz.com/donna/routes/logout"
	"webwiz.com/donna/routes/templates"
)

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	templates.RenderTemplate(w, "home", "")
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", HomeHandler)
	r.HandleFunc("/callback", callback.CallbackHandler)
	r.HandleFunc("/login", login.LoginHandler)
	r.HandleFunc("/logout", logout.LogoutHandler)

	// store, _ := redis.NewStore(10, "tcp", RedisHost+":"+RedisPort, "", []byte("secret"))
	log.Fatal(http.ListenAndServe(":3000", r))
}
