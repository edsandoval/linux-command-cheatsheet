# Some commonly used vim commands

## Edit

To change to edit mode:

```bash 
i 
```

## Save 

To save and exit:

```bash
:wq
``` 

## Exit

To exit without save:

```bash 
:q 
```

## Delete

To delete the current line:

```bash 
d$
```

To delete all content in a file:

```bash
:1,%d
```

## Find and Replace

To replace the word "foo" with the word "bar" in the current line:

```bash 
:s/foo/bar/
```

To replace all instances of the word "foo" with the word "bar" in the currently opened text file:

```bash 
:%s/foo/bar/g
```

