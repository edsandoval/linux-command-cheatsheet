This is prevent accidental commits in my local "master" branch, and allow only pull requests.

This can be done by using a pre-commit hook.

For example, place the following script as .git/hooks/pre-commit:

<pre>
#!/bin/bash
if test $(git rev-parse --abbrev-ref HEAD) = "master" ; then 
  echo "Cannot commit on master"
  exit 1
fi
<pre>

And set it as executable

chmod +x .git/hooks/pre-commit
