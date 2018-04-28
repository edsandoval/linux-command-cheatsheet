# git rebase 

When you are working on branch-B (for example, your feature branch) and you want to add features developed in branch-B back to branch-A (for example, the master branch) after you complete and test your feature-implementation in branch-B. The following are the commands to rebase branch-A into branch-B (make sure that your local branch-B is update-to-date before running the following command):

```bash
git pull origin branch-A 
git checkout branch-B 
git rebase branch-A 
```

At this point do whatever you need to resolves conflicts after latest codes from branch-A are merged with your own branch-B.

Next after all the conflicts are resolved, run the following commands to commit and push merged content into remote branch-B 

```bash 
git add --all .
git commit -m "rebased from branch-A to branch-B"
git push origin branch-B 
```

Now switch to branch A and rebase the updated branch-B into branch-A by running the following command:

```bash
git checkout branch-A 
git rebase branch-B 
```

If there is no conflict at this point (resolves the any conflicts if any before continue), then you can commit and push the changes to branch-A:

```bash
git add --all .
git commit -m "update branch-A with changes from branch-B"
git push origin branch-A 
```

# change remote origin url

To see what is the remote origin url:

```bash
git remote show origin 
```

Or

```bash
git remote -v
```

To change that to a different url:

```bash
git remote set-url origin https://github.com/chen0040/linux-command-cheatsheet.git
```

# switch the author for committing git change 

You can find out who is the author on your computer that will push the commits to the remote by running the following commands:

```bash
git config --global user.name
git config --global user.email
```

You can switch another author for committing git change by running the following command:

```bash
git config --global user.name "chen0040"
git config --global user.email "xs0040@gmail.com"
```

# undo last add before commit 

If you acidentally add some files wrongly before commit, you can run the following commands to undo add:

```bash
git reset
```

# undo last local commit 

If you accidentally commit some changes locally but want to undo all changes including removes the changes in the files, run the following commands:

```bash
git reset --hard HEAD^1
```

If you just want to undo the commit but not remove changes in the files, run the following commands:

```bash
git reset --soft HEAD^1
```


