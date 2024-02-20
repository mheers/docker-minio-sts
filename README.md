# Minio-sts

Adds Dockerimages for Minio with STS support.

https://github.com/minio/minio/tree/master/docs/sts

I build two images:

- `mheers/minio-sts` - includes just the binaries for
    - assume-role
    - client-grants
    - custom-token-identity
    - ldap
    - web-identity
- `mheers/minio-client` is a fork of `bitnami/minio-client:2024.2.9-debian-11-r0` and so it also includes the `mc` command line tool
