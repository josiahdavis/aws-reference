# Conda 

## Install miniconda
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

## Create the environment
`conda create -yn <myname> python=3.9`

## Make it show up in ipython/jupyter notebook interactive session
```
conda install -y ipykernel
python -m ipykernel install --user --name=<myname>
# Now it should be there when you type `ipython` on EC2 or MAC
```

## Delete the environment
`conda env remove -n <myname>`

# Git

## gitconfig

```
git config --global user.name "Josiah Davis"
git config --global user.email josiah.j.davis@gmail.com
git config --global alias.st "status"
git config --global alias.lol "log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
```

## Codecommit

If you already have some code and want to create repo from scratch:

```
# 1. If you just have some files: 
git init

# 2. Create an empty repository in CodeCommit

# 3. HTTPS git credentials: IAM Role (the one attached to your EC2) > Security Credentials > Generate HTTPS.

# 4. And set the origin
git remote add origin <repository>

# 5. You should be good to go to push/pull
```
