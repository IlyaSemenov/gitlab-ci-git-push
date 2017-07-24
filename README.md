# GitLab CI runner that pushes to git

This GitLab CI runner image allows to deploy a GitLab project to a remote Git repo (useful for Dokku, Heroku, Deis, etc.)

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

Go to GitLab > Project > Settings > CI/CD Pipelines > Secret Variables, and add a variable `SSH_PRIVATE_KEY`:

```
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```

### Pushing to a branch other than master

By default, `git-push` will push to branch `master` of a remote repository (that's what Dokku wants). You can override this with:

```console
git-push user@git.host:repo branch
```

### Pushing to Git running on a non-standard port

```console
git-push ssh://dokku@dokku.me:8022/myapp
```
