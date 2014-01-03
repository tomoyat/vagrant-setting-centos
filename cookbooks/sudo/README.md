sudo Cookbook
=============
参考 https://github.com/opscode-cookbooks/sudo

sudoers.dはsudoersの最後にコメントのような感じで書かれているので注意
```
## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
#includedir /etc/sudoers.d
```
Usage
-----
user-settingで使用したjsonにsudo情報を追加する

hoge.json
```json
{
    "id" : "hoge",
    "user_name" : "hoge",
    "uid" : 1,
    "home" : "/home/hoge",
    "shell" : "/bin/bash",
    "password" : "hased password(openssl passwd -1 password, etc)",
    "ssh_key" : "ssh public key",
    "group_name" : "hoge",
    "gid" : 1,
    "sudoer" : "yes" //ここを追加
}
```
