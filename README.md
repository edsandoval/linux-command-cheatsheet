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


