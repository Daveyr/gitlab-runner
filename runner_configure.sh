gitlab-runner register -n \
    --request-concurrency $2 \
    --url https://gitlab.com/ \
    --registration-token $1 \
    --executor docker \
    --description "Pi Runner" \
    --docker-image "docker:stable" \
    --docker-privileged
