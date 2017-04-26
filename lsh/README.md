# lsh

lsh is a toy shell, written in C. It has the ability to invoke programs, and comes with the builtin functions:

- cd
- help
- exit

## Example

```shell
$ ./lsh                                                                                                                                                                                  master
> pwd
/home/user/code/practice/lsh
> cd ..
> pwd
/home/user/code/practice
> python
Python 2.7.13
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
>
```

## Install

Download source code with git:

```shell
$ git clone TODO
$ cd practice/lsh
```

Compile source:

```
$ gcc -Wall -g -o lsh lsh.c
```

Run:

```
$ ./lsh
>
```
