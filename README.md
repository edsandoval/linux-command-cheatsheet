# linux-command-cheatsheet

Some useful linux commands

## Working the Servers

To start the a simple http server at a single line:

```bash
python -m SimpleHTTPServer 8080
```

To see if a server is listening at a particular port:

```
lsof -i:8080
```


## Working with Programs 

To run a Java jar program as a background process:

```bash
nohup java -jar myProgram.jar 1>/dev/null 2>/dev/null &
```

To check if a Java program is running:

```bash
ps aux | grep -v myProgram.jar | grep -v grep
```

To check what program is running and listening at a partcular port (say 8080):

```bash
lsof -i:8080
```

To kill a process (say a Java process myProgram.jar):

```bash
kill -9 `ps aux | grep myProgram.jar | grep -v grep | awk 'NR==1{print $2}'`
```

To skill a GUI program (after that point and click on the gui to force close it):

```bash
xkill
```

## Working with Security

To see the current status of linux security:

```bash
sudo getenforce
```

To turn off the linux security:

```bash
sudo setenforce 0
```

To turn on the linux security:

```bash
sudo setenforce 1
```

## Passwordless ssh

Configure passwordless ssh from the machine-A to machine-B by performing the following steps:

* step 0: login machine-A and run "ssh-keygen -t rsa"

* Step 1: login machine-B to  to $HOME
* Step 2: run "mkdir .ssh"
* Step 2: touch .ssh/authorized_keys"
* Step 3: run "sudo chmod 700 .ssh"
* Step 4: run "sudo chmod 640 .ssh/authorized_keys"

* Step 5: login onto machine-A and cd to $HOME 
* Step 6: run "cat .ssh/id_rsa.pub | ssh machine-B 'cat >> .ssh/authorized_keys'"

Alternatively, you can run ssh-copy-id which is one-step only

## Working with directories

The following script print the full path of the directory containing the bash script being executed:

```bash
#!/usr/bin/env bash
dir_name=`dirname "${BASH_SOURCE-$0}"`
pwd=`pwd`
current_dir=$pwd/$dir_name

echo $current_dir
```




