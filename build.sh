elm make Main.elm --output dist/bundle.js
cat index.html | sed -e "s#dist#$PUBLIC_URL#" > dist/index.html
