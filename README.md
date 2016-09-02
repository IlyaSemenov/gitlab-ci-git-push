# Gitlab CI runner that pushes to git

This Gitlab CI runner image allows to deploy a Gitlab project to a remote Git repo (useful for Dokku, Heroku, Deis, etc.)

## How to use

Create `.gitlab-ci.yml`:

```yaml
image: ilyasemenov/gitlab-ci-git-push

stages:
  - deploy

deploy to production:
  stage: deploy
  environment: production
  only:
    - master
  script: git-push dokku@dokku.me:myapp
```

Go to Gitlab > Project > Settings > Variables, and create a variable `SSH_PRIVATE_KEY`:

```
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```
