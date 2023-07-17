# minecraft-bedrock-server-roka

- 移行後のJava版: <https://github.com/aoirint/minecraft-java-server-roka>

```shell
mkdir -p data backups logs
chown -R 1000:1000 data backups logs
```

```shell
make whitelist-add GAMER_TAG=mygamertag
```

```fstab
/backup/to/backups /original/from/backups fuse.bindfs rw,user,uid=root 0 0
/backup/to/logs /original/from/logs fuse.bindfs rw,user,uid=root 0 0
```

