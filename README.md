Wraps https://github.com/discourse/email_reply_trimmer into a docker container and offers trimming services via HTTP.

## Usage

Run the docker container:

```sh
docker run -it --network host karrot/email_reply_parser
```

Then ask it to trim a plaintext email body:

```sh
curl -X POST http://localhost:4567/trim -H "Content-Type: application/json" --data '{"text": "a line\na new line\n> a quotation"}'
```

It should return the trimmed text:

```json
{"trimmed":"a line\na new line"}
```


## Development

```sh
# Install dependencies
bundle install --path .bundle

# Run the server (and restart if file changed)
ls server.rb | entr -r bundle exec ruby server.rb 
```

Commits pushed to `master` are built by Docker Cloud and published at https://cloud.docker.com/u/karrot/repository/docker/karrot/email_reply_trimmer_service
