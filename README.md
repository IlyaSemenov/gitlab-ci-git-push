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

Go to GitLab > Project > Settings > CI/CD > Secret Variables, and add a variable `SSH_PRIVATE_KEY`:

```
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```

Make sure your private ssh key is not encrypted, or Gitlab won't be able to authenticate. You'll know if it is encrypted if you open it up and the top has something like:

```
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
```

If it is, you can decrypt it by running: `openssl rsa -in enc.key -out dec.key`

### Pushing to a branch other than master

By default, `git-push` will push to branch `master` of a remote repository (that's what Dokku wants). You can override this with:

```console
git-push user@git.host:repo branch
```

### Pushing to Git running on a non-standard port

```console
git-push ssh://dokku@dokku.me:8022/myapp
```

### Not doing force push

By default, git push will be forced. You can disable force push by setting environment variable `DISABLE_FORCE_PUSH` to any value.
