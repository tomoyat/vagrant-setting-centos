user-setting Cookbook
=====================
- ユーザー作成
- sshの鍵を配置
- .vimrcなどを配置

Usage
-----
- data_bags以下にユーザー情報を入れる
- data_bagsは.gitignoreしておく

配置
```
data_bags
└── users
    └── hoge.json
```

hoge.json
```
{
    "id" : "hoge",
    "user_name" : "hoge",
    "uid" : 1,
    "home" : "/home/hoge",
    "shell" : "/bin/bash",
    "password" : "hased password(openssl passwd -1 password, etc)",
    "ssh_key" : "ssh public key",
    "group_name" : "hoge",
    "gid" : 1
}
```

