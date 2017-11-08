# README

To run the app:

```
git clone "git@github.com:som4ik/EMT.git"

cd EMT
bundle
rake db:create db:migrate
```
start server
```
thin start
```


## post curl ex:
```
curl -x POST --data "longUrl=https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop/related?hl=en}{Y|/|" "http://localhost:3000"
```
answer:
```
{"url":"http://localhost:3000/fd8bc3fc8d"}
```

##get on given url
```
curl "http://localhost:3000/fd8bc3fc8d"
```


and it's good to go.
